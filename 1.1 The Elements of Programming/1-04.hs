-- Exercise 1.4
-- Observe that our model of evaluation allows for combinations whose operators are compound expressions. Use this observation to describe the behavior of the following procedure

-- If second operand is negative then make it positive
aPlusAbsB a b = (if b > 0 then (+) else (-)) a b

-- The same result in both cases
main = print $ aPlusAbsB 3 2 == aPlusAbsB 3 (-2)