import React from 'react';
import { connect } from 'react-redux';
import { Redirect, Route, withRouter } from 'react-router-dom';

const mapStateToProps = state => {
    return {loggedIn: Boolean(state.session.currentUser)};
};

//we want to make Auth route and redirect them if they're logged in already
//loggedIn: comes from mapStateToProps above
//path: <AuthRoute path="/xx" component={} /> this is passed down from auth component
//component: we want it to be capitalized to render, reassignment
//  {...props} passes down all props
//Auth component is functional component below
const Auth = ({component: Component, loggedIn, path}) => {
    return (
    <Route
        path={path}
        render={props => {
            return loggedIn ? <Redirect to="/" /> : <Component {...props} />
        }}
    />
    )
};

const Protected = ({ component: Component, loggedIn, path }) => {
    return (
        <Route
            path={path}
            render={props => {
                return loggedIn ? <Component {...props} /> : <Redirect to="/signup" />
            }}
        />
    )
};

//AuthRoute is now the container component
export const AuthRoute = withRouter(connect(mapStateToProps)(Auth));
export const ProtectedRoute = withRouter(connect(mapStateToProps)(Protected));