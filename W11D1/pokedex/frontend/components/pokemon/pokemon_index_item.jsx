import React from 'react';
import { Link } from 'react-router-dom';


export const PokemonIndexItem = (props) => {
    // debugger;
    const poke = props.pokemon;
    return (<li>
                <Link to={`/pokemon/${poke.id}`}>
                    {poke.name}
                    <img width="100" src={poke.image_url}></img>
                </Link>
            </li>
        )
}
//this.props invoke super props from constructor
//key special prop doesn't get sent down as props