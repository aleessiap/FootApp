import {Record,List} from "immutable";

/**
 * Valori di default dello store dei player
 */
const PlayerStoreDefault = Record({
    HomeTeamPlayers: List(),
    HomeTeamFormation:List(),
    AwayTeamPlayers:List(),
    AwayTeamFormation:List(),
    HomeBench:List(),
    AwayBench:List()
});

export default PlayerStoreDefault;
