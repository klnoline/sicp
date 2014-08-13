// Exercise 1.18
// Using the results of Exercise 1.16 and Exercise 1.17, devise a procedure that generates an iterative process for multiplying two integers in terms of adding, doubling, and halving and uses a logarithmic number of steps.

function mult (a, b) {
    function double (x) { return x + x; }
    function halve  (x) { return x / 2; }

    return (function iter (acc, a, b) {
        if (b == 0) {
            return acc;
        } else if (b % 2 == 0) {
            return iter(acc, double(a), halve(b));
        } else {
            return iter(acc+a, a, b-1);
        };
    })(0, a, b);
}

console.log(mult(10, 10));