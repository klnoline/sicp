// Exercise 1.3
// Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

// Auxiliary function
var sumOfSquares = function (a, b) {
    return a*a + b*b;
};


// First solution
var sumOfSquaresOfBiggestNumbers = function (x, y, z) {
    var max = Math.max,
        min = Math.min;

    return sumOfSquares(max(x, y), max(min(x, y), z));
};

console.log(sumOfSquaresOfBiggestNumbers(1, 2, 3));


// Second solution
var sumOfSquaresOfBiggestNumbers2 = function (x, y, z) {
    var biggestNumbers = [].slice.call(arguments).sort();

    return sumOfSquares(biggestNumbers[1], biggestNumbers[2]);
};

console.log(sumOfSquaresOfBiggestNumbers2(1, 2, 3));


// Third solution
var sumOfSquaresOfBiggestNumbers3 = function (x, y, z) {
    return [].slice.call(arguments)
        .sort().slice(1)
        .reduce(function (a, b) {
            return a*a + b*b;
        });
};

console.log(sumOfSquaresOfBiggestNumbers3(1, 2, 3));