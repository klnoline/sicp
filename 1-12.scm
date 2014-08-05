; Exercise 1.12.  The following pattern of numbers is called Pascal's triangle.

;     1
;    1 1
;   1 2 1
;  1 3 3 1
; 1 4 6 4 1

; The numbers at the edge of the triangle are all 1, and each number inside the triangle is the sum of the two numbers above it. Write a procedure that computes elements of Pascal's triangle by means of a recursive process.


#lang scheme

(define (pascal row element)
    (cond ((< row 2) 1)
          ((or (= element 0) (= element row)) 1)
          (else (+ (pascal (- row 1) element) (pascal (- row 1) (- element 1))))))

; Test
(pascal 0 0) ; 1
(pascal 2 1) ; 2
(pascal 4 2) ; 6