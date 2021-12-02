import {Record,List,OrderedMap} from "immutable";
/**
 * Valori di default dello store dei tag,tagcombination e le relative logiche di ricerca
 */
const TagsButtonDefault = Record({
    visibleButtons:List(),
    chosenButtons:List(),
    chosenPath:List(),
    defaultButtons: List(),
    tagCombinations: List(),
    pathsSet:List(),
    tempSetButtons:List(),
    tagCombSet: List(),
    visibleButtonsHistory: List(),
    possibleTagCombination:List(),
    controTags:List(),
    chosenPlayers:List(),
    tagsMap: OrderedMap(),
    chosenButtonsId:List()
});

export default TagsButtonDefault;
