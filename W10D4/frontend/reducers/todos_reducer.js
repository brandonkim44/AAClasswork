import { RECEIVE_TODOS, RECEIVE_TODO } from "./../actions/todo_actions";
import { merge } from 'lodash';

const todosReducer = (state = {}, action) => { //action is POJO with type: "SOME_ACTION" 
//state is NOT REDUX state, it is the slice todos: {todo1, todo2, todo3};
    Object.freeze(state);
    switch (action.type) {
        case RECEIVE_TODOS: 
            const { todos } = action;
            const newTodos = {};
        
            todos.forEach( (todo) => { 
                newTodos[todo.id] = todo;
            });
            return newTodos;
        case RECEIVE_TODO:
            const newTodo = {};
            const { todo } = action;
            newTodo[todo.id] = todo;
            const newState = merge({}, state, newTodo);
            return newState;
        //what are we returning? => object where key points to each todo (which is a obj/hash)
        default: 
            return state; 
    }
}

export default todosReducer; 