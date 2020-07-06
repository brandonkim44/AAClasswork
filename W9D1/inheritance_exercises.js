Function.prototype.inherits = function(parentClass) {
    this.prototype = Object.create(parentClass.prototype);//this === childClass
    this.prototype.constructor = this.constructor;
}

// class parentClass {
//     constructor(name) {
//         this.name = name;
//     }

//     printHello() {
//         console.log(`hello ${this.name}`);
//     }

// }

// class childClass {
//     constructor(name) {
//        this.name = name;
//     }

//     printGoodbye() {
//         console.log(`Goodbye, ${this.name}`);
//     }
// }

function parentClass() {

}
parentClass.prototype.printHello = function() {
    console.log(`Hello!`);
}

const parent = new parentClass();

function childClass() {

}

childClass.prototype.printGoodbye = function() {
    console.log(`Goodbye!`);
}




childClass.inherits(parentClass);

const child = new childClass();






// console.log(child.printHello());
// console.log(parent.printGoodbye());


