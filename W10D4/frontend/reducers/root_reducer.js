import { combineReducers } from "redux";
import todosReducer from "./todos_reducer";

export default combineReducers({
    todos: todosReducer
    
});
// we have action creators, that create action objects
// we pass those action objects to our reducer, and based on the action, the reducer will return a new state of the slice
// the combineReducers combines all of the reducers and lists out each slice