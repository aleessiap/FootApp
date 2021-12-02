import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';
import Typography from '@material-ui/core/Typography';
import IconButton from '@material-ui/core/IconButton';
import MenuIcon from '@material-ui/icons/Menu';
import PagesLink from '../data/default/PagesLinkDefault';
import PagesLinkActions from '../data/actions/PagesLinkActions';
import AccountCircle from '@material-ui/icons/AccountCircle';
import MenuItem from '@material-ui/core/MenuItem';
import Menu from '@material-ui/core/Menu';
import SwipeableDrawer from '@material-ui/core/SwipeableDrawer';
import List from '@material-ui/core/List';
import Divider from '@material-ui/core/Divider';
import ListItem from '@material-ui/core/ListItem';
import ListItemIcon from '@material-ui/core/ListItemIcon';
import ListItemText from '@material-ui/core/ListItemText';
import InboxIcon from '@material-ui/icons/MoveToInbox';
import MailIcon from '@material-ui/icons/Mail';
import Button from "@material-ui/core/Button";
import DbAPI from "../API/DbAPI";
import VideoPlayerActions from "../data/actions/VideoPlayerActions";
import Modal from "@material-ui/core/Modal";
import Box from '@material-ui/core/Box';
import useTheme from "@material-ui/core/styles/useTheme";
import Tab from "@material-ui/core/Tab";
import Tabs from "@material-ui/core/Tabs";
import SwipeableViews from 'react-swipeable-views';
import ModalFormation from "./ModalFormation";


/**
 * Funzione di style per i componenti Material
 * @type {StylesHook<Styles<Theme, {}, string>>}
 */
const useStyles = makeStyles(theme => ({
    root: {
        flexGrow: 1,
    },
    menuButton: {
        marginRight: theme.spacing(2),
    },
    title: {
        flexGrow: 1,
    },
}));

/**
 * Funzione per il redirect della pagina
 * @constructor
 */
function GoToLogin(){
    PagesLinkActions.redirect_page(PagesLink.LOGIN);
}

/**
 * Funzione per gestire il redirect della pagina dalla sidebar
 * @param e
 * @param text
 */
function handleListItemClick(e,text){
    switch (text) {
        case 'App':
            return PagesLinkActions.redirect_page(PagesLink.MAIN_PAGE);
        case 'Matches':
            return PagesLinkActions.redirect_page(PagesLink.MATCHES);
    }
}

/**
 * Funzione vista per la navbar del sito
 * @param props
 * @returns {*}
 * @constructor
 */
