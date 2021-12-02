import ActionTypes from '../ActionTypes';
import Dispatcher from '../Dispatcher'
/**
 * Azioni che innescano lo store dei Tag
 */
class TagsActions {
    //ferma il video alla selezione di un tag
    pauseVideoFromButton(text) {
        Dispatcher.dispatch({
            ActionType: ActionTypes.BUTTON_CLICK_ADD,
            text
        });
    }
    //carica i tag sullo store
    loadTags(tags){
        Dispatcher.dispatch({
            ActionType: ActionTypes.LOAD_TAGS,
            value: tags
        });
    }
    //carica una tagCombination
    loadTagCombinations(tagsCombinations){
        Dispatcher.dispatch({
            ActionType: ActionTypes.LOAD_TAG_COMBINATIONS,
            value: tagsCombinations
        });
    }
    //carica i controTag
    loadControTag(controTag){
        Dispatcher.dispatch({
            ActionType: ActionTypes.LOAD_CONTROTAG,
            value: controTag
        });
    }
    //Carica le gerarchie di tagcombination
    loadTagCombHierarchies(TagCombHierarchies){
        Dispatcher.dispatch({
            ActionType: ActionTypes.LOAD_TAG_COMBHIERARCHIES,
            value: TagCombHierarchies
        });
    }
    //cambia tag
    changeButtons(text) {
        Dispatcher.dispatch({
            ActionType: ActionTypes.BUTTON_CLICK_ADD,
            value: text
        });
    }
    //carica il tag visibile in quel momento
    load_VisibleButtons(buttons){
        Dispatcher.dispatch({
            ActionType: ActionTypes.LOAD_VISIBLE_BUTTONS,
            value : buttons
        });
    }
    //carica i tag standard al momento t0
    load_DefaultButtons(buttons){
        Dispatcher.dispatch({
            ActionType: ActionTypes.LOAD_DEFAULT_BUTTONS,
            value : buttons
        });
    }
    //carica i path possibili calcolati sul tag selezionato
    load_Paths(paths){
        Dispatcher.dispatch({
            ActionType: ActionTypes.LOAD_PATH,
            value : paths
        });
    }
    //imposta i tag temporanei
    set_temp_Tags(tags){
        Dispatcher.dispatch({
            ActionType: ActionTypes.SET_TEMP_TAGS,
            value : tags
        });
    }
    //carica i set di path possibili
    load_Paths_Set(paths){
        Dispatcher.dispatch({
            ActionType: ActionTypes.LOAD_PATH_SET,
            value : paths
        });
    }
    //salva il tag singolo selezionato e carica i nuovi tag visibili
    add_ChosenButtonSingleAndVisibleButtons(chosenButton,visibleButtons){
        Dispatcher.dispatch({
            ActionType: ActionTypes.ADD_CHOSEN_BUTTON_SINGLE_AND_VISIBLE_BUTTONS,
            value : chosenButton,
            value2 : visibleButtons
        });
    }
    //aggiungi singolo tag scelto
    add_ChosenButtonSingle(chosenButton){
        Dispatcher.dispatch({
            ActionType: ActionTypes.ADD_CHOSEN_BUTTON_SINGLE,
            value : chosenButton,
        });
    }
    //aggiunge multipli tag scelti
    add_ChosenButtons(button){
        Dispatcher.dispatch({
            ActionType: ActionTypes.ADD_CHOSEN_BUTTONS,
            value : button
        });
    }
    //rimuove il tag scelto
    remove_ChosenButton(button){
        Dispatcher.dispatch({
            ActionType: ActionTypes.REMOVE_CHOSEN_BUTTON,
            value : button
        });
    }
    //rimuove il tag selezionato e aggiorna i possibili tag selezionabili
    remove_ChosenButton_setHistory(history,lastItem,chosen){
        Dispatcher.dispatch({
            ActionType: ActionTypes.REMOVE_CHOSEN_BUTTON_SET_HISTORY,
            history : history,
            lastItem : lastItem,
            chosen : chosen
        });
    }
    //riporta tutto all'istante t0
    reset_ChosenButton(){
        Dispatcher.dispatch({
            ActionType: ActionTypes.RESET_CHOSEN_BUTTON,
        });
    }
    //imposta il tag selezionato, i possibili path a cui è possibile andare e i relativi tag visibili
    load_ChosenButton_PathSet_VisibleButtons_Paths(value){
        Dispatcher.dispatch({
            ActionType: ActionTypes.LOAD_CHOSENBUTTON_PATHSET_VISIBLEBUTTONS_PATHS,
            value:value
        });
    }
    //quasi identico a quello di sopra
    load_ChosenButton_VisibleButtons_Paths(value){
        Dispatcher.dispatch({
            ActionType: ActionTypes.LOAD_CHOSENBUTTON_VISIBLEBUTTONS_PATHS,
            value:value
        });
    }
    //identico a quelli di sopra ma funziona con i comandi vocali
    load_ChosenButton_VisibleButtons_speech(chosen,visible){
        Dispatcher.dispatch({
            ActionType: ActionTypes.LOAD_CHOSENBUTTON_VISIBLEBUTTONS_SPEECH,
            chosen:chosen,
            visible:visible
        });
    }
    //aggiunge un player selezionato
    add_ChosenPlayer(value){
        Dispatcher.dispatch({
            ActionType: ActionTypes.ADD_CHOSEN_PLAYER,
            value:value
        });
    }
    //imposta le possibili tag combination
    set_possibleTagCombination(value){
        Dispatcher.dispatch({
            ActionType: ActionTypes.SET_POSSIBLE_TAG_COMBINATION,
            value:value
        });
    }
    //rimuove un player
    remove_player(player){
        Dispatcher.dispatch({
            ActionType: ActionTypes.REMOVE_PLAYER,
            value:player
        });
    }
    //aggiunge i tag selezionati tramite comandi vocali
    add_chosens_buttons_speech(chosenButtons,visibleButtons,possibleTagCombination){
        Dispatcher.dispatch({
            ActionType: ActionTypes.ADD_CHOSENS_BUTTONS_SPEECH,
            chosenButtons:chosenButtons,
            visibleButtons: visibleButtons,
            possibleTagCombination:possibleTagCombination
        });
    }
    //effettua il reset dei possibili tag selezionabili
    resetPossibleTagCombination(){
        Dispatcher.dispatch({
            ActionType: ActionTypes.RESET_POSSIBLETAG_COMBINATION,
        });
    }
}

export default new TagsActions();
