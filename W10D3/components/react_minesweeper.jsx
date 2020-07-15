import React from 'react';
import ReactDOM from 'react-dom';
import Game from "./game.jsx";

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  ReactDOM.render(<Game/>, root);
});