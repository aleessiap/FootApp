import React from 'react';
import VideoPlayerActions from "../data/actions/VideoPlayerActions";
import TagsActions from "../data/actions/TagsActions";
import VocalActions from "../data/actions/VocalActions";
import PlayerUtils from "../utils/PlayerUtils";
import TagCombinationUtils from "../utils/TagCombinationUtils";
import {func} from "prop-types";
import NoteActions from "../data/actions/NoteActions";
import { string } from 'pg-format';

//Setup del componente per il riconoscimento vocale
const SpeechRecognition  = SpeechRecognition || window.webkitSpeechRecognition;
const recognition = new SpeechRecognition ();
recognition.lang = "it-it";
recognition.interimResults = true;
let prop;

/**
 * Restituisce il componente grafico dei comandi vocali vocali
 * @param props
 * @returns {*}
 * @constructor
 */
function Speech(props){
    prop = props;
    let listening = props.SpeechStoreState.listening;
    let img = listening ? "images/green.png" : "images/black.png";
    if(listening && props.VideoStoreState.url !==''){
        try {
            recognition.start();
        }
        catch(err) {

        }
    }
    return(
        <div id="div-microphone" onClick={() => toggleListen(props)} >
            <img id="img-microphone" alt="mic" src={img} />
        </div>
    )
}

/**
 * Gestisce lo stato di on e off del riconoscimento vocale ed invia i dati allo store
 * @param props
 */
function toggleListen(props) {
    if(props.VideoStoreState.url === ''){return;}
    let listening = !props.SpeechStoreState.listening;
    handleListen(props,listening);
    VocalActions.SpeechListening(listening);
}

/**
 * Esegue le logiche di riconoscimento vocale
 * @param props
 * @param listening
 */
function handleListen(props,listening) {
    //Se viene attivato il comando vocale viene interrotta la riproduzione del video
    if(listening){
        if(props.VideoStoreState.playing){
            VideoPlayerActions.onPause(false);
        }
        try {
            recognition.start();
        }
        catch(err) {

        }
    }else {
        recognition.stop();
    }
}
//Variabili globali per la gestione degli output della libreria del riconoscimento vocale
let finalTranscript = '';
let levenshtein = require('fast-levenshtein');
let lastComand = '';
let nota = false;
recognition.onresult = event => {
    //InterimTranscript serve per avere i dati parziali del riconoscimento vocale, mentre final ha una precisione migliore ma è più lento
    let interimTranscript = '';

    for (let i = event.resultIndex; i < event.results.length; i++) {
        const transcript = event.results[i][0].transcript;
        if (event.results[i].isFinal){
            finalTranscript = transcript;
        }
        //else
        interimTranscript += transcript;
    }
    //Inizio parte dei comandi specifici dell'interfaccia
    if(interimTranscript.includes('fine nota')) {
        nota = false;
        return;
    }
    if(nota){
        //recupera il testo della nota
        let text = finalTranscript.replace(/nota/g,'');
        NoteActions.update_note(text);
    }
    if(interimTranscript.includes('nota')) {
        nota = true;
        return;
    }
    if(interimTranscript.includes('Avvia video')){
        if(nota){return;}
        if(!prop.VideoStoreState.playing){
            VideoPlayerActions.playPauseVideo(true);
        }
        lastComand = 'Avvia video';
        interimTranscript = '';
        return;
    }
    if(interimTranscript.includes('ferma video')){
        if(nota){return;}
        if(prop.VideoStoreState.playing){
            VideoPlayerActions.playPauseVideo(false);
        }
        lastComand = 'ferma video';
        interimTranscript = '';
        return;
    }
    if(interimTranscript.includes('interrompi')){
        recognition.stop();
    }
    //Di default i comandi seguono sempre il path più lungo(ad esempio esistono le due diverse tagcom passaggio..corto..positivo e passaggio..corto) quindi per scegliere quello meno lungo bisogna usare
    // il comando parziale
    if(interimTranscript.includes('parziale')){
        if(nota){return;}
        if(lastComand !== 'parziale'){
            TagCombinationUtils.checkCompleteCombination(prop,null,null,null,true);
            lastComand = 'parziale';
        }else{
            lastComand = ''
        }
    }
    if(interimTranscript.includes('casa')){
        if(nota){return;}
        if(lastComand!== '' &&  interimTranscript.includes(lastComand)){
            interimTranscript = interimTranscript.replace(lastComand,'');
            interimTranscript = interimTranscript.replace(' ','');
            if(ElabTag(interimTranscript,levenshtein,prop)){
                interimTranscript = '';
                return;
            }
        }
        let numero = interimTranscript.split(" ")[1];
        if(numero){
            let number = parseInt(numero, 10);
            if(numero === 'sei'){
                number = 6;
            }

            for(let index= 0 ; index < prop.PlayerState.HomeTeamFormation.size; index++){
                if(number === prop.PlayerState.HomeTeamFormation.get(index).number){
                    PlayerUtils.handleSelectedPlayer(null,prop.PlayerState.HomeTeamFormation.get(index),prop);
                    lastComand = 'casa ' + number ;
                    interimTranscript = '';
                }
            }
        }
        return;
    }
    if(interimTranscript.includes('fuori')){
        if(nota){return;}
        if(interimTranscript.includes(lastComand)){console.log(lastComand);}
        let numero = interimTranscript.split(" ")[1];
        if(numero === null){return;}
        let number = parseInt(numero, 10);
        if(numero === 'sei'){
            number = 6;
        }
        lastComand = 'fuori ' + number ;
        for(let index= 0 ; index < prop.PlayerState.AwayTeamFormation.size; index++){
            if(number === prop.PlayerState.AwayTeamFormation.get(index).number){
                PlayerUtils.handleSelectedPlayer(null,prop.PlayerState.AwayTeamFormation.get(index),prop);
                interimTranscript = '';
            }
        }
        //Fine parte dei comandi specifici dell'interfaccia
    }else{
        if(nota){return;}
        if(ElabTag(interimTranscript,levenshtein,prop)){
            return;
        }
    }
    return;
};

