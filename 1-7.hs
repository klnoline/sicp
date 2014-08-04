-- Exercise 1.7
-- The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers. Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate for very large numbers. Explain these statements, with examples showing how the test fails for small and large numbers. An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?


oldSqrt x = sqrtIter 1.0 x where
    sqrtIter guess x =
        if goodEnough guess x
        then guess
        else sqrtIter (improve guess x) x
    goodEnough guess x = (abs $ (square guess) - x) < 0.001
    square x = x * x
    improve guess x = average guess (x / guess)
    average x y = (x + y) / 2


newSqrt x = sqrtIter 1.0 x where
    sqrtIter guess oldGuess =
        if goodEnough guess oldGuess
        then guess
        else sqrtIter (improve guess) guess
    goodEnough guess oldGuess = (abs $ oldGuess - guess) < 0.0000000000001
    improve guess = average guess (x / guess)
    average x y = (x + y) / 2


main = do
    print $ oldSqrt 9
    print $ oldSqrt 0.001
    print $ oldSqrt 1000000000
    print $ newSqrt 9
    print $ newSqrt 0.001
    print $ newSqrt 1000000000