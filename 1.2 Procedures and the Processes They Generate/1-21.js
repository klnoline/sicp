// Exercise 1.21
// Use the smallest-divisor procedure to find the smallest divisor of each of the following numbers: 199, 1999, 19999.


function smallestDivisor (x) {
    function square (x) { return x*x; }
    function findDivisor (n, testDivisor) {
        if (square(testDivisor) > n) {
            return n;
        } else if (n % testDivisor === 0) {
            return testDivisor;
        } else {
            return findDivisor(n, testDivisor + 1);
        };
    }

    return findDivisor(x, 2);
}

// Test
[199, 1999, 19999].forEach(function (number) {
    console.log(smallestDivisor(number));
});