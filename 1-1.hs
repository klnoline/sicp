-- Exercise 1.1.
-- Below is a sequence of expressions. What is the result printed by the interpreter in response to each expression? Assume that the sequence is to be evaluated in the order in which it is presented.

10
-- 10

5 + 3 + 4
-- 12

9 - 1
-- 8

6 / 2
-- 3

(2 * 4) + (4 - 6)
-- 6

let a = 3
let b = a + 1

a + b + (a * b)
-- 19

a == b
-- False

if (b > a && b < (a * b)) then b else a
-- 4

if a == 4 then 6 else if b == 4 then 6 + 7 + a else 25
-- 16

2 + (if (b > a) then b else a)
-- 6

(if a > b then a else if a < b then b else -1) * (a + 1)
-- 16