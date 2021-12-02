import Immutable from "immutable";

/**
 * Valori di default dello store della libreria dei comandi vocali
 */
const SpeechDefault = Immutable.Record({
    listening: true,
    interimTransript: '',
    finalTranscript: ''
});

export default SpeechDefault;
