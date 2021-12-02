import {ReduceStore} from 'flux/utils';
import ActionType from '../ActionTypes';
import Dispatcher from '../Dispatcher';
import LoginDefault from '../default/LoginDefault'

/**
 * Store per il form del login
 * N.B i campi di modifica sotto apici fanno riferimento ai campi del file default relativo
 */

class LoginStore extends ReduceStore {

    constructor() {
        super(Dispatcher);
    }

    getInitialState() {
        //stato di default
        return LoginDefault();
    }

    reduce(state, action) {
        switch (action.ActionType) {
            case ActionType.LOGIN_COMPLETED:
                let user = action.value;
                let id = user['id'];
                let username = user['username'];
                let nome = user['first_name'];
                let cognome = user['last_name'];
                state = state.set('id',id);
                state = state.set('username',username);
                state = state.set('nome',nome);
                state = state.set('cognome',cognome);
                return state;
            default:
                return state;
        }
    }
}

export default new LoginStore();
