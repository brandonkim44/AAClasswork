import { connect } from 'react-redux';
import { logout } from '../../actions/session_actions';
import Greeting from './greeting';

const mapStateToProps = state => {
    //passing current user from state to props by using the session to key into entities slice of state to find user with matching id
    const { entities, session } = state;
    const currentUserId = session.id;
    return (
        { currentUser: entities.users[currentUserId] }
    );
};

const mapDispatchToProps = dispatch => {
    return (
        { logout: () => dispatch(logout())}
    );
};

export default connect(mapStateToProps, mapDispatchToProps)(Greeting);