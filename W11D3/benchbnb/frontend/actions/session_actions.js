import * as APIUtil from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER';
export const RECEIVE_ERRORS = 'RECEIVE_ERRORS';

//action creator
export const receiveCurrentUser = (user) => {
    return (
        {
            type: RECEIVE_CURRENT_USER,
            user
        }
    )
};


export const logoutCurrentUser = () => {
    return (
        {
            type: LOGOUT_CURRENT_USER
        }
    )
};

export const receiveErrors = (errors) => {
    return (
        {
            type: RECEIVE_ERRORS,
            errors
        }
    )
};

//thunk action creators

export const login = formUser => dispatch => {
    APIUtil.login(formUser)
        .then(user => dispatch(receiveCurrentUser(user)))
};

export const logout = () => dispatch => {
    APIUtil.logout()
        .then(user => dispatch(logoutCurrentUser(user)))
};

export const signup =  formUser => dispatch => {
    APIUtil.signup(formUser)
        .then(user => dispatch(receiveCurrentUser(user)))
};

