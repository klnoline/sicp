// Exercise 1.6
// Alyssa P. Hacker doesn’t see why if needs to be provided as a special form. “Why can’t I just define it as an ordinary procedure in terms of cond?” she asks. Alyssa’s friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if:

function newIf (predicate, thenClause, elseClause) {
    if (predicate) {
        return thenClause;
    } else {
        return elseClause;
    }
}

// Eva demonstrates the program for Alyssa:
newIf(2 == 3, 0, 5)
// 5
newIf(1 == 1, 0, 5)
// 0

// Delighted, Alyssa uses new-if to rewrite the square-root program:

function sqrtIter (guess, x) {
    return newIf(
        goodEnough(guess, x),
        guess,
        sqrtIter(improve(guess, x), x)
    );
}

// What happens when Alyssa attempts to use this to compute square roots? Explain.

function square (x) {
    return x * x;
}

function average (x, y) {
    return (x + y) / 2;
}

function improve (guess, x) {
    return average(guess, x / guess);
}

function goodEnough (guess, x) {
    return Math.abs(square(guess) - x) < 0.001
}

function sqrt (x) {
    return sqrtIter(1.0, x);
}

console.log(sqrt(9));


// Answer:
// Applicative process causes stack overflow