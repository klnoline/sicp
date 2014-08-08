; Exercise 1.4
; Observe that our model of evaluation allows for combinations whose operators are compound expressions. Use this observation to describe the behavior of the following procedure

; If second operand is negative then make it positive
(define (a-plus-abs-b a b)
    ((if (> b 0) + -) a b))

; The same result
(a-plus-abs-b 2 -1)
(a-plus-abs-b 2 1)