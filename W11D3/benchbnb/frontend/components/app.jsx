import React from 'react';
import GreetingContainer from './greeting/greeting_container';
import { Route } from 'react-router-dom';
import LoginContainer from './session/login_form_container';
import SignUpContainer from './session/signup_form_container';

export const App = () => {
    return (
    <div>
        <header>
            <h1>BenchBnB</h1>
            <GreetingContainer />
        </header>

        <Route path="/login" component={LoginContainer}/>
        <Route path="/signup" component={SignUpContainer}/>

    </div>
    )
};