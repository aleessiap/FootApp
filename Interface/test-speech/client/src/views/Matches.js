import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import MenuItem from '@material-ui/core/MenuItem';
import FormControl from '@material-ui/core/FormControl';
import Select from '@material-ui/core/Select';
import Button from '@material-ui/core/Button';
import {List} from "immutable";
import MatchesActions from "../data/actions/MatchesActions";
import MaterialTable from "material-table";
import DbAPI from "../API/DbAPI";
import FormLabel from "@material-ui/core/FormLabel";
import RadioGroup from "@material-ui/core/RadioGroup";
import FormControlLabel from "@material-ui/core/FormControlLabel";
import Radio from "@material-ui/core/Radio";
import clsx from "clsx";
//Setup grafici per i componenti material
const useStyles = makeStyles(theme => ({
    button: {
        display: 'block',
        marginTop: theme.spacing(2),
    },
    formControl: {
        margin: theme.spacing(1),
        minWidth: 120,
    },
}));

//Ottiene dal database le informazioni necessarie
async function handleMatchSelection(e,id,homeId,awayId,props) {
    await DbAPI.getTagCombinationFromMatch(id);
    await DbAPI.getPlayers(homeId,awayId,id).then().catch();
}
//funzione per la gestione dei radiobutton, non ancora usata
function handleChangeRadioButton(props,value){

}
//Esegue il setup della tabella per visualizzare i dati
function setMaterialTable(matches,props){
    let data = [];
    for (let index = 0; index < matches.size; index++) {
        let d = matches.get(index);
        switch (props.MatchesState.visualization) {
            //controlla lo stato della visualizzazione, ovvero se l'utente voglia controllare i match ancora da fare oppure già finiti, inoltre vengono visualizzati solamente quelli per cui l'utente è abilitato
            case true:
                if(!d.completed){continue;}
                break;
            case false:
                if(d.completed){continue;}
                break;
        }
        let button =(<Button type="button" key={d.id} onClick={(e) => handleMatchSelection(e, d.id,d.home_team_id,d.away_team_id, props)} variant="contained" color="primary">Select</Button>);
        let p = {match_week: d.match_week,result: d.result,date: d.date,time: d.time,home_team_name:d.home_team_name,away_team_name:d.away_team_name,button:button};
        data.push(p);
    }
    return data;
}

function handleChange(event) {
    MatchesActions.update_competition(event.target.value);
}

function handleClose() {
    MatchesActions.set_dropDown(false);
}

function handleOpen() {
    MatchesActions.set_dropDown(true);
}

/**
 * Contiene la vista della pagina matches
 * @param props
 * @returns {*}
 */
