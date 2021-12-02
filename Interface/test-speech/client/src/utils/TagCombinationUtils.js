import TagCombinationTableActions from "../data/actions/TagCombinationTableActions";

/**
 * Funzione che controlla se ci siano le condizioni affinchè un evento sia completo
 * @param props
 * @param chosenButtons
 * @param nextButtons
 * @param tagCombination
 * @param partial
 * @returns {boolean}
 */

function checkCompleteCombination(props,chosenButtons,nextButtons,tagCombination,partial = false) {

        let time = props.VideoStoreState.onProgress.playedSeconds.toFixed(2);
        let chosenPlayers = props.TagsStoreState.chosenPlayers;
        let note = props.NotesStore;
        let controTags = props.TagsStoreState.controTags;
        let chosenPath = props.TagsStoreState.chosenPath;
        let selectedMatch = props.MatchesState.selectedMatch;
        let user = props.LoginState.username;
        if(user ===''){user = 'Cannas'};
        let controTag = [];
        let combination = '';
        let path = chosenPath;
        if(chosenPath.size ===0){
            path = props.TagsStoreState.possibleTagCombination;
        }
        //Una combinazione parziale è una di quelle combinazioni particolari che è contenuta in un insieme più grande
        //Ad esempio Passaggio-corto è una combinazione parziale della combinazione Passaggio-corto-orizzontale
        //Se è una tag combination parziale, è true solo se l'utente preme il tasto "Parziale"
        if(partial){
            let id;
            //Se non è stato inserito nessun giocatore
            if(chosenPlayers.size === 0 ){return;}
            let dataPlayer = setDataPlayersColumn(chosenPlayers, false);
            for(let index=0; index < path.size; index++){
                let name = path.get(index).name.split(", ");
                if(name.length !== props.TagsStoreState.chosenButtons.size){continue;}
                let match = true;
                //Vengono effettuate le ricerche per determinare se la combinazione attuale sia contenuta in un'insieme più grande
                for(let i=0;i < name.length; i++){
                    if(name[i]!== props.TagsStoreState.chosenButtons.get(i).name){
                        match = false;
                    }
                }
                if(match){
                    id = path.get(index).id;
                    combination = path.get(index).name;
                    break;
                }
            }
            if(combination === '' && id){return false;}
            //Creo il json con tutti i dati necessari
            let jsonCombination = {players: dataPlayer, tagcombination: combination,note:note, time: time, user: user,player_id:chosenPlayers.get(0).id,match_id:selectedMatch,team_id:chosenPlayers.get(0).team_id,combination_id:id,uploaded: false};
            controTag.push(jsonCombination);
            let values = {defaultButtons: props.TagsStoreState.defaultButtons, tagCombination: controTag};
            addCombination(values);
            return true;
        }
        //Se sono validi sia chosenButton e nextbuttons
        if (chosenButtons && nextButtons) {
            //Se l'utente non può inserire nessun tag aggiuntivo
            if ((nextButtons.length === 0 && chosenPlayers.size > 0) || (nextButtons.size ===0 && chosenPlayers.size >0)) {
                //if necessario sulla base del tipo di dato per non aver errori di conversione
                if(!tagCombination[0]){
                    tagCombination =tagCombination.get(0);
                }else{
                    tagCombination = tagCombination[0];
                }
                let player = chosenPlayers.get(0);
                let combination_id = tagCombination.id;
                let controtagfilter = controTags.filter(x=>x.tagcomb1_id === tagCombination.id);
                //Se è la combinazione inserita presenta un controtag e non viene inserito il giocatore corrispondente, interrompo l'esecuzione
                if(controtagfilter.size > 0 && chosenPlayers.size < 2){
                    return false;
                }
                let dataPlayer = setDataPlayersColumn(chosenPlayers, controtagfilter.size > 0);
                //imposto i dati di controtag
                if (controtagfilter.size > 0 && chosenPlayers.size > 0 ) {
                    controTag = setControTag(controtagfilter, tagCombination.id, player, time, user, chosenPlayers,combination_id,chosenPlayers.get(0).team_id,selectedMatch,tagCombination.id);
                }
                combination = tagCombination.name;
                let jsonCombination = {players: dataPlayer, tagcombination: combination,note:note, time: time, user: user,player_id:chosenPlayers.get(0).id,match_id:selectedMatch,team_id:chosenPlayers.get(0).team_id,combination_id:tagCombination.id,uploaded: false};
                controTag.unshift(jsonCombination);
                let values = {defaultButtons: props.TagsStoreState.defaultButtons, tagCombination: controTag};
                addCombination(values);
                return true;
            }
        } else {
            //se non sono validi i nextbutton controllo comunque se l'utente ha la possibilità di inserire un tag
            //Effettuo gli stessi controlli presenti sopra
            if (props.TagsStoreState.visibleButtons.size === 0) {
                let dataPlayer = tagCombination.last_name;
                let combination_id = path.get(0).id;
                let controtagfilter = controTags.filter(x=>x.tagcomb1_id === path.get(0).id);
                if(controtagfilter.size > 0 && chosenPlayers.size < 2){
                    return false;
                }
                for (let index = 0; index < props.TagsStoreState.chosenButtons.size; index++) {
                    combination += props.TagsStoreState.chosenButtons.get(index).name + ' ';
                }
                if (combination !== '') {
                    let jsonCombination = {players:dataPlayer , tagcombination: combination,note:note, time: time, user: user,player_id:tagCombination.id,match_id:selectedMatch,team_id:tagCombination.team_id,combination_id:combination_id,uploaded: false};
                    if (chosenPlayers.size > 1) {
                        controTag = setControTag(controtagfilter, path.get(0).id, tagCombination, time, user, chosenPlayers,combination_id,tagCombination.team_id,selectedMatch,tagCombination.id);
                    }
                    controTag.unshift(jsonCombination);
                    let values = {defaultButtons: props.TagsStoreState.defaultButtons, tagCombination: controTag};
                    addCombination(values);
                    return true;
                }
            }
        }

}

