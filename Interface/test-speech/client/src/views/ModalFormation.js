import React from "react";
import FormControlLabel from "@material-ui/core/FormControlLabel";
import FormLabel from "@material-ui/core/FormLabel";
import RadioGroup from "@material-ui/core/RadioGroup";
import FormControl from "@material-ui/core/FormControl";
import Radio from "@material-ui/core/Radio";
import makeStyles from "@material-ui/core/styles/makeStyles";
import clsx from "clsx";
import BarApp from "./Appbar";
import Formation_utils from "./Formation_utils";
import Fab from "@material-ui/core/Fab";

//Setup grafico
const useStyles = makeStyles({
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

//Setup grafico
function StyledRadio(props) {
    const classes = useStyles();

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


//Restituisce il componente del cambio giocatore e cambio modulo, ancora non ultimato
function ModalFormation(props) {
    const [value, setValue] = React.useState('Casa');
    const handleChange = event => {
        setValue(event.target.value);
    };
    let display;
    if(props.giocatori){
        display = <Formation value = {value} {...props}/>;
    }else{
        display = <Module value = {value} {...props}/>;
    }

    return (
        <FormControl component="fieldset">
            <FormLabel component="legend">Squadra</FormLabel>
            <RadioGroup value={value} aria-label="Squadra" onChange={handleChange} name="customized-radios">
                <FormControlLabel value="Casa" control={<StyledRadio />} label="Casa" />
                <FormControlLabel value="Fuori" control={<StyledRadio />} label="Fuori" />
            </RadioGroup>
            {display}
        </FormControl>
    )
}

function Module(props) {
    return (
        <div>Module {props.value}</div>
    )
}
//Setup grafico
const useStylesFab = makeStyles(theme => ({
    margin: {
        margin: theme.spacing(1),
    },
    extendedIcon: {
        marginRight: theme.spacing(1),
    },
}));

/**
 * Restituisce la vista del componente cambio formazione
 * @param props
 * @returns {*}
 * @constructor
 */
function Formation(props) {
    const classes = useStylesFab();
    let benchPlayers;
    let teamFormation;
    let DiplayedPlayers = [];
    if(props.value === 'Casa'){
        benchPlayers =  props.PlayerState.HomeBench;
        teamFormation = props.PlayerState.HomeTeamFormation;
    }else{
        benchPlayers = props.PlayerState.AwayBench;
        teamFormation = props.PlayerState.AwayTeamFormation;
    }
    let benchPlayesName='';
    for(let i = 0;i<benchPlayers.size; i++){
        if(benchPlayers.get(i).last_name){
            benchPlayesName += " " + benchPlayers.get(i).last_name;
        }
    }
    for(let i=0;i<teamFormation.size;i++){
        let player = teamFormation.get(i);
        let number = player.number ? player.number : '00';
        let node = <div className={'player-container'} key={'player-containter-' + player.id}
                        style={Formation_utils.getPosition(i, 'home', '4-4-2')}>
            <Fab key={player.id}
                 color="secondary" aria-label="add" className={classes.margin} className = {player.className}
                 data-player-type={player.dataplayertype} size={'small'}>
                {number}
            </Fab>
            <div>{player.last_name}</div>
        </div>
        DiplayedPlayers.push(node);
    }

    return (
        <div>{DiplayedPlayers}</div>
    )
}

export default ModalFormation;



