const DOMNodeCollection = require("./dom_node_collection.js");

function $l(arg) {     
    
    if (typeof arg === "string") { //selector style for htmlelement //string literal is not an object
        console.log("hello!")
        const nodeList = document.querySelectorAll(arg);
        const nodeListArray = Array.from(nodeList);
        return new DOMNodeCollection(nodeListArray);
    } else if (arg instanceof HTMLElement) {
        
    }
};

window.$l = $l;
window.domnodecollection = DOMNodeCollection;

//1st arg = ".li" 
//2nd arg = "<li>" //or if it doesn't exist on page
//const variablename = document.getElementByID("somename")
// $l(variablename)