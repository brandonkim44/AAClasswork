export const selectAllPokemon = (state) => {
    // debugger;
    const pokemon = Object.values(state.entities.pokemon);
    return pokemon;
}

