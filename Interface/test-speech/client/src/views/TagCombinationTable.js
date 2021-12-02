import MaterialTable from "material-table";
import React from "react";
import TagCombinationTableActions from "../data/actions/TagCombinationTableActions";
import {makeStyles} from "@material-ui/core";
import Modal from '@material-ui/core/Modal';

let noteText = '';

/**
 * Gestisce il click sulla riga della tabella
 * @param func
 * @param row
 */
function handleRowSelection(func,row){
    noteText = row.note;
    func();
}

/**
 *Gestisce il modal al click della riga della tabella
 */

function getModalStyle() {
    const top = 50 ;
    const left = 50 ;

    return {
        top: `${top}%`,
        left: `${left}%`,
        transform: `translate(-${top}%, -${left}%)`,
    };
}

const useStyles = makeStyles(theme => ({
    paper: {
        position: 'absolute',
        width: 400,
        backgroundColor: theme.palette.background.paper,
        border: '2px solid #000',
        boxShadow: theme.shadows[5],
        padding: theme.spacing(2, 4, 3),
    },
}));

/**
 * Restituisce il componente visivo della tabella
 * @param props
 * @returns {*}
 * @constructor
 */
function TagCombinationTable(props) {
    const classes = useStyles();
    const [modalStyle] = React.useState(getModalStyle);
    const [open, setOpen] = React.useState(false);
    const handleOpen = () => {
        setOpen(true);
    };

    const handleClose = () => {
        setOpen(false);
    };
    //Setup della tabella
    let columns = [
        {title: 'Players', field: 'players'},
        {title: 'Tag Combination', field: 'tagcombination'},
        {title: 'Time', field: 'time', type: 'numeric'},
        {title: 'User', field: 'user'},
        {title: '', field: 'button'}
    ];
    let data = [];
    for (let index = 0; index < props.TagCombinationTableState.size; index++) {
        let d = props.TagCombinationTableState.get(index);
        let uploaded =  "\u2717";
        if(d.uploaded === true){
            uploaded = "\u2713";
        }
        d.button = uploaded;
        data.push(d);
    }
    return (
        <div id={'material-table-wrapper'}>
            <MaterialTable
                localization={{
                    body: {
                        emptyDataSourceMessage: 'Nessun dato'
                    }
                }}
                title={'Tag Combination'}
                options={customOptions}
                columns={columns}
                data={data}
                onRowClick={((evt, selectedRow) => {
                        handleRowSelection(handleOpen,selectedRow);
                    }
                )}
                editable={{
                    onRowDelete: oldData =>
                        new Promise(resolve => {
                            resolve();
                            data = data.splice(data.indexOf(oldData), 1);
                            TagCombinationTableActions.remove_combination(oldData);
                        }),
                }}
            />
            <Modal
                aria-labelledby="simple-modal-title"
                aria-describedby="simple-modal-description"
                open={open}
                onClose={handleClose}
            >
                <div style={modalStyle} className={classes.paper}>
                    <h2 id="simple-modal-title">Nota</h2>
                    <p id="simple-modal-description">
                        {noteText}
                    </p>
                </div>
            </Modal>
        </div>

    )

}
//Setup grafico della dimensione della tabella
const customOptions = {
    pageSize: 4,
    pageSizeOptions: [2, 4, 6],
}
// div della tabella: 90% del genitore
// div del footer: posizione assoluta, top 87%
// adattare larghezza a metà e metà



export default TagCombinationTable;
