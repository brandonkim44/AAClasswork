import { sessionErrorsReducer } from './session_errors_reducer';
import { combineReducers } from 'redux';

const errorsReducer = combineReducers({
    errors: sessionErrorsReducer
});

export default errorsReducer;
