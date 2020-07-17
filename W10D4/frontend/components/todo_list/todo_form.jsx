import React from 'react';
import { uniqueId } from './../../util/util';
export default class TodoForm extends React.Component {
    constructor(props) {
        super(props)
        this.state = { title: "", body: "", done: false };
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    update(fields) {
       return (e) => {
           this.setState({[fields]:e.target.value });
       }
    }

    handleSubmit(e) {
        e.preventDefault();
        const newTodo = {
            id: uniqueId(),
            title: this.state.title,
            body: this.state.body,
            done: false
        }
        this.props.receiveTodo(newTodo);
        this.setState({title: "" });
        this.setState({body: "" });
    }

    render () {
        return (
            <>
                <h1>Create a new Todo</h1>
                    <form onSubmit={this.handleSubmit}>
                        <label>
                            Title:
                            <input type="text"
                                value = {this.state.title}
                                onChange={this.update('title')}
                            />
                        </label>

                        <label>
                            Body:
                                <textarea
                                    value={this.state.body}
                                    onChange={this.update('body')}>
                                </textarea>
                        </label>
                    
                        <button>Submit</button>
                    </form>
            </>
        )
    }
}