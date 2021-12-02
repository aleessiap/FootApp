import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';

import registerServiceWorker from './registerServiceWorker';
import AppContainer from "./containers/AppContainer";
import DbAPI from "./API/DbAPI"

DbAPI.getTagsAndTagCombinations().then().catch();
DbAPI.getMatches().then().catch();
DbAPI.getControTag().then().catch();
ReactDOM.render(<AppContainer />, document.getElementById('root'));
registerServiceWorker();
