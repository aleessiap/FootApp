import {List} from 'immutable'
import {ReduceStore} from 'flux/utils';
import ActionType from '../ActionTypes';
import Dispatcher from '../Dispatcher';
import MatchesStoreDefault from "../default/MatchesStoreDefault";

/**
 * Store per il form dei match
 * N.B i campi di modifica sotto apici fanno riferimento ai campi del file default relativo
 */


class MatchesStore extends ReduceStore {

    constructor() {
        super(Dispatcher);
    }

    getInitialState() {
        //stato di default
        return MatchesStoreDefault();
    }

    reduce(state, action) {
        switch (action.ActionType) {
            case ActionType.LOAD_COMPETITIONS_MATCHES:
                state = state.set('competitions',List(action.competitions));
                state = state.set('matches',List(action.data.matches));
                state = state.set('permissions',List(action.data.op));
                return state;
            case ActionType.SET_SELECTED_COMPETITIONS_DATA_MATCHES:
                state = state.set('selectedCompetition',action.competitions);
                state = state.set('data',List(action.data));
                return state;
            case ActionType.SET_SELECTED_MATCH:
                state = state.set('selectedMatch',action.selectedMatch);
                return state;
            case ActionType.UPDATE_COMPETITION:
                state = state.set('selectedCompetition',action.competition);
                return state;
            case ActionType.SET_MATCHES_VISUALIZATION:
                state = state.set('visualization',action.value);
                return state;
            case ActionType.SET_DROPDOWN:
                state = state.set('openDropDown',action.value);
                return state;
            default:
                return state;
        }
    }
}

export default new MatchesStore();
