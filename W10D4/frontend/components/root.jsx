import { Provider } from 'react-redux';
import React from 'react';
import { App } from './app';
import { configureStore } from "./../store/store";

const store = configureStore(); //come back to how to pass in store to Root
const Root = ({ store }) => (
    <Provider store={store}>
      <App />
    </Provider>
  );
  
  export default Root;