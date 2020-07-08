const Asteroid = require("./asteroids.js");

Game.DIM_X = window.innerWidth;
Game.DIM_Y = window.innerHeight;
Game.NUM_ASTEROIDS = 100;

const asteroids = [];

function Game() {
    this.dimX = Game.DIM_X;
    this.dimY = Game.DIM_Y;
    this.addAsteroids(); // must be "this" to refer to the instance of game we initialized
}


Game.prototype.addAsteroids = function () {
    for (let i = 0; i < Game.NUM_ASTEROIDS; i++){
        asteroids.push(new Asteroid(this.randomPosition())); // on instance of game again
    }
}

Game.prototype.randomPosition = function () {
    const randomX = Math.random() * Game.DIM_X;
    const randomY = Math.random() * Game.DIM_Y;
    return {pos: [randomX, randomY]}; //returns a hash correctly
}

Game.prototype.draw = function (ctx) {
    ctx.clearRect(0, 0, this.dimX, this.dimY);
    ctx.fillStyle = "#000000"; //changed background color to black
    ctx.fillRect(0, 0, this.dimX, this.dimY); 
    asteroids.forEach(function (asteroid) {
        asteroid.draw(ctx);
    });
}

Game.prototype.moveObjects = function (ctx) {
    asteroids.forEach(function(asteroid) {
        asteroid.move(ctx);
    });
}

Game.prototype.wrap = function wrap(pos) {
    return [
        Util.wrap(pos[0], Game.DIM_X), Util.wrap(pos[1], Game.DIM_Y)
    ];
};

module.exports = Game;