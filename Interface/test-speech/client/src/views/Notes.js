import React from "react";
import NoteActions from "../data/actions/NoteActions";

//Funzione che dovrò gestire la pressione del bottone Enter
function handleKeyPress(e,press){

}

/**
 * Funzione che gestisce l'aggiornamento delle note inviando i dati allo store
 * @param e
 * @param props
 */
function handleChange(e, props) {
    NoteActions.update_note(e.target.value);
}

/**
 * Restituisce il componente grafico delle note
 * @param props
 * @returns {*}
 * @constructor
 */
function Notes(props) {
    return (
        <input value={props.NotesStore} id="input-notes" onChange={(e) => handleChange(e, props)} onKeyDown={(e) => handleKeyPress(e, props)} type="text"/>
    )
}

export default Notes;



