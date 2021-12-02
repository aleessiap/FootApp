import React from "react";
import { makeStyles } from '@material-ui/core/styles';
import Fab from '@material-ui/core/Fab';
import TagsActions from "../data/actions/TagsActions";
import TagCombinationUtils from "../utils/TagCombinationUtils";
import VideoPlayerActions from "../data/actions/VideoPlayerActions";
import Formation_utils from "./Formation_utils";

/**
 * Setup dello stile grafico
 * @type {StylesHook<Styles<Theme, {}, string>>}
 */
const useStyles = makeStyles(theme => ({
    margin: {
        margin: theme.spacing(1),
    },
    extendedIcon: {
        marginRight: theme.spacing(1),
    },
}));

/**
 * Funzione attualmente duplicata vedere PlayerUtils.js
 * @param e
 * @param player
 * @param props
 */
function handleSelectedPlayer(e,player,props){
    if (props.VideoStoreState.playing) {
        VideoPlayerActions.onPlay(false);
    }
    let chosenPlayers = props.TagsStoreState.chosenPlayers;
    if(chosenPlayers.size === 2){return;}
    if(chosenPlayers.size===0){
        TagsActions.add_ChosenPlayer({id:player.id,number:player.number,name:player.last_name,team_id:player.team_id});
        TagCombinationUtils.checkCompleteCombination(props,null,null,player);
    }else{
        for(let i=0;i<chosenPlayers.size;i++){
            if(chosenPlayers.get(i).id === player.id){
                return;
            }
        }
        TagsActions.add_ChosenPlayer({id:player.id,number:player.number,name:player.last_name,team_id:player.team_id});
        TagCombinationUtils.checkCompleteCombination(props,null,null,player);
    }

}

/**
 * Restituisce il componente visivo del campo da calcio con i giocatori e la loro disposizione in campo
 * @param props
 * @returns {*}
 * @constructor
 */
function FootballFieldCss(props) {
    const classes = useStyles();
    let homeTeam = props.PlayerState.HomeTeamFormation;
    let awayTeam = props.PlayerState.AwayTeamFormation;
    let homePlayer = [];
    let awayPlayer = [];
    let disabled = false;
    //Nel caso in cui non sia stato inserito un video di riferimento disabilito la selezione
    if(props.VideoStoreState.url ===''){
        disabled = true;
    }
    for(let i=0;i<homeTeam.size;i++){
        let player = homeTeam.get(i);
        let number = player.number ? player.number : '00';
        let node = <div className={'player-container'} key={'player-containter-' + player.id}
                        style={Formation_utils.getPosition(i, 'home', '4-4-2')}>
            <Fab disabled={disabled} key={player.id} onClick={(e) => handleSelectedPlayer(e, player,props)}
                 color="secondary" aria-label="add" className={classes.margin} className = {player.className}
                 data-player-type={player.dataplayertype} size={'small'}>
                {number}
            </Fab>
            <div>{player.last_name}</div>
        </div>
        homePlayer.push(node);
    }
    for(let i=0;i<awayTeam.size;i++){
        let player = awayTeam.get(i);
        let number = player.number ? player.number : '00';
        let node = <div className={'player-container'} key={'player-containter-' + player.id}
                        style={Formation_utils.getPosition(i, 'away', '3-5-2')}>
            <Fab disabled={disabled} key={player.id} onClick={(e) => handleSelectedPlayer(e, player,props)}
                 color="primary" aria-label="add" className={classes.margin} className = {player.className}
                 data-player-type={player.dataplayertype} size={'small'}>
                {number}
            </Fab>
            <div>{player.last_name}</div>
        </div>
        awayPlayer.push(node);
    }

    return (
        <React.Fragment>
            <div id="div-img-football">
                {homePlayer}
                {awayPlayer}
            </div>
        </React.Fragment>
        )
}

export default FootballFieldCss;



