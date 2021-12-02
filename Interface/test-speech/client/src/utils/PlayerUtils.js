import VideoPlayerActions from "../data/actions/VideoPlayerActions";
import TagsActions from "../data/actions/TagsActions";
import TagCombinationUtils from "./TagCombinationUtils";

/**
 * Funzione che gestisce il click su un player(scelta)
 * @param e
 * @param player
 * @param props
 */
function handleSelectedPlayer(e,player,props){
    //Se il video è in esecuzione viene interrotto
    if (props.VideoStoreState.playing) {
        VideoPlayerActions.onPlay(false);
    }
    let chosenPlayers = props.TagsStoreState.chosenPlayers;
    //Se sono stati già inseriti due giocati esco
    if(chosenPlayers.size === 2){return;}
    //Se è il primo player inserito lancio un'azione sullo store salvando i dati, e controllando se inserendo il giocatore l'evento sia completo
    if(chosenPlayers.size===0){
        TagsActions.add_ChosenPlayer({id:player.id,number:player.number,name:player.last_name,team_id:player.team_id});
        TagCombinationUtils.checkCompleteCombination(props,null,null,player);
    }else{
        //Controllo che non venga inserito due volte lo stesso giocatore
        for(let i=0;i<chosenPlayers.size;i++){
            if(chosenPlayers.get(i).id === player.id){
                return;
            }
        }
        TagsActions.add_ChosenPlayer({id:player.id,number:player.number,name:player.last_name,team_id:player.team_id});
        TagCombinationUtils.checkCompleteCombination(props,null,null,player);
    }
}
export default {
    handleSelectedPlayer: handleSelectedPlayer
};
