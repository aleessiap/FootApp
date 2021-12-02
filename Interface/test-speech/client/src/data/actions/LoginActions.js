import ActionTypes from '../ActionTypes';
import Dispatcher from '../Dispatcher'

/**
 * Azione che innesca lo store per il login completato
 */
class LoginActions {

    login_completed(user){
        Dispatcher.dispatch({
            ActionType: ActionTypes.LOGIN_COMPLETED,
            value : user
        });
    }
}

export default new LoginActions();
