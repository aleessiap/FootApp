/**
 * Qui in maniera statica vengono generati i tipi di formazione
 * attualmente il sistema potrebbe mostrare formazioni di vario tipo, ma di default viene usato il modulo 4-4-2
 */
const formation4_4_2 = {
    rows: [3, 1, 2, 4, 5, 1, 2, 4, 5, 2, 4],
    cols: [1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4],
};

const formation3_3_4 = {
    rows: [3, 1, 3, 5, 1, 3, 5, 1, 2, 4, 5],
    cols: [1, 2, 2, 2, 3, 3, 3, 4, 4, 4, 4],
};

const formation3_4_3 = {
    rows: [3, 1, 3, 5, 1, 2, 4, 5, 1, 3, 5],
    cols: [1, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4],
};

const formation3_5_2 = {
    rows: [3, 1, 3, 5, 1, 2, 3, 4, 5, 2, 4],
    cols: [1, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4],
};

function getPosition(index, team, formation = '4-4-2'){
    let row = 0;
    let col = 0;

    switch(formation){
        case '4-4-2': row = formation4_4_2.rows[index]; col = formation4_4_2.cols[index]; break;
        case '3-3-4': row = formation3_3_4.rows[index]; col = formation3_3_4.cols[index]; break;
        case '3-4-3': row = formation3_4_3.rows[index]; col = formation3_4_3.cols[index]; break;
        case '3-5-2': row = formation3_5_2.rows[index]; col = formation3_5_2.cols[index]; break;
    }
    return getStyle(row, col, team);
}


/**
 * Viene gestito il campo da calcio con una grid e vengono effettuati i calcoli di setup
 * @param row
 * @param col
 * @param team
 * @returns {{gridRowStart: *, gridColumnStart: number}}
 */
function getStyle(row, col, team){
    if(team !== 'home'){
        col = 8 - col + 1;
    }
    return {
        gridRowStart: row,
        gridColumnStart: col,
    }
}

export default {
    getPosition: getPosition,
}
