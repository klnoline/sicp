// Exercise 1.8
// Newton's method for cube roots is based on the fact that if y is an approximation to the cube root of x, then a better approximation is given by the value:
// (x/y^2 + 2y) / 3

// Use this formula to implement a cube-root procedure analogous to the square-root procedure. (In Section 1.3.4 we will see how to implement Newton's method in general as an abstraction of these square-root and cube-root procedures.)


function cbrt (x) {
    function improve (guess) { return ((x / Math.pow(guess, 2)) + (2*guess)) / 3 }
    function goodEnough (guess, oldGuess) { return Math.abs(oldGuess - guess) < 0.0000000000001 }

    return (function cbrtIter (guess, oldGuess) {
        if (goodEnough(guess, oldGuess)) {
            return guess;
        } else {
            return cbrtIter(improve(guess), guess);
        };
    })(1.0, x);
}

console.log(cbrt(8));
console.log(cbrt(10000000));