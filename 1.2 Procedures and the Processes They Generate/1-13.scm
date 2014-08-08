; Exercise 1.13
; Prove that Fib(n) is the closest integer to (φ^n)/5, where φ = (1 + sqrt(5))/2. Hint: Let ψ = (1 - sqrt(5))/2. Use induction and the definition of the Fibonacci numbers (see section 1.2.2) to prove that Fib(n) = (φ^n - ψ^n)/5.

; Use this properties to prove this theorem:

; Definition
Fib(n+1) = Fib(n) + Fib(n-1)

; φ-ratio
φ^2 = φ + 1
1/φ + 1 = φ
; (same for ψ)

; Also, φ and ψ are solutions to this quadratic equation:
x^2 - x - 1 = 0
x = (1 ± sqrt(5)) / 2


; See also
; https://en.wikipedia.org/wiki/Mathematical_induction
; http://www.billthelizard.com/2009/12/sicp-exercise-113-fibonacci-and-golden.html
; http://community.schemewiki.org/?sicp-ex-1.13