const Game = require('../tic_tac_toe_game_logic/game.js');
class View {  
  constructor(game, $el) {
    this.game = game;
    this.el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    $('li').on('click', e => {
      const $li = $(e.target);
      this.makeMove($li);
      
    });
  }

  makeMove($square) {
    // debugger;
    const $liAll = $('li');
    const numli = $liAll.index($square);
    $square.addClass(this.game.currentPlayer);
    //debugger;
    const pos = [numli % 3, Math.floor(numli / 3)];
    this.game.playMove(pos);
    const $text = $('<span>');
    $text.addClass('marker');
    $text.text(this.game.currentPlayer);
    $square.append($text);
    $square.css({'background-color':'white'});
    if(this.game.isOver()){
      debugger;
      let winner = this.game.winner();
      if (winner === null) {
        let $markerAll = $(".marker");
        $markerAll.each((i, el) => {
          let $element = $('el');
          $element.css({ 'color':'red' });
        })
      } else {
        $liAll.each((i, el) => {
          debugger;
          let $elobj = $('el');
          if ($elobj.hasClass(winner)) {
            $elobj.css({ 'background-color': 'green' });
            $elobj.find(".marker").css({ 'color':'white' });
          } else if(!$elobj.find(".marker")) {
            $elobj.find(".marker").css({ 'color':'red' });
          }
        })
      }
    }
    // debugger;
  }

  setupBoard() {
    const $ul = $('<ul>');
    $ul.addClass('grid');
    this.el.append($ul);
    for(let i = 0; i < 9; i++){
      const $li = $('<li>');
      $ul.append($li);
    }
  }
}

module.exports = View;
