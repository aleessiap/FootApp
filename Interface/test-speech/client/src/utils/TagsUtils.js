import TagsActions from "../data/actions/TagsActions";
import TagCombinationUtils from "./TagCombinationUtils";

/**
 * Funzione che genera i nuovi tag visibili e li salva sullo store
 * @param id
 * @param name
 * @param props
 * @param button
 * @param remove
 * @param speech
 * @returns {null}
 */
function replaceVisibleButtons(id, name, props, button,remove = false,speech = '') {
    let tagCombinations = props.TagsStoreState.tagCombinations;
    let tagsMap = props.TagsStoreState.tagsMap;
    let tagCombSet = props.TagsStoreState.tagCombSet;
    let chosenButtonCopy = props.TagsStoreState.chosenButtons;
    let chosenPath = props.TagsStoreState.chosenPath;
    let tempTags = props.TagsStoreState.tempSetButtons;

    let chosenOrPath = tagCombinations;

    if (chosenPath.size > 0) {
        chosenOrPath = chosenPath;
    }
    chosenButtonCopy = chosenButtonCopy.push(button);
    //errore
    if (chosenButtonCopy.size === 0) {
        return null;
    }
    let depth = chosenButtonCopy.size - 1;

    let possibleTagCombinationSet = [];
    let possibleTagCombination = [];
    let nextNames = [];
    //scompongo i tag del path scelto o dei tag scelti e controllo che corrispondando
    for (let i = 0; i < chosenOrPath.size; i++) {
        let json = chosenOrPath.get(i);
        let names = json['name'].split(", ");
        if (button.name === names[depth]) {
            possibleTagCombination.push(json);
            if (!names[depth + 1]) {
                possibleTagCombinationSet.push(json);
            }
            if (!nextNames.includes(names[depth + 1]) && names[depth + 1]) {
                nextNames.push(names[depth + 1]);
            }
        }
    }
    let nextButtons = [];
    //una volta generati i nomi dei tag successivi estraggo i tag come oggetti
    for (let j = 0; j < nextNames.length; j++) {
        let name = nextNames[j];
        nextButtons= getNextVisibleButtons(tagsMap, name, nextButtons);
    }
    let path_set = props.TagsStoreState.pathsSet;
    //Effettuo i controlli per la generazione dei path successivi per i controlli del prossimo inserimento
    for (let i = 0; i < possibleTagCombinationSet.length; i++) {
        let currentId = possibleTagCombinationSet[i].id;
        for (let j = 0; j < tagCombSet.size; j++) {
            let elementSet = tagCombSet.get(j);
            if (currentId === elementSet.currentid) {
                let nextId = elementSet.nextid;
                for (let k = 0; k < tagCombinations.size; k++) {
                    if (tagCombinations.get(k).id === nextId) {
                        let names = tagCombinations.get(k).name.split(", ");
                        let name = names[0];
                        nextButtons=getNextVisibleButtons(tagsMap, name, nextButtons);
                        path_set = path_set.push(tagCombinations.get(k));
                    }
                }
            }
        }
    }
    let lastButtonChosen = chosenButtonCopy.get(chosenButtonCopy.size - 1);
    let depthSet = tempTags.size;
    if (depthSet > 0) {
        depthSet = depthSet - 1;
    }
    //Altri controlli e generazioni dei path
    for (let i = 0; i < path_set.size; i++) {
        let elemPath = path_set.get(i);
        let names = elemPath.name.split(", ");
        let name = names[depthSet];
        if (lastButtonChosen.name === name && names[depthSet + 1]) {
            let name = names[depthSet + 1];
            nextButtons=getNextVisibleButtons(tagsMap, name, nextButtons);
        }
    }
    //Se invece è stato deciso di eliminare un tag
    if(!remove){
        //Se è stato generato un path
        if (path_set.size > 0) {
            let value = {button: button, path_set: path_set, visible_buttons: nextButtons, paths: possibleTagCombination};
            //Salvo sullo store
            TagsActions.load_ChosenButton_PathSet_VisibleButtons_Paths(value);
        } else {
            //Salvo sullo store
            let value = {button: button, visible_buttons: nextButtons, paths: possibleTagCombination};
            TagsActions.load_ChosenButton_VisibleButtons_Paths(value);
        }
        //Controllo che non si siano verificate le condizioni di un evento completo
        TagCombinationUtils.checkCompleteCombination(props,chosenButtonCopy,nextButtons,possibleTagCombination);
    }
    else{
        console.log('errore!');
        TagCombinationUtils.checkCompleteCombination(props,chosenButtonCopy,nextButtons,possibleTagCombination,true);
    }
}

/**
 * Funzione che estrae i tag come oggetti sulla base del loro nome
 * @param tagsMap
 * @param name
 * @param nextButtons
 */
function getNextVisibleButtons(tagsMap, name, nextButtons) {
    if (tagsMap.has(name)) {
        let tag = tagsMap.get(name);
        let button = {id: tag, name: name};
        if (!nextButtons.some(item => item.id === button.id)) {
            nextButtons.push(button);
        }
    }
    return nextButtons;
}


export default {
    replaceVisibleButtons: replaceVisibleButtons,
    getNextVisibleButtons:getNextVisibleButtons
};
