; Exercise 1.24
; Modify the timed-prime-test procedure of Exercise 1.22 to use fast-prime? (the Fermat method), and test each of the 12 primes you found in that exercise. Since the Fermat test has Θ(log(n)) growth, how would you expect the time to test primes near 1,000,000 to compare with the time needed to test primes near 1000? Do your data bear this out? Can you explain any discrepancy you find?

#lang scheme


(define (runtime) (current-inexact-milliseconds))

(define (timed-prime-test n)
   (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
    (if (fast-prime? n 10000)
        (report-prime (- (runtime) start-time) n)
        false))

(define (report-prime elapsed-time n)
    (display n)
    (display " *** ")
    (display elapsed-time)
    (newline))



(define (square x) (* x x))

(define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp)
            (remainder (square (expmod base (/ exp 2) m))
            m))
          (else
            (remainder (* base (expmod base (- exp 1) m))
             m))))

(define (fermat-test n)
    (define (try-it a) (= (expmod a n n) a))
    (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
    (cond ((= times 0) true)
          ((fermat-test n) (fast-prime? n (- times 1)))
           (else false)))


(for-each timed-prime-test '(1009 1013 1019))
; 1009 *** 5.365966796875
; 1013 *** 5.404052734375
; 1019 *** 6.06201171875

(for-each timed-prime-test '(10007 10009 10037))
; 10007 *** 6.552001953125
; 10009 *** 6.300048828125
; 10037 *** 6.662109375

(for-each timed-prime-test '(100003 100019 100043))
; 100003 *** 7.908935546875
; 100019 *** 8.197021484375
; 100043 *** 8.787841796875

(for-each timed-prime-test '(1000003 1000033 1000037))
; 1000003 *** 9.087158203125
; 1000033 *** 8.68505859375
; 1000037 *** 9.48193359375


; This supports the theory of logarithmic growth:
; log(1000037) / log(1009) ≈ 9.48193359375 / 5.365966796875 ≈ 2 times