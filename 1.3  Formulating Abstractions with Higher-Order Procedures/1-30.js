// Exercise 1.30
// The sum procedure above generates a linear recursion. The procedure can be rewritten so that the sum is performed iteratively. Show how to do this by filling in the missing expressions in the following definition:

// (define (sum term a next b)
//   (define (iter a result)
//     (if ⟨??⟩
//         ⟨??⟩
//         (iter ⟨??⟩ ⟨??⟩)))
//   (iter ⟨??⟩ ⟨??⟩))


function sum (term, a, next, b) {
    return (function iter (a, result) {
        if (a > b) {
            return result;
        } else {
            return iter(next(a), result + term(a));
        };
    })(a, 0);
}


// Test

function sumIntegers (a, b) {
    function identity (x) { return x };
    function succ (x) { return x + 1; };

    return sum(identity, a, succ, b);
}

console.log(sumIntegers(1, 10));