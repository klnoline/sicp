; Exercise 1.20
; The process that a procedure generates is of course dependent on the rules used by the interpreter. As an example, consider the iterative gcd procedure given above. Suppose we were to interpret this procedure using normal-order evaluation, as discussed in 1.1.5. (The normal-order-evaluation rule for if is described in Exercise 1.5.) Using the substitution method (for normal order), illustrate the process generated in evaluating (gcd 206 40) and indicate the remainder operations that are actually performed. How many remainder operations are actually performed in the normal-order evaluation of (gcd 206 40)? In the applicative-order evaluation?


#lang scheme

(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))


; NORMAL ORDER
; The process generated using the normal-order evaluation is the following. It performs 18 remainder operations: 14 when evaluating the condition and 4 in the final reduction phase.

(gcd 206 40)

(if (= 40 0) ...)

(gcd 40 (remainder 206 40))

(if (= (remainder 206 40) 0) ...)

(if (= 6 0) ...)

(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))

(if (= (remainder 40 (remainder 206 40)) 0) ...)

(if (= 4 0) ...)

(gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))

(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0) ...)

(if (= 2 0) ...)

(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

(if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0) ...)

(if (= 0 0) ...)
(remainder (remainder 206 40) (remainder 40 (remainder 206 40)))



; APPLICATIVE ORDER
; The process generated using the applicative-order evaluation is the following. It performs 4 remainder operations.

(gcd 206 40)

(gcd 40 (remainder 206 40))

(gcd 40 6)

(gcd 6 (remainder 40 6))

(gcd 6 4)

(gcd 4 (remainder 6 4))

(gcd 4 2)

(gcd 2 (remainder 4 2))

(gcd 2 0)

2