/**
 * Funzione che elabora il testo e valuta se si tratti di un tag/tagcombination valida e la salva nello store
 * @param interimTranscript
 * @param levenshtein
 * @param prop
 * @returns {boolean}
 * @constructor
 */
function ElabTag(interimTranscript,levenshtein,prop){
    //controllo le possibili combinazioni con la distanza di levenshtein
    console.log(interimTranscript)
    let possible = CheckSpeechWithTolleranceInterim(interimTranscript,levenshtein,prop);
    if(prop.TagsStoreState.possibleTagCombination && prop.TagsStoreState.possibleTagCombination.size >0){
        interimTranscript = '';
        TagCombinationUtils.checkCompleteCombination(prop,prop.TagsStoreState.chosenButtons,prop.TagsStoreState.visibleButtons,prop.TagsStoreState.possibleTagCombination,false);
        return true;
    }
}

recognition.onend = () => {
    if(prop.SpeechStoreState.listening){
        recognition.start();
    }
};
recognition.onerror = event => {
    console.log("Error occurred in recognition: " + event.error)
};
let lastWord = '';
let valid = false;
let valid_word = ['duello difensivo','duello offensivo','anticipo basso','anticipo aereo','contrasto basso','duello aereo','uno contro uno', '1 contro 1','ultra difensiva','ultra offensiva']

