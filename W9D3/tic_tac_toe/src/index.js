const View = require("./ttt-view");
const Game = require("../tic_tac_toe_game_logic/game");

  $(() => {
    const game = new Game();
    const view = new View(game,$('.ttt'));
  });
