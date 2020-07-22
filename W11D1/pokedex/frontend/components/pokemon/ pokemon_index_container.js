import React from 'react';
import {connect} from 'react-redux';
import { selectAllPokemon } from '../../reducers/selectors';
import { requestAllPokemon } from '../../actions/pokemon_actions';
import { PokemonIndex } from './pokemon_index';

const mapStateToProps = state => {
  // piece of state that container subscribes to
    const allPokemon = selectAllPokemon(state);
    return { pokemon: allPokemon };
};



const mapDispatchToProps = dispatch => ({
  requestAllPokemon: () => dispatch(requestAllPokemon())
});

export default connect(mapStateToProps, mapDispatchToProps)(PokemonIndex);