; Exercise 1.27
; Demonstrate that the Carmichael numbers listed in Footnote 47 really do fool the Fermat test. That is, write a procedure that takes an integer n and tests whether an is congruent to a modulo n for every a < n, and try your procedure on the given Carmichael numbers.


#lang scheme


(define (square x) (* x x))

(define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp)
            (remainder (square (expmod base (/ exp 2) m))
            m))
          (else
            (remainder (* base (expmod base (- exp 1) m))
             m))))

(define (full-fermat-prime? n)
    (define (iter n count)
        (cond ((= n count) #t)
              ((= (expmod count n n) count) (iter n (+ count 1)))
              (else #f)))
    (iter n 1))

(define (fool-test n)
    (display n)
    (display " ")
    (display (full-fermat-prime? n))
    (newline))


; Carmichael Numbers
(for-each fool-test '(561 1105 1729 2465 2821 6601))

; Prime Numbers
(for-each fool-test '(41 263 919))

; Composite Numbers
(for-each fool-test '(9 42 255 1024))