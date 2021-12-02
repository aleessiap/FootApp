import AppView from '../views/AppView';
import {Container} from 'flux/utils';
import VideoStore from '../data/stores/VideoStore';
import VideoPlayerActions from '../data/actions/VideoPlayerActions'
import TagsActions from "../data/actions/TagsActions";
import TagsStore from "../data/stores/TagsStore";
import SpeechStore from "../data/stores/SpeechStore";
import VocalActions from "../data/actions/VocalActions";
import TagCombinationTableStore from "../data/stores/TagCombinationTableStore";
import TagCombinationTableActions from "../data/actions/TagCombinationTableActions";
import PagesLinkStore from "../data/stores/PagesLinkStore";
import PagesLinkAction from "../data/actions/PagesLinkActions";
import LoginFormStore from "../data/stores/LoginFormStore";
import LoginStore from "../data/stores/LoginStore";
import LoginFormActions from "../data/actions/LoginFormActions";
import PlayersStore from "../data/stores/PlayersStore";
import MatchesStore from "../data/stores/MatchesStore";
import NotesStore from "../data/stores/NotesStore";

/**
 * Funzione che configura gli store
 * @returns arrays of store
 */
function getStores() {
    return [
        VideoStore,
        TagsStore,
        SpeechStore,
        TagCombinationTableStore,
        PagesLinkStore,
        LoginFormStore,
        LoginStore,
        PlayersStore,
        MatchesStore
    ];
}

/**
 * Funzione che configura gli stati degli store per il container
 * @returns {{LoginFormState: Promise<NavigationPreloadState>, SpeechStoreState: Promise<NavigationPreloadState>, LoadPaths: TagsActions.load_Paths, LoadVisibleButton: TagsActions.load_VisibleButtons, PlayerState: Promise<NavigationPreloadState>, PlayPauseVideo: VideoPlayerActions.playPauseVideo, AddChosenButton: TagsActions.add_ChosenButtonSingle, ChangeUsernameLogin: LoginFormActions.username_change, PagesLinkState: Promise<NavigationPreloadState>, TagCombinationTableState: Promise<NavigationPreloadState>, StopVideo: VideoPlayerActions.stopVideo, NotesStore: Promise<NavigationPreloadState>, ResetChosenButtons: TagsActions.reset_ChosenButton, SpeechListening: VocalActions.SpeechListening, AddCombination: TagCombinationTableActions.add_Combination, TagsStoreState: Promise<NavigationPreloadState>, PagesRedirect: PagesLinkActions.redirect_page, ChangePasswordLogin: LoginFormActions.password_change, LoadVideo: VideoPlayerActions.loadVideo, LoginState: Promise<NavigationPreloadState>, MatchesState: Promise<NavigationPreloadState>, VideoStoreState: Promise<NavigationPreloadState>, LoadVideoFromPath: VideoPlayerActions.loadVideoFromPath, ToggleLight: VideoPlayerActions.toggleLight}}
 */
function getState() {
    return {
        VideoStoreState: VideoStore.getState(),
        TagsStoreState : TagsStore.getState(),
        SpeechStoreState: SpeechStore.getState(),
        TagCombinationTableState : TagCombinationTableStore.getState(),
        PagesLinkState : PagesLinkStore.getState(),
        LoginFormState: LoginFormStore.getState(),
        LoginState: LoginStore.getState(),
        PlayerState: PlayersStore.getState(),
        MatchesState: MatchesStore.getState(),
        NotesStore: NotesStore.getState(),

        PagesRedirect : PagesLinkAction.redirect_page,
        AddCombination : TagCombinationTableActions.add_Combination,
        ChangeUsernameLogin : LoginFormActions.username_change,
        ChangePasswordLogin : LoginFormActions.password_change,

        LoadVideoFromPath: VideoPlayerActions.loadVideoFromPath,
        SpeechListening : VocalActions.SpeechListening,
        PlayPauseVideo : VideoPlayerActions.playPauseVideo,
        LoadVideo : VideoPlayerActions.loadVideo,
        StopVideo : VideoPlayerActions.stopVideo,
        ToggleLight : VideoPlayerActions.toggleLight,
        LoadVisibleButton: TagsActions.load_VisibleButtons,
        LoadPaths: TagsActions.load_Paths,
        ResetChosenButtons : TagsActions.reset_ChosenButton,
        AddChosenButton : TagsActions.add_ChosenButtonSingle
    };
}

export default Container.createFunctional(AppView, getStores, getState);
