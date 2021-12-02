import {ReduceStore} from 'flux/utils';
import ActionType from '../ActionTypes';
import Dispatcher from '../Dispatcher';
import LoginFormDefault from '../default/LoginFormDefault'

/**
 * Store per il form del login
 * N.B i campi di modifica sotto apici fanno riferimento ai campi del file default relativo
 */

class LoginFormStore extends ReduceStore {

    constructor() {
        super(Dispatcher);
    }

    getInitialState() {
        //stato di default
        return LoginFormDefault();
    }

    reduce(state, action) {
        switch (action.ActionType) {
            case ActionType.USERNAME_FORM_CHANGE:
                return state.set('username',action.value);
            case ActionType.PASSWORD_FORM_CHANGE:
                return state.set('password',action.value);
            default:
                return LoginFormDefault();
        }
    }
}

export default new LoginFormStore();