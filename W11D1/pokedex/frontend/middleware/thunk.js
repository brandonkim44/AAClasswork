

const thunkMiddleWare = store => next => action => {
    if (typeof action === 'function') {
        return action(dispatch);
    }
    return next(action);
}

export default thunkMiddleWare;