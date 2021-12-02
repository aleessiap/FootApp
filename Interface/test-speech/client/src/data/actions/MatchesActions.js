import ActionTypes from '../ActionTypes';
import Dispatcher from '../Dispatcher'

/**
 * Azioni che innescano lo store dei matches
 */
class MatchesActions {
    //caricamento delle competizioni
    load_competitions_matches(competitions,data){
        Dispatcher.dispatch({
            ActionType: ActionTypes.LOAD_COMPETITIONS_MATCHES,
            competitions : competitions,
            data: data
        });
    }
    //configurare le informazioni del match
    set_data_matches(competitions,data){
        Dispatcher.dispatch({
            ActionType: ActionTypes.SET_DATA_MATCHES,
            competitions : competitions,
            data : data
        });
    }
    //aggiornare le competizioni
    update_competition(competition){
        Dispatcher.dispatch({
            ActionType: ActionTypes.UPDATE_COMPETITION,
            competition : competition

        });
    }
    //impostare il dropDown
    set_dropDown(value){
        Dispatcher.dispatch({
            ActionType: ActionTypes.SET_DROPDOWN,
            value : value

        });
    }
    //impostare il match selezionato
    set_selected_match(selectedMatch){
        Dispatcher.dispatch({
            ActionType: ActionTypes.SET_SELECTED_MATCH,
            selectedMatch : selectedMatch,
        });
    }
    //impostare la visualizzazione del match
    set_matches_visualization(value){
        Dispatcher.dispatch({
            ActionType: ActionTypes.SET_MATCHES_VISUALIZATION,
            value : value,
        });
    }
}

export default new MatchesActions();
