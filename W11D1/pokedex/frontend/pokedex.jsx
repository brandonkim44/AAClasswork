import React from 'react';
import ReactDOM from 'react-dom';
import {RECEIVE_ALL_POKEMON} from './actions/pokemon_actions';
import {receiveAllPokemon} from './actions/pokemon_actions';
import {fetchAllPokemon} from './util/api_util';
import configureStore from '../frontend/store/store';
import {requestAllPokemon} from './actions/pokemon_actions';
import {selectAllPokemon} from './reducers/selectors';
import Root from './components/root';

import { HashRouter, Route } from "react-router-dom";

import { RECEIVE_SINGLE_POKEMON } from './actions/pokemon_actions';
import {receiveSinglePokemon} from './actions/pokemon_actions';

import {itemsReducer} from './reducers/items_reducer';

import { requestSinglePokemon } from './actions/pokemon_actions';
import { fetchSinglePokemon } from './util/api_util';



document.addEventListener('DOMContentLoaded', () => {

    window.RECEIVE_ALL_POKEMON = RECEIVE_ALL_POKEMON;
    window.receiveAllPokemon = receiveAllPokemon;
    window.fetchAllPokemon = fetchAllPokemon;
    window.requestAllPokemon = requestAllPokemon;
    window.selectAllPokemon = selectAllPokemon;
    window.requestSinglePokemon = requestSinglePokemon;
    window.fetchSinglePokemon = fetchSinglePokemon;

    window.RECEIVE_SINGLE_POKEMON = RECEIVE_SINGLE_POKEMON;

    const store = configureStore();
    window.getState = store.getState; 
    window.dispatch = store.dispatch;
    window.receiveSinglePokemon = receiveSinglePokemon;
    window.itemsReducer = itemsReducer;


    const rootEl = document.getElementById('root');
    ReactDOM.render(< Root store={store} />, rootEl);
});