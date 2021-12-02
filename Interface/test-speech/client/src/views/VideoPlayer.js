import React from 'react';
import ReactPlayer from "react-player";
import VideoPlayerActions from "../data/actions/VideoPlayerActions";
/*import screenfull from "../App";
import {findDOMNode} from "react-dom";
import TagVideoStore from "../data/stores/VideoStore";*/

/**
 * Restituisce il componente video
 * @param props
 * @returns {*}
 * @constructor
 */
function VideoPlayer(props){
    //<video src="http://localhost:3000/videos/videoprova.mp4" > </video>
    return(
        <ReactPlayer
            //ref={ref}
            className='react-player'
            url= {props.VideoStoreState.url}
            pip={props.VideoStoreState.pip}
            playing={props.VideoStoreState.playing}
            controls={props.VideoStoreState.controls}
            light={props.VideoStoreState.light}
            loop={props.VideoStoreState.loop}
            playbackRate={props.VideoStoreState.playbackRate}
            volume={props.VideoStoreState.volume}
            muted={props.VideoStoreState.muted}
            onPlay={onPlay}
            onEnablePIP={onEnablePIP}
            onDisablePIP={onDisablePIP}
            onPause={onPause}
            onSeek={e => console.log('onSeek', e)}
            onEnded={onEnded}
            onError={e => console.log('onError', e)}
            onProgress={onProgress}
            onDuration={onDuration}
            height='100%'
            width='100%'
        />
    )
}
//funzioni del player
function ref(player){
    return player;
}
function onProgress(state){
    VideoPlayerActions.onProgress(state);
}
function onPause() {
    VideoPlayerActions.onPlay(false);
}
function playPause(state){
    VideoPlayerActions.playPauseVideo()
}
function onPlay(){
    VideoPlayerActions.onPlay(true);
}
//Tutte le altre funzioni sono disabilitate
function load(url){
}
/*load = url => {
    this.setState({
        url,
        played: 0,
        loaded: 0,
        pip: false
    })
};*/

/*playPause = () => {
    //this.setState({playing: !this.state.playing})
};*/
function stop(){

}
//stop = () => {
    //this.setState({url: null, playing: false});
    //TagVideoStore._setPlayerState(false);
//};

function toggleControls(){

}
//toggleControls = () => {
    //const url = this.state.url;
    //this.setState({
    // controls: !this.state.controls,
    // url: null
    // }, () => this.load(url))
//};
function toggleLight(){

}
//toggleLight = () => {
    //this.setState({light: !this.state.light})
//};
function toggleLoop(){

}
//toggleLoop = () => {
    // this.setState({loop: !this.state.loop})
//};
function setVolume(e){

}
//setVolume = e => {
    //this.setState({volume: parseFloat(e.target.value)})
//};
function toggleMuted(){

}
//toggleMuted = () => {
    //this.setState({muted: !this.state.muted})
//};
function setPlaybackRate(e){

}
//setPlaybackRate = e => {
    //this.setState({playbackRate: parseFloat(e.target.value)})
//};
function togglePIP(){

}
//togglePIP = () => {
    //this.setState({pip: !this.state.pip})
//};

//onPlay = () => {
    //this.setState({playing: true});
    //TagVideoStore._setPlayerState(true);
//};
function onEnablePIP(){

}
//onEnablePIP = () => {
    //this.setState({pip: true})
//}
function onDisablePIP(){

}
//onDisablePIP = () => {
    //this.setState({pip: false})
//}

//onPause = () => {
    //this.setState({playing: false});
    //TagVideoStore._setPlayerState(false);
//}
function onSeekMouseDown(e){

}
//onSeekMouseDown = e => {
    //this.setState({seeking: true})
//}
function onSeekChange(e){

}
//onSeekChange = e => {
    //this.setState({played: parseFloat(e.target.value)})
//}
function onSeekMouseUp(e){

}
//onSeekMouseUp = e => {
    //this.setState({seeking: false})
    //this.player.seekTo(parseFloat(e.target.value))
//}

//onProgress = state => {
    //this.setState({playedSeconds: state.playedSeconds})
    // We only want to update time slider if we are not currently seeking
    //if (!this.state.seeking) {
    //  this.setState(state)
    //}
//}
function onEnded(){

}
//onEnded = () => {
    //this.setState({playing: this.state.loop})
//}

function onDuration(duration){
}
//onDuration = (duration) => {
    //this.setState({duration})
//}
function onclickFullScree(){
    //screenfull.request(findDOMNode(this.player))
}
//onClickFullscreen = () => {
//}
function renderLoadButton(url,label){

}
//renderLoadButton = (url, label) => {
    //return (
    //<button onClick={() => this.load(url)}>
    //{label}
    //</button>
    //)
//};

//ref = player => {
    //this.player = player;
//};



export default VideoPlayer;
