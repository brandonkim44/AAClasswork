import { createStore } from 'redux';
import rootReducer from './../reducers/root_reducer';

// export const configureStore = () => {
//     return createStore(rootReducer);
// };  

export const configureStore = () => {
    return createStore(rootReducer, {
        todos: {
            1: { id: 1, title: "Milk", body: "I don't know", done: false },
            2: { id: 2, title: "Soda", body: "I do know", done: false }
        }
    });
};  