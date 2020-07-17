import React from 'react';

export default class TodoListItem extends React.Component {
    constructor(props) {
        super(props)
    }

    render () {
        const todoItem = this.props.todo;

        return (
                <li>{todoItem.title}
                    <br />
                    {todoItem.body}
                </li>
        )
    }
}