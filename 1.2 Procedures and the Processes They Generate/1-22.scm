; Exercise 1.22
; Most Lisp implementations include a primitive called runtime that returns an integer that specifies the amount of time the system has been running (measured, for example, in microseconds). The following timed-prime-test procedure, when called with an integer n, prints n and checks to see if n is prime. If n is prime, the procedure prints three asterisks followed by the amount of time used in performing the test.


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

(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
         ((divides? test-divisor n) test-divisor)
         (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))

(define (square x) (* x x))

(define (prime? n) (= n (smallest-divisor n)))

; Using this procedure, write a procedure search-for-primes that checks the primality of consecutive odd integers in a specified range. Use your procedure to find the three smallest primes larger than 1000; larger than 10,000; larger than 100,000; larger than 1,000,000. Note the time needed to test each prime. Since the testing algorithm has order of growth of Θ(√n), you should expect that testing for primes around 10,000 should take about √10 times as long as testing for primes around 1000. Do your timing data bear this out? How well do the data for 100,000 and 1,000,000 support the Θ(√n) prediction? Is your result compatible with the notion that programs on your machine run in time proportional to the number of steps required for the computation?


(define (search-for-primes range-start range-end count)
    (if (even? range-start)
        (search-for-primes (+ range-start 1) range-end count)
        (cond ((= count 0) (newline))
              ((> range-start range-end) (newline))
              ((timed-prime-test range-start) (search-for-primes (+ range-start 2) range-end (- count 1)))
              (else (search-for-primes (+ range-start 2) range-end count)))))


; Ratios stay very close to √10. These results do seem to verify that programs run in time proportional to the number of steps required for the computation.

(search-for-primes 1000    10000    3)
; 1009 *** 0.0009765625
; 1013 *** 0.0009765625
; 1019 *** 0.0009765625

(search-for-primes 10000   100000   3)
; 10007 *** 0.0009765625
; 10009 *** 0.001953125
; 10037 *** 0.001953125

(search-for-primes 100000  1000000  3)
; 100003 *** 0.00390625
; 100019 *** 0.00390625
; 100043 *** 0.004150390625

(search-for-primes 1000000 10000000 3)
; 1000003 *** 0.013916015625
; 1000033 *** 0.013916015625
; 1000037 *** 0.013916015625