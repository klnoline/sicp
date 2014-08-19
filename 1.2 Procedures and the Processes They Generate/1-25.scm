; Exercise 1.25
; Alyssa P. Hacker complains that we went to a lot of extra work in writing expmod. After all, she says, since we already know how to compute exponentials, we could have simply written

#lang scheme

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

; Is she correct? Would this procedure serve as well for our fast prime tester? Explain.



(define (runtime) (current-inexact-milliseconds))

(define (timed-prime-test n)
   (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
    (if (fast-prime? n 100)
        (report-prime (- (runtime) start-time) n)
        false))

(define (report-prime elapsed-time n)
    (display n)
    (display " *** ")
    (display elapsed-time)
    (newline))



(define (square x) (* x x))

;(define (expmod base exp m)
;    (cond ((= exp 0) 1)
;          ((even? exp)
;            (remainder (square (expmod base (/ exp 2) m))
;            m))
;          (else
;            (remainder (* base (expmod base (- exp 1) m))
;             m))))

(define (fermat-test n)
    (define (try-it a) (= (expmod a n n) a))
    (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
    (cond ((= times 0) true)
          ((fermat-test n) (fast-prime? n (- times 1)))
           (else false)))


(define (fast-expt b n)
    (define (square x) (* x x))
    (define (iter a b n)
        (cond ((= n 0) a)
              ((even? n) (iter a (square b) (/ n 2)))
              (else (iter (* a b) b (- n 1)))))
    (iter 1 b n))


(for-each timed-prime-test '(1009 1013 1019))
(for-each timed-prime-test '(10007 10009 10037))
(for-each timed-prime-test '(100003 100019 100043))
(for-each timed-prime-test '(1000003 1000033 1000037))


; The answer is in a footnote to the expmod code (46):
; The reduction steps in the cases where the exponent e is greater than 1 are based on the fact that, for any integers x, y, and m, we can find the remainder of x times y modulo m by computing separately the remainders of x modulo m and y modulo m, multiplying these, and then taking the remainder of the result modulo m. [...] This technique is useful because it means we can perform our computation without ever having to deal with numbers much larger than m.