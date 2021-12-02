import {List} from 'immutable';
import {ReduceStore} from 'flux/utils';
import ActionType from '../ActionTypes';
import Dispatcher from '../Dispatcher';
import SpeechDefault from "../default/SpeechDefault";

/**
 * Store per il form della libreria per i comandi vocali
 * N.B i campi di modifica sotto apici fanno riferimento ai campi del file default relativo
 */

class SpeechStore extends ReduceStore {

    constructor() {
        super(Dispatcher);
    }

    getInitialState() {
        //stato di default
        return SpeechDefault();
    }

    reduce(state, action) {
        switch (action.ActionType) {
            case ActionType.SPEECH_LISTENING:
                return state.set('listening',action.value);
            case ActionType.SPEECH_INTERIM:
                return state.set("interimTransript",action.value);
            case ActionType.SPEECH_FINAL:
                return state.set("finalTranscript",List(action.value));
            // Do nothing for now, we will add logic here soon!
            default:
                return state;
        }
    }
}

export default new SpeechStore();