function BarApp(props) {
    //Setup grafico e gestione stato interno navbar
    const classes = useStyles();
    const [auth, setAuth] = React.useState(true);
    const [anchorEl, setAnchorEl] = React.useState(null);
    const open = Boolean(anchorEl);
    const [state, setState] = React.useState({
        top: false,
        left: false,
        bottom: false,
        right: false,
    });
    const toggleDrawer = (side, open) => event => {
        if (event && event.type === 'keydown' && (event.key === 'Tab' || event.key === 'Shift')) {
            return;
        }

        setState({ ...state, [side]: open });
    };
    //Creazione componente per la sidebar
    const sideList = side => (
        <div
            className={classes.list}
            role="presentation"
            onClick={toggleDrawer(side, false)}
            onKeyDown={toggleDrawer(side, false)}
        >
            <List>
                {['App','Matches', 'Github', 'Team', 'About'].map((text, index) => (
                    <ListItem button key={text} onClick={(e) => handleListItemClick(e,text)}>
                        <ListItemIcon>{index % 2 === 0 ? <InboxIcon /> : <MailIcon />}</ListItemIcon>
                        <ListItemText primary={text} />
                    </ListItem>
                ))}
            </List>
            <Divider />
            <List>
                {['Prova', 'Prova2', 'Setting'].map((text, index) => (
                    <ListItem button key={text}>
                        <ListItemIcon>{index % 2 === 0 ? <InboxIcon /> : <MailIcon />}</ListItemIcon>
                        <ListItemText primary={text} />
                    </ListItem>
                ))}
            </List>
        </div>
    );
    //Creazione del componente per la sidebar
    const fullList = side => (
        <div
            className={classes.fullList}
            role="presentation"
            onClick={toggleDrawer(side, false)}
            onKeyDown={toggleDrawer(side, false)}
        >
            <List>
                {['Matches', 'Github', 'Team', 'About'].map((text, index) => (
                    <ListItem button key={text}>
                        <ListItemIcon>{index % 2 === 0 ? <InboxIcon /> : <MailIcon />}</ListItemIcon>
                        <ListItemText primary={text} />
                    </ListItem>
                ))}
            </List>
            <Divider />
            <List>
                {['Prova', 'Prova', 'Setting'].map((text, index) => (
                    <ListItem button key={text}>
                        <ListItemIcon>{index % 2 === 0 ? <InboxIcon /> : <MailIcon />}</ListItemIcon>
                        <ListItemText primary={text} />
                    </ListItem>
                ))}
            </List>
        </div>
    );
    function handleChange(event) {
        setAuth(event.target.checked);
    }

    function handleMenu(event) {
        setAnchorEl(event.currentTarget);
    }

    function handleClose() {
        setAnchorEl(null);
    }

    function handleModuleClick() {
        handleOpenModal()
    }

    function getModalStyle() {
        const topModal = 50 ;
        const leftModal = 50 ;

        return {
            top: `${topModal}%`,
            left: `${leftModal}%`,
            transform: `translate(-${topModal}%, -${leftModal}%)`,
        };
    }
    const useStylesModal = makeStyles(theme => ({
        paper: {
            position: 'absolute',
            width: 800,
            height:800,
            backgroundColor: theme.palette.background.paper,
            border: '2px solid #000',
            boxShadow: theme.shadows[5],
            padding: theme.spacing(2, 4, 3),
        },
    }));

    const classesModal = useStylesModal();
    const [modalStyle] = React.useState(getModalStyle);
    const [openModal, setOpenModal] = React.useState(false);
    const handleOpenModal = () => {
        setOpenModal(true);
    };

    const handleCloseModal = () => {
        setOpenModal(false);
    };

    const classesTabs = useStylesTabs();
    const themeTabs = useTheme();
    const [value, setValue] = React.useState(0);
    const handleChangeTabs = (event, newValue) => {
        setValue(newValue);
    };
    const handleChangeIndex = index => {
        setValue(index);
    };
    //Restituisco la navbar completa
    return (
        <div className={classes.root}>
            <SwipeableDrawer
                open={state.left}
                onClose={toggleDrawer('left', false)}
                onOpen={toggleDrawer('left', true)}
            >
                {sideList('left')}
            </SwipeableDrawer>
            <SwipeableDrawer
                anchor="top"
                open={state.top}
                onClose={toggleDrawer('top', false)}
                onOpen={toggleDrawer('top', true)}
            >
                {fullList('top')}
            </SwipeableDrawer>
            <SwipeableDrawer
                anchor="bottom"
                open={state.bottom}
                onClose={toggleDrawer('bottom', false)}
                onOpen={toggleDrawer('bottom', true)}
            >
                {fullList('bottom')}
            </SwipeableDrawer>
            <SwipeableDrawer
                anchor="right"
                open={state.right}
                onClose={toggleDrawer('right', false)}
                onOpen={toggleDrawer('right', true)}
            >
                {sideList('right')}
            </SwipeableDrawer>
            <Modal
                aria-labelledby="simple-modal-title"
                aria-describedby="simple-modal-description"
                open={openModal}
                onClose={handleCloseModal}
            >
                <div style={modalStyle} className={classesModal.paper}>
                    <Tabs
                        value={value}
                        onChange={handleChangeTabs}
                        indicatorColor="primary"
                        textColor="primary"
                        variant="fullWidth"
                        aria-label="full width tabs example"
                    >
                        <Tab label="Cambio Giocatori" {...a11yProps(0)} />
                        <Tab label="Cambio Modulo" {...a11yProps(1)} />
                    </Tabs>
                    <SwipeableViews
                        axis={themeTabs.direction === 'rtl' ? 'x-reverse' : 'x'}
                        index={value}
                        onChangeIndex={handleChangeIndex}
                    >
                        <TabPanel value={value} index={0} dir={themeTabs.direction}>
                            <ModalFormation giocatori ={true} {...props}/>
                        </TabPanel>
                        <TabPanel value={value} index={1} dir={themeTabs.direction}>
                            <ModalFormation giocatori ={false} {...props}/>
                        </TabPanel>
                    </SwipeableViews>
                </div>
            </Modal>

            <AppBar position="static">
                <Toolbar>
                    <IconButton onClick={toggleDrawer('left', true)} edge="start" className={classes.menuButton} color="inherit" aria-label="menu">
                        <MenuIcon />
                    </IconButton>
                    <Typography variant="h6" className={classes.title}>
                        Footure Analytics - {props.PagesLinkState}
                    </Typography>

                    <input type="file" id="input-file" onChange={event => handleFileChooser(event)} accept="video/mp4,video/x-m4v,video/*"/>
                    <Button  type="button" onClick={() => document.getElementById('input-file').click()}
                        variant="contained" color="primary" className={classes.button + " btns-toolbar " + checkIfHidden(props)}
                    >
                        <img alt={'carica un video'} src={"./images/load.png"} className={'images-toolbar'}/>
                        Carica video partita
                    </Button>
                    <Button  type="button" onClick={(e) => handleUploadCombinations(props)}
                             key="send" variant="contained" color="primary" className={classes.button + " btns-toolbar " + checkIfHidden(props)}>
                        <img alt={'salva combinazione sul database'} src={"./images/save.png"} className={'images-toolbar'}/>
                        Salva combinazioni
                    </Button>
                    {auth && (
                        <div>
                            <IconButton
                                aria-label="account of current user"
                                aria-controls="menu-appbar"
                                aria-haspopup="true"
                                onClick={handleMenu}
                                color="inherit"
                            >
                                <AccountCircle />
                            </IconButton>
                            <Menu
                                id="menu-appbar"
                                anchorEl={anchorEl}
                                anchorOrigin={{
                                    vertical: 'top',
                                    horizontal: 'right',
                                }}
                                keepMounted
                                transformOrigin={{
                                    vertical: 'top',
                                    horizontal: 'right',
                                }}
                                open={open}
                                onClose={handleClose}
                            >
                                <MenuItem onClick={handleClose}>Profile</MenuItem>
                                <MenuItem onClick={handleClose}>My account</MenuItem>
                            </Menu>
                        </div>
                    )}
                </Toolbar>
            </AppBar>
        </div>
    );
}
function TabPanel(props) {
    const { children, value, index, ...other } = props;

    return (
        <Typography
            component="div"
            role="tabpanel"
            hidden={value !== index}
            id={`full-width-tabpanel-${index}`}
            aria-labelledby={`full-width-tab-${index}`}
            {...other}
        >
            <Box p={2}>{children}</Box>
        </Typography>
    );
}


function a11yProps(index) {
    return {
        id: `full-width-tab-${index}`,
        'aria-controls': `full-width-tabpanel-${index}`,
    };
}
const useStylesTabs = makeStyles(theme => ({
    root: {
        backgroundColor: theme.palette.background.paper,
        width: 500,
    },
}));
async function handleUploadCombinations(props){
    if(props.TagCombinationTableState.size ===0){return;}
    let {List} = require('immutable');
    let to_upload = List();
    let data = props.TagCombinationTableState;
    for(let index =0; index < data.size; index++){
        if(!data.get(index).uploaded){
            to_upload = to_upload.push(data.get(index));
        }
    }
    DbAPI.uploadCombination(to_upload).then().catch();
}

function handleFileChooser(e){
    var file = e.target.files[0];
    if(file){
        var url = URL.createObjectURL(file);
        VideoPlayerActions.loadVideo(url);
    }

}

function checkIfHidden(props){
    let state= props.PagesLinkState;
    if(state === PagesLink.MATCHES || (state === PagesLink.MAIN_PAGE && props.MatchesState.selectedMatch === -1)){
        return 'hidden';
    }
}

export default BarApp;
