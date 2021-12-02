import Immutable from "immutable";
/**
 * Valori di default dello store del componente video
 */
const VideoStoreStateDefault = Immutable.Record({
    url: '',
    pip: false,
    playing: false,
    controls: true,
    light: false,
    volume: 0.2,
    muted: true,
    played: 0,
    loaded: 0,
    duration: 0,
    playbackRate: 1.0,
    loop: false,
    playedSeconds: 0,
    onProgress:{playedSeconds: 0,played:0,loadedSeconds:0,loaded:0}
});

export default VideoStoreStateDefault;
