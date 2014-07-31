; Exercise 1.3
; Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

#lang scheme

; Helper functions
(define (square x) (* x x))
(define (sum-of-squares x y) (+ (square x) (square y)))


; First solution
(define (sum-of-biggest-squares-1 x y z)
                (cond ((= (min x y z) x) (sum-of-squares y z))
                      ((= (min x y z) y) (sum-of-squares x z))
                      ((= (min x y z) z) (sum-of-squares x y))))


; Second solution
(define (sum-of-biggest-squares-2 a b c)
    (sum-of-squares (max a b) (max (min a b) c)))


; Third solution
(define (sum-of-biggest-squares-3 a b c)
    (+  (square a)
        (square b)
        (square c)
        (- (square (min a b c)))))


; Testing 
(sum-of-biggest-squares-1 1 2 3)
(sum-of-biggest-squares-2 1 2 3)
(sum-of-biggest-squares-3 1 2 3)