import {Record,List} from "immutable";
/**
 * Valori di default dello store dei matches
 */
const MatchesStoreDefault = Record({
    //Lista competizioni
    competitions: List(),
    //lista partite
    matches: List(),
    //campionato selezionato
    selectedCompetition: 'None',
    permissions: List(),
    //dati partita
    data: List(),
    //matchselezionato
    selectedMatch:-1,
    visualization: null,
    openDropDown: false
});

export default MatchesStoreDefault;
