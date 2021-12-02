import {ReduceStore} from 'flux/utils';
import ActionType from '../ActionTypes';
import PagesLink from '../default/PagesLinkDefault';
import Dispatcher from '../Dispatcher';

/**
 * Store per il form del routing interno
 * N.B i campi di modifica sotto apici fanno riferimento ai campi del file default relativo
 */


class PagesLinkStore extends ReduceStore {

    constructor() {
        super(Dispatcher);
    }

    getInitialState() {
        //stato di default
        return PagesLink.MAIN_PAGE;
    }

    reduce(state, action) {
        switch (action.ActionType) {
            case ActionType.REDIRECT_PAGE:
                return action.value;
            default:
                return state;
        }
    }
}

export default new PagesLinkStore();