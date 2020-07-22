import * as APIUtil from '../util/api_util';


export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';
export const RECEIVE_SINGLE_POKEMON = "RECEIVE_SINGLE_POKEMON";
//payload from jbuilder
export const receiveSinglePokemon = (payload) => {
    return (
        {
            type: RECEIVE_SINGLE_POKEMON,
            pokemon: payload.pokemon,
            items: payload.items
        }
    )
};

export const receiveAllPokemon = (pokemon) => {
    return (
        {
            type: RECEIVE_ALL_POKEMON,
            pokemon: pokemon //this value of pokemon is the JSON object that was created by jbuilder
        }
    )
};
//thunk action creator
export const requestAllPokemon = () => (dispatch) => (
  APIUtil.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
)

export const requestSinglePokemon = () => (dispatch) => (
    APIUtil.fetchSinglePokemon()
     .then(payload => dispatch(receiveSinglePokemon(payload)))
)