import { SessionForm } from './session_form';
import { connect } from 'react-redux';

const mapStateToProps = (state, ownProps) => {
    return (
        { 
            errors: state.errors,
            formType: 'login'
        }
    );
};

const mapDispatchToProps = (dispatch, ownProps) => {
    return (
        {
            processForm: (user) => dispatch(login(user))
        }
    );
};

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm);