import React from 'react';
import VideoPlayerActions from "../data/actions/VideoPlayerActions";
import TagsActions from "../data/actions/TagsActions";
import Button from '@material-ui/core/Button';
import {makeStyles} from '@material-ui/core/styles';
import Divider from '@material-ui/core/Divider';
import Fab from '@material-ui/core/Fab';
import TagCombinationUtils from "../utils/TagCombinationUtils";
import TagsUtils from "../utils/TagsUtils";

/**
 * Restituisce la vista del componente per la selezione dei tag
 * @param props
 * @returns {*}
 * @constructor
 */
function Tags(props) {
    const classes = useStyles();
    const classesFab = useStylesFab();
    let visibleButtons = props.TagsStoreState.visibleButtons;
    let chosenButtons = props.TagsStoreState.chosenButtons;
    let chosenPlayers = props.TagsStoreState.chosenPlayers;
    let vbuttons =returnVisibleButtons(visibleButtons, props,classes);
    let cbuttons = returnChosenButtons(chosenButtons,props,classes);
    let cPlayer = returnChosenPlayers(chosenPlayers,props,classesFab);
    let firstPlayer = cPlayer[0];
    let secondPlayer = cPlayer[1];

    let isEmpty = !(firstPlayer || secondPlayer || cbuttons.length > 0);
    let emptyMessage = <p id={'no-tags-message'}>Per iniziare seleziona un pulsante o un giocatore</p>;
    let visible =<Button onClick={(e) => handlePartial(e, props)} type="button"
                         key="salva" variant="contained" color="primary" className={classes.button}>Parziale
    </Button>;
    if(props.SpeechStoreState.listening){
        visible = null;
    }

    return (
        <div>
            <div id={'selected-tags'} className={isEmpty? 'empty-selected-tags' : 'not-empty-selected-tags'}>
                {isEmpty ? emptyMessage : null}
                {firstPlayer}{cbuttons}{secondPlayer}
            </div>
            {visible}
            <Divider variant="fullWidth"/>
            {vbuttons}
        </div>
    );
}
//Setup grafico dei componenti
const useStyles = makeStyles(theme => ({
    button: {
        margin: theme.spacing(1),
    },
    leftIcon: {
        marginRight: theme.spacing(1),
    },
    rightIcon: {
        marginLeft: theme.spacing(1),
    },
    iconSmall: {
        fontSize: 20,
    },
}));
const useStylesFab = makeStyles(theme => ({
    margin: {
        margin: theme.spacing(1),
    },
    extendedIcon: {
        marginRight: theme.spacing(1),
    },
}));

/**
 * Gestisce il click del bottone parziale
 * @param e
 * @param props
 */
function handlePartial(e,props){
    TagCombinationUtils.checkCompleteCombination(props,null,null,null,true);
}

/**
 * Funzione che dallo store prende le informazioni necessarie e restituisce i tag selezionati
 * @param chosenButtons
 * @param props
 * @param classes
 */
function returnChosenButtons(chosenButtons,props,classes){
    let cbuttons = [];
    for (let index = 0; index < chosenButtons.size; index++) {

        let id = chosenButtons.get(index).id;
        let name = chosenButtons.get(index).name;
        cbuttons.push(<Button onClick={(e) => removePressedButton(e, id, name, props)} type="button"
                              key={id} variant="contained" color="primary" className={classes.button}>
            {name}
        </Button>)

    }
    return cbuttons;
}

/**
 * Rimuove dallo store e dall'interfaccia il giocatore selezionato
 * @param e
 * @param id
 * @param chosenPlayers
 */
function removePressedPlayer(e,id,chosenPlayers) {
    e.preventDefault();
    let update = [];
    for(let i=0;i<chosenPlayers.size;i++){
        if(chosenPlayers.get(i).id !== id){
            update.push(chosenPlayers.get(i));
        }
    }
    TagsActions.remove_player(update);
}
/**
 * Funzione che dallo store prende le informazioni necessarie e restituisce i player selezionati
 * @param chosenButtons
 * @param props
 * @param classes
 */
