function range(start, end){
    if (start === end) {
        return [];
    }

    let result = range(start, end-1);
    result.push(end-1);
    return result;
    // return (range(start, end-1) + [end]);
}


// range(2, 6)
// range(2,5) + [5]
// []+[3]
// [3]

// console.log(range(2, 6));
// console.log(range(2, 2));

// def range(start, end)
//     return [] if start == end
//     range(start, end-1) + [end]
// end 

// function bracket() {
//     return [];
// }

// console.log(bracket());

function sumRec(array) {
    if (array.length <= 1 ) { return array[0]; }
   let first = array[0];
   array.shift();
   return first + sumRec(array);
};

// console.log(sumRec([1,2,3,4]));

function exponent1(base, exp) {
    if (exp === 0) { return 1; }
    return base * exponent(base, exp-1);
};

// console.log(exponent1(2, 4));

function exponent2(base, exp) {
    if (exp === 0) { return 1; }
    if (exp % 2 === 0) {
        let subAnswer = exponent2(base, exp / 2); //how does this work if JS doesn't truncate?
        return subAnswer * subAnswer;
    } else {
        let subAnswer = exponent2(base, (exp - 1 ) / 2);
        return subAnswer * subAnswer * base;
    }
};

// console.log(exponent2(2, 5));

function fibonacciRec(n) {
    if (n < 3) {
        return [0, 1].slice(0, n);
    }
    let fibs = fibonacciRec(n - 1);
    fibs.push(fibs[fibs.length - 1] + fibs[fibs.length - 2]);
    return fibs;
};

// console.log(fibonacciRec(10));

function deepDup(arr) {
    if ( !(arr instanceof Array) ) {
        return arr;
    }
    return arr.map((el) => {
        return deepDup(el);
    });
};

// const array = [[2], 3];
// const dupedArray = deepDup(array);
// console.log(`deepDup original = ${JSON.stringify(array)}`);

// dupedArray[0].push(4);

// console.log(`deepDup original = ${JSON.stringify(array)} (should not be mutated)`);
// console.log(`deepDup duped = ${JSON.stringify(dupedArray)} (should be mutated)`);

