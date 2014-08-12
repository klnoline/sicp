// Exercise 1.10
// The following procedure computes a mathematical function called Ackermann's function.


function A (x, y) {
    if (y == 0) {
        return 0;
    } else if (x == 0) {
        return y * 2;
    } else if (y == 1) {
        return 2;
    } else {
        return A(x-1, A(x, y-1));
    };
}

// What are the values of the following expressions?

console.log(A(1, 10));
// 1024

console.log(A(2, 4));
// 65536

console.log(A(3, 3));
// 65536


// Consider the following procedures, where `ackermann` is the procedure defined above:

function f (n) { return A(0, n); }
// 2n

function f (n) { return A(1, n); }
// 2^n

function f (n) { return A(2, n); }
// 2^2^2^2... n times

function k (n) { return 5 * n * n; }
// 5(n^2)

// Give concise mathematical definitions for the functions computed by the procedures f, g, and h for positive integer values of n. For example, (k n) computes 5(n^2).