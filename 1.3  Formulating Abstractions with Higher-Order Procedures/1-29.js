// Exercise 1.29
// Simpson’s Rule is a more accurate method of numerical integration than the method illustrated above. Using Simpson’s Rule, the integral of a function f between a and b is approximated as
// h3(y0+4y1+2y2+4y3+2y4+...+2yn−2+4yn−1+yn),
// where h=(b−a)/n, for some even integer n, and yk=f(a+kh). (Increasing n increases the accuracy of the approximation.) Define a procedure that takes as arguments f, a, b, and n and returns the value of the integral, computed using Simpson’s Rule. Use your procedure to integrate cube between 0 and 1 (with n=100 and n=1000), and compare the results to those of the integral procedure shown above.



function cube (x) {
    return x * x * x;
}

function sum (term, a, next, b) {
    if (a > b) {
        return 0;
    } else {
        return term(a) + sum(term, next(a), next, b);
    };
}

function integral (f, a, b, n) {
    var h = (b - a) / n;
    
    function y (k) { return f(a + k*h); }
    function succ (x) { return x + 1; };
    function term (k) {
        if (k == 0 || k == n) {
            return y(k);
        } else if (k % 2 == 0) {
            return y(k)*4;
        } else if (k % 2 == 1) {
            return y(k)*2;
        };
    }

    return (h / 3) * sum(term, 0, succ, n);
}


// Test
console.log(integral(cube, 0, 1, 100)); // 0.25
console.log(integral(cube, 0, 1, 1000)); // 0.25

console.log(integral(function (x) { return 3 * x * x; }, 1, 3, 100)); // 26
console.log(integral(function (x) { return 3 * x * x; }, 1, 3, 1000)); // 26