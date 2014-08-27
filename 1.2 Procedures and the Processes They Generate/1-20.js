// Exercise 1.20
// The process that a procedure generates is of course dependent on the rules used by the interpreter. As an example, consider the iterative gcd procedure given above. Suppose we were to interpret this procedure using normal-order evaluation, as discussed in 1.1.5. (The normal-order-evaluation rule for if is described in Exercise 1.5.) Using the substitution method (for normal order), illustrate the process generated in evaluating (gcd 206 40) and indicate the remainder operations that are actually performed. How many remainder operations are actually performed in the normal-order evaluation of (gcd 206 40)? In the applicative-order evaluation?


function gcd (a, b) {
    if (b === 0) {
        return a;
    } else {
        return gcd(b, a % b)
    }
}


// APPLICATIVE ORDER
// The process generated using the applicative-order evaluation is the following. It performs 4 remainder operations.

gcd(206, 40)

gcd(40, 206 % 40))

gcd(40, 6)

gcd(6, 40 % 6))

gcd(6, 4)

gcd(4, 6 % 4))

gcd(4, 2)

gcd(2, 4 % 2))

gcd(2, 0)

2