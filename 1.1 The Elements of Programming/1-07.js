// Exercise 1.7
// The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers. Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate for very large numbers. Explain these statements, with examples showing how the test fails for small and large numbers. An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?


function oldSqrt (x) {
    function square (x) { return x * x; }
    function average (x, y) { return (x + y) / 2; }
    function improve (guess, x) { return average(guess, x / guess); }
    function goodEnough (guess, x) { return Math.abs(square(guess) - x) < 0.001 }

    return (function sqrtIter (guess, x) {
        if (goodEnough(guess, x)) {
            return guess;
        } else {
            return sqrtIter(improve(guess, x), x);
        };
    })(1.0, x);
}

function newSqrt (x) {
    function average (x, y) { return (x + y) / 2; }
    function improve (guess) { return average(guess, x / guess); }
    function goodEnough (guess, oldGuess) { return Math.abs(oldGuess - guess) < 0.0000000000001 }

    return (function sqrtIter (guess, oldGuess) {
        if (goodEnough(guess, oldGuess)) {
            return guess;
        } else {
            return sqrtIter(improve(guess), guess);
        };
    })(1.0, x);
}

console.log(oldSqrt(9));
console.log(oldSqrt(0.001));
console.log(oldSqrt(1000000000));

console.log(newSqrt(9));
console.log(newSqrt(0.001));
console.log(newSqrt(1000000000));