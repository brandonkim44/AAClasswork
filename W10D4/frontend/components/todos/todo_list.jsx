import React from 'react';
import TodoListItem from '../todo_list/todo_list_item';
import TodoForm from "./../todo_list/todo_form"


export default class TodoList extends React.Component {
    constructor(props) {
        super(props)
    }

    render() {
        const todosLi = this.props.todos.map((todo, idx) => { 
            return <TodoListItem todo={todo} key={idx}/>
        });

      return (  
        <div>
            <ul>{todosLi}</ul>
            <TodoForm receiveTodo={ this.props.receiveTodo} />
        </div>
      )}
}       