export default function Matches(props) {
    let columns = [
        {title: 'Casa', field: 'home_team_name'},
        {title: 'Risultato', field: 'result'},
        {title: 'Fuori-Casa', field: 'away_team_name'},
        {title: 'Settimana', field: 'match_week'},
        {title: 'Ora', field: 'time',},
        {title: 'Data', field: 'date', type: 'datetime'},
        {title: '', field: 'button'}
    ];
    const classes = useStyles();
    const competitions = props.MatchesState.competitions;
    let menu = [];
    for(let index = 0;index < competitions.size;index++) {
        let comp = competitions.get(index);
        menu.push(<MenuItem key={comp.id} value={comp.id} >{comp.name}</MenuItem>);
    }
    let matches = List();
    let selectedCompetitions = props.MatchesState.selectedCompetition;

    if(selectedCompetitions){
        //posso semplificare con una flat
        //praticamente questa parte controllo che l'utente loggato possa vedere solo le partite a sua disposizione
        let permittedMatches = props.MatchesState.permissions.filter(x=>x.analyst ===props.LoginState.id);
        for(let i=0; i < permittedMatches.size;i++){
            let support = props.MatchesState.matches.filter(x=>x.competition_id === selectedCompetitions);
            support = support.filter(x=>x.id === permittedMatches.get(i).matches);
            for(let j=0;j<support.size;j++){
                matches = matches.push(support.get(j));
            }
        }
    }
    let dati;
    if(props.MatchesState.data.size !== 0){
        dati=props.MatchesState.data;
    }else{
        dati = matches;
    }
    try {
        if(dati.size !==0){
            dati= setMaterialTable(matches,props);
        }
    }catch (e) {
        console.log(e);
    }
    try {
        if(dati.length !==0){
            dati= setMaterialTable(matches,props);
        }
    }catch (e) {
        console.log(e);
    }
    for(let index= 0 ; index <props.MatchesState.data.size;index++){
        dati.push(props.MatchesState.data.get(index));
    }
    //Setup grafici
    const useStylesRadioButton = makeStyles({
        root: {
            '&:hover': {
                backgroundColor: 'transparent',
            },
        },
        icon: {
            borderRadius: '50%',
            width: 16,
            height: 16,
            boxShadow: 'inset 0 0 0 1px rgba(16,22,26,.2), inset 0 -1px 0 rgba(16,22,26,.1)',
            backgroundColor: '#f5f8fa',
            backgroundImage: 'linear-gradient(180deg,hsla(0,0%,100%,.8),hsla(0,0%,100%,0))',
            '$root.Mui-focusVisible &': {
                outline: '2px auto rgba(19,124,189,.6)',
                outlineOffset: 2,
            },
            'input:hover ~ &': {
                backgroundColor: '#ebf1f5',
            },
            'input:disabled ~ &': {
                boxShadow: 'none',
                background: 'rgba(206,217,224,.5)',
            },
        },
        checkedIcon: {
            backgroundColor: '#137cbd',
            backgroundImage: 'linear-gradient(180deg,hsla(0,0%,100%,.1),hsla(0,0%,100%,0))',
            '&:before': {
                display: 'block',
                width: 16,
                height: 16,
                backgroundImage: 'radial-gradient(#fff,#fff 28%,transparent 32%)',
                content: '""',
            },
            'input:hover ~ &': {
                backgroundColor: '#106ba3',
            },
        },
    });
    //Setup grafici
    function StyledRadio(props) {
        const classes = useStylesRadioButton();

        return (
            <Radio
                className={classes.root}
                disableRipple
                color="default"
                checkedIcon={<span className={clsx(classes.icon, classes.checkedIcon)} />}
                icon={<span className={classes.icon} />}
                {...props}
            />
        );
    }
    const [value, setValue] = React.useState('Tutte');
    const handleChangeRadioButton = event => {
        setValue(event.target.value);
        let visualization = null;
        switch (event.target.value) {
            case 'Complete':
                visualization = true;
                break;
            case 'Incomplete':
                visualization = false;
                break;
        }
        MatchesActions.set_matches_visualization(visualization);
    };

    return (
        <div>
        <form autoComplete="off">
            <Button className={classes.button}>
                Seleziona il campionato
            </Button>
            <FormControl className={classes.formControl}>
                <Select
                    open={props.MatchesState.openDropDown}
                    onClose={handleClose}
                    onOpen={handleOpen}
                    value={props.MatchesState.selectedCompetition}
                    onChange={handleChange}
                    inputProps={{
                        name: 'age',
                        id: 'demo-controlled-open-select',
                    }}
                >
                    <MenuItem value="">
                        <em>None</em>
                    </MenuItem>
                    {menu}
                </Select>
            </FormControl>
        </form>
            <FormControl component="fieldset">
                <FormLabel component="legend">Opzioni Tabella</FormLabel>
                <RadioGroup value={value} aria-label="Squadra" onChange={handleChangeRadioButton} name="customized-radios">
                    <FormControlLabel value="Complete" control={<StyledRadio />} label="Complete" />
                    <FormControlLabel value="Incomplete" control={<StyledRadio />} label="Incomplete" />
                    <FormControlLabel value="Tutte" control={<StyledRadio />} label="Tutte" />
                </RadioGroup>
            </FormControl>
            <MaterialTable
                title="Partite"
                columns={columns}
                data={dati}
            />
        </div>
    );
}
