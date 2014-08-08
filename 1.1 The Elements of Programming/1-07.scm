; Exercise 1.7
; The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers. Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate for very large numbers. Explain these statements, with examples showing how the test fails for small and large numbers. An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?


#lang scheme

(define (old-sqrt x)
    (define (square x) (* x x))
    (define (good-enough? guess x)
        (< (abs (- (square guess) x)) 0.001))
    (define (improve guess)
        (average guess (/ x guess)))
    (define (average x y)
        (/ (+ x y) 2))
    (define (sqrt-iter guess x)
        (if (good-enough? guess x)
            guess
           (sqrt-iter (improve guess) x)))

    (sqrt-iter 1.0 x))


(define (new-sqrt x)
    (define (good-enough? guess oldguess)
        (< (abs (- oldguess guess)) 0.0000000000001))
    (define (improve guess)
        (average guess (/ x guess)))
    (define (average x y)
        (/ (+ x y) 2))
    (define (sqrt-iter guess oldguess)
        (if (good-enough? guess oldguess)
                 guess
                (sqrt-iter (improve guess) guess)))

    (sqrt-iter 1.0 x))


; Old vs New
(old-sqrt 9)
(old-sqrt 0.001)
(old-sqrt 100000000)


(new-sqrt 9)
(new-sqrt 0.001)
(old-sqrt 100000000)

; new-sqrt works even with extra large numbers
(new-sqrt 1000000000000000)