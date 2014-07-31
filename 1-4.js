// Exercise 1.4
// Observe that our model of evaluation allows for combinations whose operators are compound expressions. Use this observation to describe the behavior of the following procedure

// If second operand is negative then make it positive
var aPlusAbsB = function (a, b) {
    var sum = function (a, b) { return a + b; },
        sub = function (a, b) { return a - b; };

    return (b > 0 ? sum : sub)(a, b);
}

// The same result in both cases
console.log(aPlusAbsB(2, 2) === aPlusAbsB(2, -2));