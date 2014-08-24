; Exercise 1.31
; a. The sum procedure is only the simplest of a vast number of similar abstractions that can be captured as higher-order procedures.51 Write an analogous procedure called product that returns the product of the values of a function at points over a given range. Show how to define factorial in terms of product. Also use product to compute approximations to π using the formula52
; π/4 = (2⋅4⋅4⋅6⋅6⋅8⋅...) / (3⋅3⋅5⋅5⋅7⋅7⋅...)
; b. If your product procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process.


#lang scheme

(define (product-recursive term a next b)
    (if (> a b)
        1
        (*  (term a)
            (product-recursive term (next a) next b))))

(define (product-iterative term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (* result (term a)))))
    (iter a 1))

(define (identity x) x)

(define (factorial-recursive n)
    (product-recursive identity 1 add1 n))

(define (factorial-iterative n)
    (product-iterative identity 1 add1 n))

(factorial-recursive 5)
(factorial-iterative 5)



(define (pi-product a b)
    (define (pi-term n)
        (/  (* 4 n n)
            (- (* 4 n n) 1)))
    (product-iterative pi-term a add1 b))

(exact->inexact (* 2 (pi-product 1 1000)))

; http://en.wikipedia.org/wiki/Wallis_product