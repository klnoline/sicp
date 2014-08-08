-- Exercise 1.8
-- Newton's method for cube roots is based on the fact that if y is an approximation to the cube root of x, then a better approximation is given by the value:
-- (x/y^2 + 2y) / 3

-- Use this formula to implement a cube-root procedure analogous to the square-root procedure. (In Section 1.3.4 we will see how to implement Newton's method in general as an abstraction of these square-root and cube-root procedures.)


cbrt x = cbrtIter 1.0 x where
    cbrtIter guess oldGuess =
        if goodEnough guess oldGuess
        then guess
        else cbrtIter (improve guess) guess
    goodEnough guess oldGuess = (abs $ oldGuess - guess) < 0.0000000000001
    improve guess = (x / guess^2 + 2 * guess) / 3

main = do
    print $ cbrt 8
    print $ cbrt 10000000