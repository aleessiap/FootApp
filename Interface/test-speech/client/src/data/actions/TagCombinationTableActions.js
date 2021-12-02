import ActionTypes from '../ActionTypes';
import Dispatcher from '../Dispatcher'
/**
 * Azioni che innescano lo store della tabella degli eventi
 */
class TagCombinationTableActions {
    //aggiungi una combinazione
    add_Combination(combination){
        Dispatcher.dispatch({
            ActionType: ActionTypes.ADD_COMBINATION,
            value : combination
        });
    }
    //rimuovi una combinazione
    remove_combination(combination){
        Dispatcher.dispatch({
            ActionType: ActionTypes.REMOVE_COMBINATION,
            value : combination
        });
    }
    //simile ad aggiungi ma innescata in un altro modo
    complete_combination(values){
        Dispatcher.dispatch({
            ActionType: ActionTypes.COMPLETE_COMBINATION,
            value : values
        });
    }
    //upload della combinazione
    uploaded_combinations(data){
        Dispatcher.dispatch({
            ActionType: ActionTypes.UPLOADED_COMBINATIONS,
            data : data
        });
    }
    //carica le combinazioni dal db
    load_combinations(data){
        Dispatcher.dispatch({
            ActionType: ActionTypes.UPLOADED_COMBINATIONS,
            data : data
        });
    }

}

export default new TagCombinationTableActions();
