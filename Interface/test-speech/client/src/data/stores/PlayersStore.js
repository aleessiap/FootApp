import {List} from 'immutable'
import {ReduceStore} from 'flux/utils';
import ActionType from '../ActionTypes';
import Dispatcher from '../Dispatcher';
import PlayerStoreDefault from "../default/PlayerStoreDefault";

/**
 * Store per il form dei player
 * N.B i campi di modifica sotto apici fanno riferimento ai campi del file default relativo
 */

class PlayersStore extends ReduceStore {

    constructor() {
        super(Dispatcher);
    }

    getInitialState() {
        //stato di default
        return PlayerStoreDefault();
    }

    reduce(state, action) {
        switch (action.ActionType) {
            case ActionType.ADD_COMBINATION:
                return state;
            case ActionType.LOAD_PLAYERS:
                state = state.set('HomeTeamPlayers',List(action.home));
                state = state.set('AwayTeamPlayers',List(action.away));
                state = state.set('HomeTeamFormation',List(action.homeformation));
                state = state.set('AwayTeamFormation',List(action.awayformation));
                state = state.set('HomeBench',List(action.homebench));
                state = state.set('AwayBench',List(action.awaybench));
                return state;
            default:
                return state;
        }
    }
}

export default new PlayersStore();
