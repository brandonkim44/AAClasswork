function sum() {
    let acc = 0;
    for(let i = 0; i < arguments.length; i++) {
        acc += arguments[i];
    }
    return acc;
};



function sumRest(...args) {
    let acc = 0;
    for (let num of args) {
        acc += num;
    }
    return acc;
};


// console.log(sumRest(1, 2, 3));


Function.prototype.myBind = function (ctx, ...args) { // bind time args 
    let that = this;
    return function (...other_args) { // call time args 
        return that.apply(ctx, args.concat(other_args))
    };
};

Function.prototype.myBind = function (ctx) { // bind time args 
    let that = this;
    let args = Array.prototype.slice.call(arguments); //Array.from
    args = args.slice(1, args.length)
    return function () { // call time args 
    let args2 = Array.prototype.slice.call(arguments);
        return that.apply(ctx, args.concat(args2));
    };
};




class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

class Dog {
  constructor(name) {
    this.name = name;
  }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true

// // bind time args are "meow" and "Kush", no call time args
// markov.says.bind(pavlov, "meow", "Kush")();
// // Pavlov says meow to Kush!
// // true

// // no bind time args (other than context), call time args are "meow" and "a tree"
// markov.says.myBind(pavlov)("meow", "a tree");
// // Pavlov says meow to a tree!
// // true

// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(pavlov, "meow")("Markov");
// // Pavlov says meow to Markov!
// // true

// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// // Pavlov says meow to me!
// // true




function sumNumbers (numArgs) {
    const numbers = [];
    let acc = 0;
    return function _curriedSum(num) {
        numbers.push(num); 
        if (numbers.length === numArgs) {
            return numbers.reduce((acc, cv) => {
                return acc + cv; //return required for multi-lined callback
            });
        } else {
            return _curriedSum;
        }
    };
};



Function.prototype.curry = function(numArgs) {
    let that = this;
    const numbers = [];
    return function currySum(arg) {
        numbers.push(arg);
        if (numbers.length === numArgs ) { 
            return that.apply(null, numbers); //null is replaced by global context
        } else {
            return currySum;
        }
    };
};

Function.prototype.curry = function (numArgs) {
    let that = this;
    const numbers = [];
    return function _curried(arg) {
        numbers.push(arg);
        if (numbers.length === numArgs) {
            return that(...numbers);
        } else {
            return _curried;
        }
    };
};


// function curried () {
//     return numbers;
// };

// const curryFunc = curried;




console.log(sum.curry(2)(30)(20)); // => 50


Function.prototype.curry = function(numArgs) {
    let that = this; 
    const numbers = [];
    return function currySum(arg) {
        numbers.push(arg);
        if (numbers.length === numArgs ) { 
            return that(numbers);
        } else {
            return currySum;
        }
    };
};

