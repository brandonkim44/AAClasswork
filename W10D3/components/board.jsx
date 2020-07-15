import React from "react";
import Tile from './tile';

export default class Board extends React.Component {
    constructor(props) {
        super(props);

    }


    render() {

        // const grid = this.props.board.grid;
        //tile = instances of tile class
        const tiles = this.props.board.grid.map( (row, idx) => {
            return (
                <div className="row" key={idx}>
                    {row.map((tile, idx2) => (<Tile tile={tile} key={idx2} updateGame={this.props.updateGame}/>))}
                </div>
            )
        });
        return (
            <div className="board">
                <br />
                {tiles}
            </div>
        )
    }
}