import React from 'react';
import ReactDOM from 'react-dom';
import { Content } from "./../frontend/components/content_container";
import { configureStore } from "./../frontend/store/store";
import todosReducer from "./reducers/todos_reducer";
import { receiveTodo, receiveTodos } from "./actions/todo_actions";
import { App } from "./../frontend/components/app";
import Root from "./../frontend/components/root";

document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("root");
    const store = configureStore();
    window.store = store;
    window.receiveTodo = receiveTodo;
    window.receiveTodos = receiveTodos;
    window.todosReducer = todosReducer;
    ReactDOM.render(<Root />, root);
});