import { RECEIVE_CURRENT_USER } from '../actions/session_actions';

export const usersReducer = (state = {}, action) => {
    Object.freeze(state)
    switch(action.type) {
        case RECEIVE_CURRENT_USER:
            const { user } = action;
            return Object.assign({}, state, user );
        default:
            return state;
    }
};