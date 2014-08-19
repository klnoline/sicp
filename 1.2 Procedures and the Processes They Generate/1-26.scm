; Exercise 1.26
; Louis Reasoner is having great difficulty doing Exercise 1.24. His fast-prime? test seems to run more slowly than his prime? test. Louis calls his friend Eva Lu Ator over to help. When they examine Louis’s code, they find that he has rewritten the expmod procedure to use an explicit multiplication, rather than calling square:

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                     m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                     m))))

; “I don’t see what difference that could make,” says Louis. “I do.” says Eva. “By writing the procedure like that, you have transformed the Θ(log(n)) process into a Θ(n) process.” Explain.


; Here's the problem — Louis doubled number of recursive expmod calls.
(* (expmod base (/ exp 2) m)
   (expmod base (/ exp 2) m))

; Logarithmic iterative process was converted into exponential recursive process (with logarithmic optimization). Θ(log n) process is now Θ(log 2^n), which simplifies to Θ(n):