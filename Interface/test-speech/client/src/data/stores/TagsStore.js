import {List,OrderedMap} from 'immutable'
import {ReduceStore} from 'flux/utils';
import ActionType from '../ActionTypes';
import Dispatcher from '../Dispatcher';
import TagsButtonDefault from "../default/TagsButtonDefault";

/**
 * Store per il form della logica di tag/eventi/controtag
 * N.B i campi di modifica sotto apici fanno riferimento ai campi del file default relativo
 */

//funzione per generare una mappa ordinati di keyvaluepair da salvare sul campo TagMap
function getOrderedMap(actionValue,key,value){
    let map = OrderedMap();
    let list = List(actionValue);
    for(let i=0;i<list.size;i++){
        let tag = list.get(i);
        map = map.set(tag[key],tag[value]);
    }
    return map;
}

class TagsStore extends ReduceStore {

    constructor() {
        //stato di default
        super(Dispatcher);
    }

    getInitialState() {
        return TagsButtonDefault();
    }

    reduce(state, action) {
        switch (action.ActionType) {
            case ActionType.LOAD_TAGS:
                state = state.set('tagsMap',getOrderedMap(action.value,"name","id"));
                return state;
            case ActionType.LOAD_TAG_COMBINATIONS:
                return state.set('tagCombinations',List(action.value));
            case ActionType.LOAD_TAG_COMBHIERARCHIES:
                return state.set('tagCombSet',List(action.value));
            case ActionType.LOAD_VISIBLE_BUTTONS:
                return state.set('visibleButtons',List(action.value));
            case ActionType.LOAD_DEFAULT_BUTTONS:
                return state.set('defaultButtons',List(action.value));
            case ActionType.ADD_CHOSEN_BUTTON_SINGLE:
                let chosen = state.get("chosenButtons");
                chosen = chosen.push(action.value);
                return  state.set("chosenButtons",chosen);
            case ActionType.LOAD_PATH:
                return state.set("chosenPath",List(action.value));
            case ActionType.LOAD_PATH_SET:
                return state.set("pathsSet",List(action.value));
            case ActionType.SET_TEMP_TAGS:
                return state.set("tempSetButtons",List(action.value));
            case ActionType.RESET_CHOSEN_BUTTON:
                state = state.set("visibleButtonsHistory",List());
                state =state.set("chosenButtons",List());
                state = state.set("chosenPath",List());
                return state.set('visibleButtons',state.get("defaultButtons"));
            case ActionType.LOAD_CHOSENBUTTON_PATHSET_VISIBLEBUTTONS_PATHS:
                let history = {button: action.value.button,visible:action.value.visible_buttons,path:action.value.paths};
                let visibleButtonsHistory = state.get("visibleButtonsHistory");
                visibleButtonsHistory = visibleButtonsHistory.push(history);
                state = state.set("visibleButtonsHistory",visibleButtonsHistory);
                let chosenB = state.get("chosenButtons");
                chosenB = chosenB.push(action.value.button);
                state = state.set("chosenButtons",chosenB);
                state = state.set("pathsSet",List(action.value.path_set));
                state = state.set('visibleButtons',List(action.value.visible_buttons));
                return state.set("chosenPath",List(action.value.paths));
            case ActionType.LOAD_CHOSENBUTTON_VISIBLEBUTTONS_PATHS:
                let chosenButton = state.get("chosenButtons");
                chosenButton = chosenButton.push(action.value.button);
                state = state.set("chosenButtons",chosenButton);
                let history2 = {button: action.value.button,visible:action.value.visible_buttons,path:action.value.paths};
                let visibleButtonsHistory2 = state.get("visibleButtonsHistory");
                visibleButtonsHistory2 = visibleButtonsHistory2.push(history2);
                state = state.set("visibleButtonsHistory",visibleButtonsHistory2);
                state = state.set('visibleButtons',List(action.value.visible_buttons));
                state =state.set("chosenPath",List(action.value.paths));
                return state;
            case ActionType.REMOVE_CHOSEN_BUTTON_SET_HISTORY:
                state = state.set("visibleButtonsHistory",List(action.history));
                state = state.set("chosenPath",List(action.lastItem.path));
                state = state.set("visibleButtons",List(action.lastItem.visible));
                state = state.set("chosenButtons",List(action.chosen));
                return state;
            case ActionType.COMPLETE_COMBINATION:
                state = state.set("visibleButtonsHistory",List());
                state =state.set("chosenButtons",List());
                state = state.set("chosenPath",List());
                state = state.set("chosenPlayers",List());
                state = state.set("possibleTagCombination",List());
                state = state.set("chosenButtonsId",List());
                return state.set('visibleButtons',state.get("defaultButtons"));
            case ActionType.ADD_CHOSEN_PLAYER:
                let chosenPlayers = state.get("chosenPlayers");
                chosenPlayers = chosenPlayers.push(action.value);
                state = state.set("chosenPlayers",chosenPlayers);
                return state;
            case ActionType.RESET_POSSIBLETAG_COMBINATION:
                state.set("possibleTagCombination",List());
                return state;
            case ActionType.REMOVE_CHOSEN_BUTTON:
                state= state.set("chosenButtons",List(action.value));
                return state.set('visibleButtons',state.get("defaultButtons"));
            case ActionType.LOAD_CONTROTAG:
                return state.set("controTags",List(action.value));
            case ActionType.SET_POSSIBLE_TAG_COMBINATION:
                return state.set("possibleTagCombination",List(action.value));
            case ActionType.REMOVE_PLAYER:
                state = state.set("chosenPlayers",List(action.value));
                return state;
            case ActionType.LOAD_CHOSENBUTTON_VISIBLEBUTTONS_SPEECH:
                let chosenBu = state.get('chosenButtons');
                chosenBu = chosenBu.push(action.chosen);
                state = state.set('chosenButtons',chosenBu);
                state = state.set('visibleButtons',List(action.visible));
                return state;
            case ActionType.ADD_CHOSENS_BUTTONS_SPEECH:
                let chosens = state.get('chosenButtons');
                let chosensId = state.get('chosenButtonsId');
                //controllo che non sia già presente
                for(let index=0;index <action.chosenButtons.length;index++){
                    if(!chosensId.includes(action.chosenButtons[index].id)){
                        chosens = chosens.push(action.chosenButtons[index]);
                        chosensId = chosensId.push(action.chosenButtons[index].id);
                    }
                }
                state = state.set('possibleTagCombination',List(action.possibleTagCombination));
                state = state.set('visibleButtons',List(action.visibleButtons));
                state = state.set('chosenButtons',chosens);
                state = state.set('chosenButtonsId',chosensId);
                return state;
            default:
                return state;
        }
    }
}

export default new TagsStore();
