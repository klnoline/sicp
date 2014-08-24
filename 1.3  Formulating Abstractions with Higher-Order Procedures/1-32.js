// Exercise 1.32:
// a. Show that sum and product (Exercise 1.31) are both special cases of a still more general notion called accumulate that combines a collection of terms, using some general accumulation function:
// (accumulate combiner null-value term a next b)
// Accumulate takes as arguments the same term and range specifications as sum and product, together with a combiner procedure (of two arguments) that specifies how the current term is to be combined with the accumulation of the preceding terms and a null-value that specifies what base value to use when the terms run out. Write accumulate and show how sum and product can both be defined as simple calls to accumulate.
// b. If your accumulate procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process.


function identity (x) { return x };
function succ (x) { return x + 1; };


// iterative version
function accumulate (combiner, nullValue, term, a, next, b) {
    if (a > b) {
        return nullValue;
    } else {
        return accumulate(combiner, combiner(term(a), nullValue), term, next(a), next, b);
    };
}

function sum (term, a, next, b) {
    function plus (x, y) { return x + y; }
    return accumulate(plus, 0, term, a, next, b);
}

function product (term, a, next, b) {
    function mult (x, y) { return x * y; }
    return accumulate(mult, 1, term, a, next, b);
}

function sumIntegers (a, b) { return sum(identity, a, succ, b); };
function factorial (n) { return product(identity, 1, succ, n); };

console.log(sumIntegers(1, 10));  // 55
console.log(factorial(5));        // 120



// recursive version
function accumulateRec (combiner, nullValue, term, a, next, b) {
    if (a > b) {
        return nullValue;
    } else {
        return combiner(term(a), accumulateRec(combiner, nullValue, term, next(a), next, b));
    };
}

function sumRec (term, a, next, b) {
    function plus (x, y) { return x + y; }
    return accumulateRec(plus, 0, term, a, next, b);
}

function productRec (term, a, next, b) {
    function mult (x, y) { return x * y; }
    return accumulateRec(mult, 1, term, a, next, b);
}

function sumIntegersRec (a, b) { return sumRec(identity, a, succ, b); };
function factorialRec (n) { return productRec(identity, 1, succ, n); };

console.log(sumIntegersRec(1, 10));  // 55
console.log(factorialRec(5));        // 120