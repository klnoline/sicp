; Exercise 1.23
; The smallest-divisor procedure shown at the start of this section does lots of needless testing: After it checks to see if the number is divisible by 2 there is no point in checking to see if it is divisible by any larger even numbers. This suggests that the values used for test-divisor should not be 2, 3, 4, 5, 6, …, but rather 2, 3, 5, 7, 9, …. To implement this change, define a procedure next that returns 3 if its input is equal to 2 and otherwise returns its input plus 2. Modify the smallest-divisor procedure to use (next test-divisor) instead of (+ test-divisor 1). With timed-prime-test incorporating this modified version of smallest-divisor, run the test for each of the 12 primes found in Exercise 1.22. Since this modification halves the number of test steps, you should expect it to run about twice as fast. Is this expectation confirmed? If not, what is the observed ratio of the speeds of the two algorithms, and how do you explain the fact that it is different from 2?

#lang scheme


(define (runtime) (current-inexact-milliseconds))

(define (timed-prime-test n)
    (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
    (if (prime? n)
        (report-prime (- (runtime) start-time) n)
        false))

(define (report-prime elapsed-time n)
    (display n)
    (display " *** ")
    (display elapsed-time)
    (newline))



(define (smallest-divisor n)
    (find-divisor n 2))

(define (next n)
    (if (even? n)
        (+ n 1)
        (+ n 2)))

(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
         ((divides? test-divisor n) test-divisor)
         (else (find-divisor n (next test-divisor)))))

(define (divides? a b) (= (remainder b a) 0))

(define (square x) (* x x))

(define (prime? n) (= n (smallest-divisor n)))


(define (search-for-primes range-start range-end count)
    (if (even? range-start)
        (search-for-primes (+ range-start 1) range-end count)
        (cond ((= count 0) (newline))
              ((> range-start range-end) (newline))
              ((timed-prime-test range-start) (search-for-primes (+ range-start 2) range-end (- count 1)))
              (else (search-for-primes (+ range-start 2) range-end count)))))


; The observed ratio of the speed of the two algorithms is 2, expectation confirmed (except small numbers, it's likely observational error). Neiter extra if's or function calls seems to diminish expected ratio of 2, maybe because of my particular enviroment (command-line version of racket).

; See also: http://www.billthelizard.com/2010/02/sicp-exercise-123-improved-prime-test.html


(search-for-primes 1000    10000    3)
;          before           after
; 1009 *** 0.0009765625 *** 0.0009765625
; 1013 *** 0.0009765625 *** 0.0
; 1019 *** 0.0009765625 *** 0.0

(search-for-primes 10000   100000   3)
;           before           after
; 10007 *** 0.0009765625 *** 0.0009765625
; 10009 *** 0.001953125  *** 0.0009765625
; 10037 *** 0.001953125  *** 0.0009765625

(search-for-primes 100000  1000000  3)
;            before             after
; 100003 *** 0.00390625     *** 0.001953125
; 100019 *** 0.00390625     *** 0.0021972656
; 100043 *** 0.004150390625 *** 0.001953125

(search-for-primes 1000000 10000000 3)
;             before             after
; 1000003 *** 0.013916015625 *** 0.007080078125
; 1000033 *** 0.013916015625 *** 0.0078125
; 1000037 *** 0.013916015625 *** 0.007080078125



; BONUS SECTION (1e12)
(search-for-primes 1000000000000 10000000000000 3)
;                   before              after
; 1000000000039 *** 14.213134765625 *** 7.121826171875
; 1000000000061 *** 13.822998046875 *** 7.1591796875
; 1000000000063 *** 15.087158203125 *** 7.028076171875