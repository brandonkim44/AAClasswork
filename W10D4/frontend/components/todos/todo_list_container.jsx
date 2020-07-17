import todoList from './todo_list';
import { connect } from 'react-redux';
import {receiveTodo} from '../../actions/todo_actions';
import { allTodos } from './../../reducers/selectors';

const mapStateToProps = (state) => {
    return {
        todos: allTodos(state)}
    ;
};

const mapDispatchToProps = (dispatch) => {
    return {
        //receiveTodo is a property that can be invoked inside presentational component
        receiveTodo: todo => dispatch(receiveTodo(todo))
        // currying on top line
    }
};

export default connect(mapStateToProps, mapDispatchToProps)(todoList);