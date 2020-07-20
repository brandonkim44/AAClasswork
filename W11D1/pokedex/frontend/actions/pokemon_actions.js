import {APIUtil} from '../util/api_util';


export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';



export const receiveAllPokemon = (pokemon) => {
    return (
        {
            type: RECEIVE_ALL_POKEMON,
            pokemon: pokemon //this value of pokemon is the JSON object that was created by jbuilder
        }
    )
};

export const requestAllPokemon = () => (dispatch) => (
  APIUtil.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
)