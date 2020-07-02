// class Clock {
//     constructor() {
        
//         this.time = new Date();

//         this.hours = this.time.getHours();
//         this.minutes = this.time.getMinutes();
//         this.seconds = this.time.getSeconds();
        
//         this._tick();
        
//     }

//     printTime() {
//         console.log(`${this.hours}:${this.minutes}:${this.seconds}`);
//         this.seconds += 1;
//         if (this.seconds === 60) {
//             this.seconds = 0;
//             this.minutes += 1;
//             if (this.minutes === 60) {
//                 this.minutes = 0;
//                 this.hours += 1;
//                 if (this.hours === 24) {
//                     this.hours = 0;
//                 }
//             }
//         }
//         // return console.log("hello this is a test");
//     }

//     _tick() {
//         setInterval(this.printTime.bind(this), 1000);
//     }
// }

// const clock = new Clock();


// addNumbers

const readline = require('readline');

const reader = readline.createInterface({ //ask about why this can be on the outside
    input: process.stdin,
    output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
    // let totalSum = 0;
    if (numsLeft > 0) {
        reader.question("Enter a number", function(input1) {
            const num1 = parseInt(input1);
            sum += num1;
            console.log(`${sum}`);
            addNumbers(sum, numsLeft - 1, completionCallback);
        })
    } else {
        completionCallback(sum);
    }
}
// let sum = 0;

function outputResultAndCloserReader(sum) { //must pass in "sum" (arg) to give access to sum to the inner scope of callback function
    console.log(`Your total sum is ${sum}`);
    reader.close();
}

// addNumbers(0, 3, outputResultAndCloserReader);

// addNumbers(0, 3, (sum) => console.log(`Total Sum: ${sum}`));

function absurdBubbleSort(arr, sortCompletionCallback) {

}

function askIfGreaterThan(el1, el2, callback) {

    reader.question(`Is ${el1} > ${el2}?`, function(input) {
        const answer = input;
        if (answer === "yes") {
            callback(true);
        } else if (answer === "no") {
            callback(false);
        } else {
            throw "Error";
            reader.closer();
        }
    })
}

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
    if (i < arr.length - 1) {
        askIfGreaterThan(arr[i], arr[i+1], swap);
    }
    if (i === arr.length - 1) {
        outerBubbleSortLoop(madeAnySwaps);
    }
};

function swap(isGreaterThan){
    let madeAnySwaps = false;
    if (isGreaterThan) {
        [arr[i], arr[i+1]] = [arr[i+1], arr[i]];
        madeAnySwaps = true;
    }
    innerBubbleSortLoop(arr, i+1, madeAnySwaps, outerBubbleSortLoop);
};

innerBubbleSortLoop([4, 3, 2, 1], 0, false, console.log("In outer bubble sort loop"));

// askIfGreaterThan(2, 3, (arg) => console.log(arg));