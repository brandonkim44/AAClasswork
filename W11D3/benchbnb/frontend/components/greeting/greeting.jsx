import React from 'react';
import { Link } from 'react-router-dom';

const Greeting = ({ currentUser, logout }) => {
    const display = currentUser ? (
        <div>
            <h1>Welcome, {currentUser.username}</h1>
            <button onClick={logout}>Log out</button>
        </div>
     ) : (
        <div>
            <Link to="/signup">Sign up!</Link>
            <span> or </span>
            <Link to="/login">Log in</Link>
        </div>
     )

    return (
        <div>
            {display}
        </div>
    )
};

export default Greeting;