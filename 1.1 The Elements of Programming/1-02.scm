; Exercise 1.2
; Translate the following expression into prefix form:
; http://mitpress.mit.edu/sicp/full-text/book/ch1-Z-G-3.gif

#lang scheme

(/  (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
    (* 3 (- 6 2) (- 2 7)))

; -37/150