function returnChosenPlayers(chosenPlayers,props,classes){
    let cPlayers = [];
    for (let index = 0; index < chosenPlayers.size; index++) {

        let number = chosenPlayers.get(index).number;
        if(!number) number = '99';
        let name = chosenPlayers.get(index).name;
        let id = chosenPlayers.get(index).id;
        let node = <div className={'player-container player-container-selected-player'} key={'player-container-selected-' +  id}>
            <Fab key={'selected-player'+id}
                 onClick={(e) => removePressedPlayer(e, id,props.TagsStoreState.chosenPlayers)}
                 color="secondary" aria-label="add" className={classes.margin}>
                {number}
            </Fab>
            <div>{name}</div>
        </div>;
        cPlayers.push(node);

    }
    return cPlayers;
}
/**
 * Funzione che dallo store prende le informazioni necessarie e restituisce i tag visibili
 * @param chosenButtons
 * @param props
 * @param classes
 */
function returnVisibleButtons(visibleButtons,props,classes){
    let vbuttons = [];
    for (let index = 0; index < visibleButtons.size; index++) {
        let id = visibleButtons.get(index).id;
        let name = visibleButtons.get(index).name;
        let disabled = false;
        if(props.VideoStoreState.url ===''){
            disabled = true;
        }
        vbuttons.push(<Button disabled={disabled}  onClick={(e) => handleButtonPressed(e, id, name, props)} type="button"
                              key={id} variant="contained" color="primary" className={classes.button}>
            {name}
        </Button>);

    }
    return vbuttons;
}

/**
 * Gestisce il click dei tag
 * @param e
 * @param id
 * @param name
 * @param props
 */
function handleButtonPressed(e, id, name, props) {
    e.preventDefault();
    if (props.VideoStoreState.playing) {
        VideoPlayerActions.onPlay(false);
    }
    if (canAdd(id, props)) {
        let button = {id: id + '_riepilogo', name: name};
        TagsUtils.replaceVisibleButtons(id, name, props, button);
    }
}

/**
 * Restituisce un booleano per verificare che si possa inserire il tag
 * @param userId
 * @param props
 * @returns {boolean}
 */
function canAdd(userId, props) {
    let buttonFor = props.TagsStoreState.chosenButtons;
    if (buttonFor.size === 0) {
        return true
    }
    let index;
    for (index = 0; index <= buttonFor.size; index++) {
        if (buttonFor.get(index) !== undefined) {
            let finalId = userId + '_riepilogo';
            if (finalId === buttonFor.get(index).id) {
                return false;
            }
        }
    }
    return true
}
/**
 * Rimuove dallo store e dall'interfaccia il tag selezionato
 * @param e
 * @param id
 * @param chosenPlayers
 */
function removePressedButton(e, id, name, props) {
    e.preventDefault();
    let bottoniScelti = props.TagsStoreState.chosenButtons;
    if(id === bottoniScelti.get(0).id){
        TagsActions.reset_ChosenButton();
        return;
    }
    let index;
    let copyList = [];
    for (index = 0; index < bottoniScelti.size; index++) {
        let key = bottoniScelti.get(index).id;
        if (key !== id) {
            copyList.push(bottoniScelti.get(index));
            break;
        }
    }
    if(copyList.length === 0){
        TagsActions.remove_ChosenButton(copyList);
    }
    else{
        let index = null;
        //In questo modo viene gestito solo il primo bottone con quel nome e tag. La loro struttura non dovrebbe permettere duplicati, ma mai dire mai
        for(let i =0;i<props.TagsStoreState.visibleButtonsHistory.size;i++){
            let step = props.TagsStoreState.visibleButtonsHistory.get(i);
            if(id === step.button.id){
                index = i;
            }
        }
        let history =[];
        for(let i=0;i<index;i++){
            history.push(props.TagsStoreState.visibleButtonsHistory.get(i));
        }
        let lastItem = history[history.length - 1];
        TagsActions.remove_ChosenButton_setHistory(history,lastItem,copyList);
    }
}
export default Tags;
