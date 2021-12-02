import {List} from 'immutable'
import {ReduceStore} from 'flux/utils';
import ActionType from '../ActionTypes';
import Dispatcher from '../Dispatcher';

/**
 * Store per il form della tabella con gli eventi
 * N.B i campi di modifica sotto apici fanno riferimento ai campi del file default relativo
 */

class TagCombinationTableStore extends ReduceStore {

    constructor() {
        super(Dispatcher);
    }

    getInitialState() {
        //stato di default
        return List();
    }

    reduce(state, action) {
        switch (action.ActionType) {
            case ActionType.ADD_COMBINATION:
                state = state.push(action.value);
                return state;
            case ActionType.UPDATE_COMBINATION:
                return state;
            case ActionType.REMOVE_COMBINATION:
                let combinations = state;
                let index = combinations.indexOf(action.value);
                state = state.delete(index);
                return state;
                //return action.value;
            //vengono reinserite tutte le combinizioni
            case ActionType.COMPLETE_COMBINATION:
                for(let i=0;i<action.value.tagCombination.length;i++){
                    state = state.insert(0,action.value.tagCombination[i]);
                }
                return state;
            case ActionType.LOAD_COMBINATIONS:
                let comb =List(action.data);
                state = comb;
                return state;
            //per aggiornare lo stato di un evento da non salvato a salvato sul database
            case ActionType.UPLOADED_COMBINATIONS:
                let copy = List();
                for(let index = 0;index<state.size; index++){
                    if(state.get(index).uploaded){
                        copy = copy.push(state.get(index));
                    }
                }
                let newlist = List(action.data);
                copy = copy.concat(newlist);
                state = List();
                state = copy;
                return state;
            default:
                return state;
        }
    }
}

export default new TagCombinationTableStore();
