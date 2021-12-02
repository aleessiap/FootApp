import React from 'react';
import VideoPlayer from "./VideoPlayer";
import Tags from "./Tags";
import Speech from "./Speech";
import css from "./css/AppView.css";
import TagCombinationTable from "./TagCombinationTable";
import Notes from "./Notes";
import BarApp from "./Appbar"
import PagesLink from '../data/default/PagesLinkDefault';
import SignIn from "./Login";
import FootballFieldCss from "./FootballFieldCss";
import Matches from "./Matches";
import Button from "@material-ui/core/Button";
import Modal from "@material-ui/core/Modal";
import {makeStyles} from "@material-ui/core";

/**
 * Funzione che gestisce la visualizzazione attuale della pagina
 * @param props
 * @returns {*}
 * @constructor
 */
function AppView(props) {
    //codice migliorabile


    switch (props.PagesLinkState) {
        case PagesLink.LOGIN:
            return SignIn(props);
        case PagesLink.MATCHES:
            return ShowMatches(props);
        case PagesLink.MAIN_PAGE:
            if(props.LoginState.id === ''){
                 return SignIn(props);
            }
            if(props.MatchesState.selectedMatch === -1){
                return ShowMatches(props);
            }
            return ShowMainPage(props);
    }
}

/**
 * Restituisce la schermata principale dell'app quella in cui viene effettuata l'analisi della partita
 * @param props
 * @returns {*}
 * @constructor
 */
function ShowMainPage(props){

    return(
        <div>
            <nav className="fixed-nav-bar">
                <BarApp {...props}/>
            </nav>
            <div id='griddiv'>
                <div id='div-videoplayer'>
                    {props.VideoStoreState.url === '' ? loadVideoButton : <VideoPlayer {...props} />}
                </div>
                <div id='div-table-speech'>
                    <TagCombinationTable {...props} />
                    <div id="div-container-notes-speech">
                        <Notes {...props} />
                        <Speech {...props} />
                    </div>
                </div>
                <div id='div-footballfield'>
                    <FootballFieldCss {...props}/>
                </div>
                <div id='div-tags'>
                    <Tags {...props} />
                </div>

            </div>
        </div>
    )
}

/**
 * Restituisce la schermata con la scelta del campionato e della partita
 * @param props
 * @constructor
 */
function ShowMatches(props){
    return(
        <div>
            <nav className="fixed-nav-bar">
                <BarApp {...props}/>
            </nav>
            <Matches {...props}/>
        </div>
    )
}

const loadVideoButton = <Button  type="button" onClick={() => document.getElementById('input-file').click()}
                                 variant="contained" color="primary" className={"load-btn-videoplayer"}
                        >
                            <img alt={'carica un video'} src={"./images/load.png"} className={'images-toolbar'}/>
                            Carica video partita
                        </Button>
export default AppView;
