export const allTodos = (state) => {
    const todoIds = Object.keys(state.todos);
    // [1, 2, 3, 4, 5];
    return todoIds.map( id => {
        return state.todos[id];
    });
    // [{todo1}, {todo2}];
};