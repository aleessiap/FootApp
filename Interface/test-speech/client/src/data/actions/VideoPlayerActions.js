import Dispatcher from '../Dispatcher';
import ActionTypes from '../ActionTypes';
/**
 * Azioni che innescano lo store del player video
 */
class VideoPlayerActions {
    //carica il video per essere visualizzato
    loadVideo(data) {
        Dispatcher.dispatch({
            ActionType: ActionTypes.LOAD_VIDEO,
            value: data
        });
    }
    //carica il video da path
    loadVideoFromPath(data) {
        Dispatcher.dispatch({
            ActionType: ActionTypes.LOAD_VIDEO,
            value: data
        });
    }
    //riproduce o ferma il video
    playPauseVideo() {
        Dispatcher.dispatch({
            ActionType: ActionTypes.PLAY_PAUSE_VIDEO,
        });
    }
    //aggiorna valori del video quanto viene fatta partire la riproduzione
    onPlay(data){
        Dispatcher.dispatch({
            ActionType: ActionTypes.ON_PLAY,
            value: data
        });
    }
    //aggiorna valori del video quanto viene fermata la riproduzione
    onPause(data){
        Dispatcher.dispatch({
            ActionType: ActionTypes.ON_PAUSE,
            value: data
        });
    }
    //interrompe la riproduzione
    stopVideo(data){
        Dispatcher.dispatch({
            ActionType: ActionTypes.STOP_VIDEO,
            value : data
        });
    }
    //modifica la luce del video
    toggleLight(data){
        Dispatcher.dispatch({
            ActionType: ActionTypes.TOGGLE_LIGHT,
            value: data
        });
    }
    //aggiorna dati durante la riproduzione
    onProgress(data){
        Dispatcher.dispatch({
            ActionType: ActionTypes.ON_PROGRESS,
            value: data
        });
    }
}

export default new VideoPlayerActions();