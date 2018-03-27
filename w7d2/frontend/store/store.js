import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';
// import { addLoggingToDispatchES6 } from '../todo_redux';

const configureStore = (preloadedState = {}) => {
  const store = createStore(
    rootReducer,
    preloadedState,
    applyMiddleware(addLoggingToDispatchES6)
  );
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};
const addLoggingToDispatchES6 = store => next => action => {
  console.log(store.getState());
  console.log(action);
  next(action);
  console.log(store.getState());
};


export default configureStore;
