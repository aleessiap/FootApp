import ActionTypes from '../ActionTypes';
import Dispatcher from '../Dispatcher'

/**
 * Azioni che innescano lo store
 */
class LoginFormActions {
    //quando vieni digitato qualcosa nella sezione username del form del login
    username_change(username){
        Dispatcher.dispatch({
            ActionType: ActionTypes.USERNAME_FORM_CHANGE,
            value : username
        });
    }
    //quando vieni digitato qualcosa nella sezione password del form del login
    password_change(password){
        Dispatcher.dispatch({
            ActionType: ActionTypes.PASSWORD_FORM_CHANGE,
            value : password
        });
    }

}

export default new LoginFormActions();