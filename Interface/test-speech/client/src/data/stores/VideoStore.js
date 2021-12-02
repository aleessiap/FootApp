import {ReduceStore} from 'flux/utils';
import ActionType from '../ActionTypes';
import Dispatcher from '../Dispatcher';
import VideoStoreStateDefault from "../default/VideoStoreStateDefault";

/**
 * Store per il form del componente video
 * N.B i campi di modifica sotto apici fanno riferimento ai campi del file default relativo
 */

class VideoStore extends ReduceStore {
    constructor() {
        super(Dispatcher);
    }

    getInitialState() {
        //stato di default
        return VideoStoreStateDefault()
    }

    reduce(state, action) {
        switch (action.ActionType) {
            case ActionType.PLAY_PAUSE_VIDEO:
                return state.set("playing",!state.playing);
            case ActionType.ON_PLAY:
                return state.set("playing",action.value);
            case ActionType.ON_PAUSE:
                return state.set("playing",action.value);
            case ActionType.LOAD_VIDEO:
                return state.set("url",action.value).set("played",0).set("loaded",0).set("pip",false);
            case ActionType.STOP_VIDEO:
                return state.set("url",null).set("playing",false);
            case ActionType.TOGGLE_LIGHT:
                return state.set("light",!state.light);
            case ActionType.ON_PROGRESS:
                return state.set("onProgress",action.value);
                // Do nothing for now, we will add logic here soon!
            default:
                return state;
        }
    }
}

export default new VideoStore();