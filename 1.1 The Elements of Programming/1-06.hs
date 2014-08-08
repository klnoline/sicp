-- Exercise 1.6
-- Alyssa P. Hacker doesn’t see why if needs to be provided as a special form. “Why can’t I just define it as an ordinary procedure in terms of cond?” she asks. Alyssa’s friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if:

newIf predicate thenClause elseClause = if predicate then thenClause else elseClause

-- Eva demonstrates the program for Alyssa:
newIf (2 == 3) 0 5
-- 5
newIf (1 == 1) 0 5
-- 0

-- Delighted, Alyssa uses new-if to rewrite the square-root program:

sqrtIter guess x =
    newIf
        (goodEnough guess x)
        guess
        (sqrtIter (improve guess x) x)

-- What happens when Alyssa attempts to use this to compute square roots? Explain.

square x = x * x
average x y = (x + y) / 2
improve guess x = average guess (x / guess)

goodEnough guess x = (abs $ (square guess) - x) < 0.001
sqrt' x = sqrtIter 1.0 x

main = print $ sqrt' 9


-- Answer:
-- Our custom newIf works fine because Haskell is lazy by default.