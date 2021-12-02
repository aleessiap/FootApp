import ActionTypes from '../ActionTypes';
import Dispatcher from '../Dispatcher'
/**
 * Azioni che innescano lo store dei player
 */
class PlayersActions {
    //carica i player
    load_players(players,homeformation,awayformation,homebench,awaybench){
        Dispatcher.dispatch({
            ActionType: ActionTypes.LOAD_PLAYERS,
            home : players.home,
            away: players.away,
            homeformation : homeformation,
            awayformation : awayformation,
            homebench : homebench,
            awaybench : awaybench
        });
    }

}

export default new PlayersActions();
