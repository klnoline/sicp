; Exercise 1.10
; The following procedure computes a mathematical function called Ackermann's function.


#lang scheme

(define (A x y)
    (cond ((= y 0) 0)
          ((= x 0) (* 2 y))
          ((= y 1) 2)
          (else (A (- x 1)
                   (A x (- y 1))))))


; What are the values of the following expressions?

(A 1 10)
; 1024

(A 2 4)
; 65536

(A 3 3)
; 65536


; Consider the following procedures, where A is the procedure defined above:

(define (f n) (A 0 n))
; 2n

(define (g n) (A 1 n))
; 2^n

(define (h n) (A 2 n))
; 2^2^2^2... n times

(define (k n) (* 5 n n))
; 5(n^2)

; Give concise mathematical definitions for the functions computed by the procedures f, g, and h for positive integer values of n. For example, (k n) computes 5(n^2).

(newline)

(f 1)
(f 2)
(f 3)
(f 4)

(newline)

(g 1)
(g 2)
(g 3)
(g 4)

(newline)

(h 1)
(h 2)
(h 3)
(h 4)