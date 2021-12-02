import Dispatcher from '../Dispatcher';
import ActionTypes from '../ActionTypes';
/**
 * Azioni che innescano lo store dei comandi vocali
 * N.B i comandi vocali vengono gestiti per lo più dai Tag
 * Qua si tiene in memoria solo se il comando vocale stia funzionando o meno
 */
class VocalActions {
    //interrompe video da comando vocale
    pauseVideoFromVocal(text) {
        Dispatcher.dispatch({
            actionType: ActionTypes.START_OR_STOP_VOCAL,
            text
        });
    }
    //Imposta il valore a true o false se la libreria deve ascoltare o meno
    SpeechListening(listening){
        Dispatcher.dispatch({
            ActionType: ActionTypes.SPEECH_LISTENING,
            value: listening
        });
    }
}

export default new VocalActions();