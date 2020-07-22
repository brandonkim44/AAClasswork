import React from 'react';
import {PokemonIndexItem} from './pokemon_index_item';

export class PokemonIndex extends React.Component {
    constructor(props) {
        super(props)
    }

    componentDidMount () {
        this.props.requestAllPokemon();
    }

    render () {
        let pokemonItems = this.props.pokemon.map((poke) => {
            // debugger;
            return <PokemonIndexItem key={poke.id} pokemon={poke} />
        });

        return (
            <section className="pokedex">
                <ul>{pokemonItems}</ul>
            </section>
        )
    }
};