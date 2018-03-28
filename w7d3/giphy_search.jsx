import React from 'react';
import ReactDOM from 'react-dom';
import {configStore} from './store/store';
import Root from './components/root';
import {fetchSearchGiphys} from './util/api_util';
import {receiveSearchGiphys} from './actions/giphy_actions';


document.addEventListener("DOMContentLoaded", () => {
  const store = configStore;
  const root = document.getElementById('root');

  ReactDOM.render(<Root store={ store } />, root);
});