/**
 * Funzione per impostare il controtag di una tagcombination
 * @param tagcomb
 * @param id
 * @param player
 * @param time
 * @param user
 * @param chosenPlayers
 * @param combination_id
 * @param team_id
 * @param match_id
 * @param player_id
 */
function setControTag(tagcomb,id,player,time,user,chosenPlayers,combination_id,team_id,match_id,player_id){
    let combination = [];
    let dataPlayer = setDataPlayersColumn(chosenPlayers,tagcomb.size>0,true);
    for(let i=0;i<tagcomb.size;i++){
        let tg= tagcomb.get(i);
        let jsonCombination = {players:dataPlayer,tagcombination: tg.tagcomb2_name, time: time, user: user,player_id:player_id,match_id:match_id,team_id:team_id,combination_id:combination_id,uploaded: false};
        combination.push(jsonCombination);
    }
    return combination;
}

/**
 * Parametrizzo i dati del player per inserirli nella tabella e per il successivo salvataggio nel database
 * @param chosenPlayers
 * @param isControTag
 * @param reverse
 * @returns {string}
 */
function setDataPlayersColumn(chosenPlayers,isControTag,reverse = false){
    let dataPlayer;
    let firstPlayer = chosenPlayers.get(0);
    let secondPlayer = chosenPlayers.get(1);
    if(isControTag && reverse){
        firstPlayer = chosenPlayers.get(1);
        secondPlayer = chosenPlayers.get(0);
        dataPlayer = firstPlayer.name + '-' + secondPlayer.name;
    }else if(isControTag){
        dataPlayer = firstPlayer.name + '-' + secondPlayer.name;
    }else{
        dataPlayer = firstPlayer.name;
    }
    return dataPlayer;
}

/**
 * Funzione che innesca semplicemente l'azione dello store per il completamento di un evento
 * @param values
 */
function addCombination(values){
    TagCombinationTableActions.complete_combination(values);
}

export default {
    checkCompleteCombination: checkCompleteCombination,
    addCombination:addCombination
};
