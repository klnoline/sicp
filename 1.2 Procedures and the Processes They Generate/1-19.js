// Exercise 1.19
// There is a clever algorithm for computing the Fibonacci numbers in a logarithmic number of steps. Recall the transformation of the state variables a and b in the fib-iter process of 1.2.2: a ← a+b and b ← a. Call this transformation T, and observe that applying T over and over again n times, starting with 1 and 0, produces the pair Fib(n+1) and Fib(n). In other words, the Fibonacci numbers are produced by applying T^n, the n-th power of the transformation T, starting with the pair (1, 0). Now consider T to be the special case of p=0 and q=1 in a family of transformations Tpq, where Tpq transforms the pair (a,b) according to a ← bq+aq+ap and b ← bp+aq. Show that if we apply such a transformation Tpq twice, the effect is the same as using a single transformation Tp′q′ of the same form, and compute p′ and q′ in terms of p and q. This gives us an explicit way to square these transformations, and thus we can compute T^n using successive squaring, as in the fast-expt procedure. Put this all together to complete the following procedure, which runs in a logarithmic number of steps:


function fib (n) {
    return (function iter (a, b, p, q, count) {
        if (count == 0) {
            return b;
        } else if (count % 2 == 0) {
            return iter(a,
                        b,
                        p*p + q*q,
                        2*p*q + q*q,
                        count/2);
        } else {
            return iter(b*q + a*q + a*p,
                        b*p + a*q,
                        p,
                        q,
                        count-1);
        };
    })(1, 0, 0, 1, n);
}

console.log(fib(8));   // 21
console.log(fib(13));   // 233


// First transformation
// a' = qb +qa + pa = (p + q)a + bq
// b' = qa + pb

// Second transformation
// a" = qb' +qa' + pa' = (p + q)a' + b'q = ... = (p^2 + 2pq + 2q^2)a + (2pq + q^2)b
// b" = qa' + pb' = ... = (2pq + q^2)a + (p^2 + q^2)b

// p' and q' in terms of p and q
// p' = p^2 + q^2
// q' = 2pq + q^2