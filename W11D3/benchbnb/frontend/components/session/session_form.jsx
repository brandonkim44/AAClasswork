import React from 'react';
import { Link } from 'react-router-dom';

//this is a controlled component, which means its state is governed by itself
export class SessionForm extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            username: "",
            password: ""
        };
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    handleInput(type) {
        return e => {
            this.setState({ [type]: e.target.value }); 
        }
    }

    handleSubmit(e) {
        e.preventDefault();
        this.props.processForm(this.state).then( () => this.props.history.push('/'));
    }

    render() {

        const header = this.props.formType === "login" ? (
            <div>
                <h2>Welcome to Bench BnB</h2>
                <h3>Please login or </h3>
                <Link to="/signup">sign up instead</Link>
            </div>
        ) : (
                <div>
                    <h2>Welcome to Bench BnB</h2>
                    <h3>Please sign or </h3>
                    <Link to="/login">login instead</Link>
                </div>
            );

        const button = this.props.formType === "login" ? (
            <submit onClick={this.handleSubmit}>Login</submit>
        ) : (
            <submit onClick={this.handleSubmit}>Sign Up</submit>
        );

        let errorMessage;
        if (this.props.errors.length > 0) {
            const errorMessage = <div>{this.props.errors.split(" ").join(" ")}</div>
        }

        return (
            <div>
                {header}
                <form action="">
                    <label>Username: 
                        <input type="text" 
                            value={this.state.username} 
                            onChange={this.handleInput('username')}>
                        </input>
                    </label>

                    <label>Password:
                        <input type="password"
                            value={this.state.password}
                            onChange={this.handleInput('password')}>
                        </input>
                    </label>
                    {button}
                    {errorMessage}
                </form>

            </div>
        )
    }
};