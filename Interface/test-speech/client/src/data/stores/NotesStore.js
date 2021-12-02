import {ReduceStore} from 'flux/utils';
import ActionType from '../ActionTypes';
import Dispatcher from '../Dispatcher';

/**
 * Store per il form delle note
 * N.B i campi di modifica sotto apici fanno riferimento ai campi del file default relativo
 */


class NotesStore extends ReduceStore {

    constructor() {
        super(Dispatcher);
    }

    getInitialState() {
        //stato di default
        return '';
    }

    reduce(state, action) {
        switch (action.ActionType) {
            case ActionType.UPDATE_NOTE:
                return action.value;
            case ActionType.COMPLETE_COMBINATION:
                return '';
            default:
                return state;
        }
    }
}

export default new NotesStore();
