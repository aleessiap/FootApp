import ActionTypes from '../ActionTypes';
import Dispatcher from '../Dispatcher'
/**
 * Azioni che innescano lo store delle note
 */
class NoteActions {
    //aggiorna la nota quando il testo cambia
    update_note(note){
        Dispatcher.dispatch({
            ActionType: ActionTypes.UPDATE_NOTE,
            value : note
        });
    }
    //reset delle note
    reset_note(){
        Dispatcher.dispatch({
            ActionType: ActionTypes.RESET_NOTE,
        });
    }
}

export default new NoteActions();