function CheckSpeechWithTolleranceInterim(interimTranscript, levenshtein,props) {
    //Variabile che tiene conto dei path possibili
    let possibleTagCombination = [];
    //Se è stato detto qualcosa e non si tratta di rumore
    if (interimTranscript !== '') {
        let includes = false;
        let chosen = props.TagsStoreState.chosenButtons;
        let interimCopy = interimTranscript;
        for(let x=0;x<chosen.size;x++){
            let already_selected =chosen.get(x).name.toLowerCase();
            let split = interimCopy.split(" ");
            for(let j =0; j<split.length;j++){
                if(split[j].toLowerCase() === already_selected){
                    interimCopy = interimTranscript.replace(already_selected,"");
                    interimCopy = interimTranscript.trimStart();
                }
            }
        }

        if(lastWord === interimTranscript){
            return;
        }else if (includes){
            interimTranscript = interimTranscript.trim();
            if(interimTranscript === '' ){return;}
            lastWord = interimTranscript;
        }else{
            lastWord = interimTranscript;
        }

        let tagCombinations = props.TagsStoreState.tagCombinations;
        let possible = props.TagsStoreState.possibleTagCombination;
        let tagsMap = props.TagsStoreState.tagsMap;
        let nextTags = [];
        let visibleButtons = props.TagsStoreState.visibleButtons;
        //Divido ciò che è stato detto(i possibili diversi tag)
        let stringa = interimTranscript.split(' ');
        if(valid_word.includes(interimTranscript.toLowerCase())){
            stringa = interimTranscript.toLowerCase()     
        }
        
        let tags = getTagsFromStringArray(stringa,props);
        if(tags.length ===0){
            valid = false;
            return;
        }
        valid = true;


        let depth = props.TagsStoreState.chosenButtons.size - 1;
        //Se è stato riconosciuto qualcosa al riconoscimento precedente
        if(possible.size !==0){
            for(let index=0;index<tags.length;index++){
                if(visibleButtons.filter(e=> e.id === tags[index].id)){
                    for(let i=0;i<possible.size;i++){
                        let comb = possible.get(i).name;
                        let tag = comb.split(", ")[depth+1];
                        if(tag === tags[index].name){
                            possibleTagCombination.push(possible.get(i));
                            let next = comb.split(", ")[depth+2];
                            if(next){
                                let nextid = tagsMap.get(next);
                                if(nextTags.filter(e => e.id === nextid).length ===0){
                                    nextTags.push({id:nextid,name:next});
                                }
                            }
                        }
                    }
                }
            }
            TagsActions.add_chosens_buttons_speech(tags,nextTags,possibleTagCombination);
            return possibleTagCombination;
        }
        //Viene eseguito se siamo al primo giro,non è stato risconosciuto ancora nulla oppure se si è resettato il giro
        for(let i=0;i< tagCombinations.size;i++){
                let combination = tagCombinations.get(i);
                let combname = combination.name.split(', ');
                if(combname.length < tags.length){continue;}
                let possible = true;
                for(let index = 0;index< tags.length;index++){
                    if(combname[index].toLowerCase() === tags[index].name.toLowerCase()){
                    }else{
                        possible = false;
                        break;
                    }
                    if(index === tags.length-1 && possible){
                        if(combname[index + 1]){
                            let nextid = tagsMap.get(combname[index+1]);
                            let nextname = combname[index+ 1];
                            if(nextTags.filter(e => e.id === nextid).length ===0){
                                nextTags.push({id:nextid,name:nextname});
                            }
                        }
                    }
                }
                if(possible){
                    possibleTagCombination.push(combination);
                }
        }
        let removeindex = [];
        let chosenButtons = props.TagsStoreState.chosenButtons;
        for(let index=0;index < tags.length;index++){
            for(let i=0; i< chosenButtons.size;i++){
                if(tags[index].id === chosenButtons.get(i).id && !removeindex.includes(tags[index].id)){
                    removeindex.push(tags[index].id);
                }
            }
        }
        for(let index=0;index < removeindex.length;index++){
            tags.splice(index,1);
        }
        if(tags.length !==0 && tags){
            TagsActions.add_chosens_buttons_speech(tags,nextTags,possibleTagCombination);
        }
        return possibleTagCombination;

    }else{
        return possibleTagCombination;
    }
}
//Questa funzione non è ancora in grado di riconoscere(non completamente) tag di due parole
function getTagsFromStringArray(interim,props){
    //let double = CheckDoubleWord(props);
    let tags = props.TagsStoreState.tagsMap;
    let tagId = [];
    let result = [];
    let ret = [];
    if(!interim){return ret;}
        let splitResult = interim.toString().split(",");
        let already_contains = false;
        for(let j=0;j<splitResult.length;j++){
            let value = splitResult[j].toUpperCase();
            if(tags.has(value)){
                let tag = tags.get(value);
                if(!props.TagsStoreState.chosenButtonsId.includes(tag)){
                    already_contains = true;
                    tagId.push(tag);
                    result.push({id:tag,name:value});
                }
            }
            if(result.length === 0 && !already_contains){
                tags.keySeq().forEach(k =>{ if(levenshtein.get(k.toUpperCase(),value.toUpperCase())<2){
                    let id = tags.get(k);
                    result.push({id:id,name:k})
                }
                });
            }
        }
        for (let i = 0; i < result.length; i++) {
            for (let j = 0; j < props.TagsStoreState.visibleButtons.size; j++) {
                if(result[i].id === props.TagsStoreState.visibleButtons.get(j).id){
                    ret.push(result[i]);
                }
            }
        }
        return ret;
}
export default Speech;
