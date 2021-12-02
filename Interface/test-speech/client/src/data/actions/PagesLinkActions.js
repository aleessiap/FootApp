import ActionTypes from '../ActionTypes';
import Dispatcher from '../Dispatcher'
/**
 * Azioni che innescano lo store per il redirect della pagina
 */
class PagesLinkActions {
    //gestione della redirect sulla base del value
    redirect_page(page){
        Dispatcher.dispatch({
            ActionType: ActionTypes.REDIRECT_PAGE,
            value : page
        });
    }

}

export default new PagesLinkActions();