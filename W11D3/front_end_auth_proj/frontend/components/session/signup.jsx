import React from 'react';
import { Redirect } from 'react-router-dom';

export class Signup extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            username: '',
            email: '',
            password: ''
        };
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    handleInput(type) {
        return (e) => {
            //type would be either username, email, or password, and we put it in brackets so it will be evaluated before it's assigned to the key
            //syntactic sugar and ES6 syntax to basically doing const type = type and then { type: e.target.value }
            this.setState( { [type]: e.target.value} );
        }
    }

    handleSubmit(e) {
        //once user submits form
        e.preventDefault();
        this.props.createNewUser(this.state)
            .then(() => this.props.history.push('/chirps'));
            //by pushing this route, we are adding it to the history stack and redirecting user
        //this.state will hold the javascript object with username, email, password (Everything we need to create a new user)
    }  

    render() {
        return (
            <div className="session-form">
                <h2>Sign up!</h2>
                <form action="">
                    <label>Username:
                        <input 
                            type="text"
                            //the value relies on the state
                            value={this.state.username}
                            onChange={this.handleInput('username')}
                        />
                    </label>

                    <label>Email:
                        <input
                            type="text"
                            //the value relies on the state
                            value={this.state.email}
                            onChange={this.handleInput('email')}
                        />
                    </label>

                    <label>Password:
                        <input
                            type="password"
                            //the value relies on the state
                            value={this.state.password}
                            onChange={this.handleInput('password')}
                        />
                    </label>
                    <button onClick={this.handleSubmit}>Sign Up</button>
                </form>
            </div>
        )
    }
};