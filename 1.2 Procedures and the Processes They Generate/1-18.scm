; Exercise 1.18
; Using the results of Exercise 1.16 and Exercise 1.17, devise a procedure that generates an iterative process for multiplying two integers in terms of adding, doubling, and halving and uses a logarithmic number of steps.

#lang scheme

(define (* a b)
    (define (double x) (+ x x))
    (define (halve x)  (/ x 2))
    (define (iter acc a b)
        (cond ((= b 0) acc)
              ((even? b) (iter acc (double a) (halve b)))
              (else (iter (+ acc a) a (- b 1)))))
    (iter 0 a b))

(* 10 10)