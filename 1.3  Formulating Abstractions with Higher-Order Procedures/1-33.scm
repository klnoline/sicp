; Exercise 1.33
; You can obtain an even more general version of accumulate (Exercise 1.32) by introducing the notion of a filter on the terms to be combined. That is, combine only those terms derived from values in the range that satisfy a specified condition. The resulting filtered-accumulate abstraction takes the same arguments as accumulate, together with an additional predicate of one argument that specifies the filter. Write filtered-accumulate as a procedure. Show how to express the following using filtered-accumulate:
; a. the sum of the squares of the prime numbers in the interval a to b (assuming that you have a prime? predicate already written)
; b. the product of all the positive integers less than n that are relatively prime to n (i.e., all positive integers i < n such that GCD(i,n) = 1).


#lang scheme

; Straightforward version
;(define (filtered-accumulate filter combiner null-value term a next b)
;    (cond ((> a b) null-value)
;          ((filter a) (filtered-accumulate filter combiner (combiner (term a) null-value) term (next a) next b))
;           (else (filtered-accumulate filter combiner null-value term (next a) next b))))

(define (filtered-accumulate filter? combiner null-value term a next b)
    (define (iter acc n)
        (cond ((> n b) acc)
              ((filter? n) (iter (combiner acc (term n)) (next n)))
              (else (iter acc (next n)))))
    (iter null-value a))

(define (identity x) x)
(define (square x) (* x x))

(define (prime? n)
    (define (square-check x m)
        (if (and (not (or (= x 1) (= x (- m 1))))
                 (= (remainder (square x) m) 1))
            0
            (remainder (* x x) m)))

    (define (expmod base exp m)
      (cond ((= exp 0) 1)
            ((even? exp)
              (square-check (expmod base (/ exp 2) m) m))
            (else
              (remainder (* base (expmod base (- exp 1) m))
                         m))))

    (define (miller-rabin-test? n)
        (define (try-it a)
            (= (expmod a (- n 1) n) 1))
        (try-it (+ 2 (random (- n 2)))))

    ; Miller-Rabin hack against random with negative seed
    (cond   ((= n 1) #t)
            ((= n 2) #f)
            (else (miller-rabin-test? n))))


; The sum of the squares of the prime numbers in the interval a to b
(define (sum-squared-primes a b)
    (filtered-accumulate prime? + 0 square a add1 b))

(sum-squared-primes 1 10) ; 84


; The product of all the positive integers less than n that are relatively prime to n
(define (product-of-coprimes n)
    (define (gcd a b) (if (= b 0) a (gcd b (remainder a b))))
    (define (coprime? m) (= (gcd m n) 1))
    (filtered-accumulate coprime? * 1 identity 1 add1 n))

(product-of-coprimes 10) ; 189