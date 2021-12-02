import TagsActions from "../data/actions/TagsActions";
import LoginActions from "../data/actions/LoginActions"
import MatchesActions from "../data/actions/MatchesActions";
import PlayersActions from "../data/actions/PlayersActions";
import PagesLinkActions from "../data/actions/PagesLinkActions";
import PagesLinkDefault from "../data/default/PagesLinkDefault";
import TagCombinationTableActions from "../data/actions/TagCombinationTableActions";

/**
 * Chiama il server alla api /api/get_tags e quella /api/get_tagCombinations
 * Salva i dati nello store
 * Tags,TagsCombination,DefaultButtons,VisibleButtons
 * @returns {Promise<void>}
 */
 async function getTagsAndTagCombinations(){
    //Richiesta al server con i tag
     const responseTags = await fetch('/api/get_tags');
     let tags = await responseTags.json();
     if (responseTags.status !== 200) throw Error(tags.message);
     TagsActions.loadTags(tags);
     //Richiesta al server con i tagCombination
     const responseTagCombinations = await fetch('/api/get_tagCombinations');
     let tagCombinations = await responseTagCombinations.json();
     if (responseTagCombinations.status !== 200) throw Error(tagCombinations.message);
     //Carico nello store le TagCombination
     TagsActions.loadTagCombinations(tagCombinations);
     //Estrazione dei tag che compaiono come iniziali nelle tagcombination
     let listOfString = [];
     for(let index = 0 ;index< tagCombinations.length;index++){
         let array = tagCombinations[index]['name'].split(", ");
         if(!listOfString.includes(array[0])){
             listOfString.push(array[0]);
         }
     }
     let listOfPrimaryTag = [];
     for(let index=0;index < tags.length;index++){
         if(listOfString.includes(tags[index]['name'])){
             listOfPrimaryTag.push(tags[index]);
         }
     }
    //Carico sullo store i bottoni di default e di quelli visibili
     TagsActions.load_VisibleButtons(listOfPrimaryTag);
     TagsActions.load_DefaultButtons(listOfPrimaryTag);
 }

/**
 * Manda al server le credenziali dell'utente
 * @param username string
 * @param password string
 * @returns {Promise<void>}
 */
 async function getUser(username,password){
     let body = JSON.stringify({username:username , password:password});
     //Richiesta al server con le credenziali per autenticare
     const response = await fetch('/api/get_auth', {
         method: 'POST',
         headers: {
             'Content-Type': 'application/json',
         },
         body:body
     });
     //Manca il controllo su errore del backend
     LoginActions.login_completed(await response.json());
 }

/**
 * Salva i controtag ottenuti via api nello store
  * @returns {Promise<void>}
 */
async function getControTag(){
     const responseControTag = await fetch('/api/get_controTag');
     let controTag = await responseControTag.json();
     if (responseControTag.status !== 200) throw Error(controTag.message);
     TagsActions.loadControTag(controTag);
 }

/**
 * Salva i campionati e i relativi matches nello store
 * @returns {Promise<void>}
 */
 async function getMatches(){
     const responseCompetitions = await fetch('/api/get_competitions');
     let competitions = await responseCompetitions.json();
     if (responseCompetitions.status !== 200) throw Error(competitions.message);
     const responseMatches = await fetch('/api/get_matches');
     let matches = await responseMatches.json();
     console.log(responseMatches);
     if (responseMatches.status !== 200) throw Error(matches.message);
     MatchesActions.load_competitions_matches(competitions,matches);
 }

/**
 * Ottiene i player del relativo match selezionato
 * @param homeId int
 * @param awayId int
 * @param id int
 * @returns {Promise<void>}
 */
async function getPlayers(homeId,awayId,id){
    let body = JSON.stringify({home:homeId , away:awayId});
    const responsePlayers = await fetch('/api/get_players', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body:body
    });
    let players = await responsePlayers.json();
    setupFormation(id,players);
}

/**
 * Ottiene le tagcombination già inserite per quel match
 * @param match_id
 * @returns {Promise<void>}
 */
async function getTagCombinationFromMatch(match_id) {
    let body = JSON.stringify({match_id:match_id});
    const responsePlayers = await fetch('/api/get_tagcombinationFromMatch', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body:body
    });
    let combinations = await responsePlayers.json();
    TagCombinationTableActions.load_combinations(combinations);
}

/**
 * Salva nello store le formazioni per le due squadre del match
 * @param id int
 * @param players json
 */
function setupFormation(id,players){
    let standarModuleHome = setStandareModule(players.home);
    let standarModuleAway = setStandareModule(players.away);
    let homeformation = standarModuleHome.formation;
    let awayformation = standarModuleAway.formation;
    PlayersActions.load_players(players,homeformation,awayformation,standarModuleHome.bench,standarModuleAway.bench);
    PagesLinkActions.redirect_page(PagesLinkDefault.MAIN_PAGE);
    MatchesActions.set_selected_match(id);
}

/**
 * Crea la formazione tramite il modulo standard 4-4-2
 * @param fullteam arr
 * @returns json
 */
function setStandareModule(fullteam){
    console.log(fullteam);
    let bench = fullteam;
    let formation = [];
    let goalkeeper = false;
    let defenders = 0;
    let midfielder = 0;
    let forward = 0;
    for(let index =0;index<fullteam.length;index++){
        let player = fullteam[index];

        if(!goalkeeper){
            if(player.position === 'Goalkeeper'){
                formation.push(player);
                bench.splice(index,1);
                goalkeeper = true;
                continue;
            }
        }
        if(defenders < 4){
            if(player.position === 'Defender'){
                formation.push(player);
                bench.splice(index,1);
                defenders ++;
                continue;
            }
        }
        if(midfielder < 4){
            if(player.position === 'Midfielder'){
                formation.push(player);
                bench.splice(index,1);
                midfielder ++;
                continue;
            }
        }
        if(forward < 2){
            if(player.position === 'Forward'){
                formation.push(player);
                bench.splice(index,1);
                forward ++;
                continue;
            }
        }
    }
     return {formation:formation,bench:bench};
}

/**
 * Salva gli eventi sul database quando l'utente decide di salvarli
 * @param data
 * @returns {Promise<void>}
 */
async function uploadCombination(data){
    let new_data =[];
    for(let index = 0;index<data.size;index++ ){
        data.get(index).button = "";
        delete data.get(index).tableData;
        let body = JSON.stringify({data:data.get(index)});
        const responseUpload = await fetch('/api/upload_events', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body:body
        });
        new_data.push(await responseUpload.json())
    }
    TagCombinationTableActions.uploaded_combinations(new_data);
}

 export default
 {
        getTagsAndTagCombinations: getTagsAndTagCombinations,
        checkAuth: getUser,
        getMatches: getMatches,
        getPlayers: getPlayers,
        getTagCombinationFromMatch: getTagCombinationFromMatch,
        getControTag:getControTag,
        uploadCombination : uploadCombination
 }
