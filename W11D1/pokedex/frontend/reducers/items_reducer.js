import { RECEIVE_SINGLE_POKEMON } from '../actions/pokemon_actions';



export const itemsReducer = (state = {}, action) => {
    //items come from pojo action creator, has both items and pokemon from payload
    Object.freeze(state);
    
    switch (action.type) {
        case RECEIVE_SINGLE_POKEMON:
            debugger;
            const items = {};
            const itemIds = action.pokemon.item_ids;
            itemIds.forEach ((itemId) => {
                items[itemId] = action.items.itemId;
                //why does items[itemId] = action.items.itemId not work??!
            });
            return items;
        default:
            return state;
    }

}