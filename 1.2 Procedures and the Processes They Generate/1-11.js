// Exercise 1.11
// A function f is defined by the rule that f(n) = n if n < 3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n > 3. Write a procedure that computes f by means of a recursive process. Write a procedure that computes f by means of an iterative process.


// recurcise process
function f (n) {
    if (n < 3) {
        return n;
    } else {
        return f(n-1) + 2*f(n-2) + 3*f(n-3);
    };
}

// iterative process
function f_ (n) {
    if (n < 3) {
        return n;
    } else {
        return f_Iter(2, 1, 0, n);
    };

    function f_Iter (a, b, c, count) {
        if (count < 3) {
            return a;
        } else {
            return f_Iter(a+2*b+3*c, a, b, count-1);
        };
    }
}

console.log(f(3));  // 4
console.log(f_(3)); // 4

// f(3) = f(2) + 2f(1) + 3f(0)
//      ↘      ↘       ↘
// f(4) = f(3) + 2f(2) + 3f(1)
//      ↘      ↘       ↘
// f(5) = f(4) + 2f(3) + 3f(2)
//      ↘      ↘       ↘
// f(6) = f(5) + 2f(4) + 3f(3)
//      ↘      ↘       ↘
// f(7) = f(6) + 2f(5) + 3f(4)


// See: http://stackoverflow.com/questions/2365993/no-idea-how-to-solve-sicp-exercise-1-11