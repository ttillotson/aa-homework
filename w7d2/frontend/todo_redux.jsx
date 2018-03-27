import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

function addLoggingToDispatch(store) {
  return (next) => {
    return (action) => {
      console.log(store.getState());
      console.log(action);
      store.dispatch(action);
      console.log(store.getState());
    };
  };
}

const addLoggingToDispatchES6 = store => next => action => {
  console.log(store.getState());
  console.log(action);
  store.dispatch(action);
  console.log(store.getState());
};

function applyMiddlewares (store, ...middleWares) {
  let dispatch = store.dispatch;
  middleWares.forEach((middleWare) => {
    dispatch = middleWare(store)(dispatch);
  });
  return Object.assign({}, store, { dispatch });
}

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);
  // store = applyMiddlewares(store, addLoggingToDispatchES6);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
