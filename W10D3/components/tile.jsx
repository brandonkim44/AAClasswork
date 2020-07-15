import React from "react";

export default class Tile extends React.Component {
    constructor(props) {
      super(props);
        this.handleClick = this.handleClick.bind(this);
    }

    handleClick(e) {
        this.props.updateGame(this.props.tile, e.altKey);
    }

    render () {

        let tileDisplay, classname;
        const tile = this.props.tile;
        const adjacentBombs = tile.adjacentBombCount();
        const flagged = tile.flagged;
        const explored = tile.explored;
        const bombed = tile.bombed;

        if (explored) {
            if(bombed) {
                classname = 'bombed';
                tileDisplay = "\uD83D\uDCA3";
            } else if (adjacentBombs > 0) {
                classname = 'explored-bombs';
                tileDisplay = `${adjacentBombs}`;
            } else {
                classname = 'explored-no-bombs';
                tileDisplay = "";
            }
        } else if (flagged) {
            classname = 'flagged';
            tileDisplay = "\u2691"
        } else {
            classname = 'unclicked';
        }
        classname = `tile ${classname}`
        
        return (
            <div>
                <div onClick={this.handleClick} className={classname}>{tileDisplay}</div>      
            </div>
        )
    }
}