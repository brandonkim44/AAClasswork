import React from "react";
import * as Minesweeper from '../minesweeper';
import Board from './board';

export default class Game extends React.Component {
  constructor(props) {
    super(props);
    this.state = { board: new Minesweeper.Board(2, 1) };
    this.updateGame = this.updateGame.bind(this);
    this.restartGame = this.restartGame.bind(this);
  }

  updateGame (tile, isFlagged) {
    if (isFlagged) {
      tile.toggleFlag();
    } else {
      tile.explore();
    }
    this.setState({board: this.state.board});
  }

  restartGame (e) {
    e.preventDefault();
    const newBoard = new Minesweeper.Board(2, 1);
    this.setState( {board: newBoard});
  }

  render() {
      
      const message = () => {
          if (this.state.board.won() || this.state.board.lost()) {
          let endText = this.state.board.won() ? "You won!" : "You lost!";
          return (
            <div className="modal-screen">
              <div className="modal-content">{endText}</div>
                <button onClick={this.restartGame}>Play Again</button>
            </div>
            )
          }
      }
        return (
          <div>
            <h1>Minesweeper</h1>
            <Board board={this.state.board} updateGame={this.updateGame}/>
            {message()}
          </div>
        );
      }
}