-- Exercise 1.10
-- The following procedure computes a mathematical function called Ackermann's function.


ackermann :: (Num a, Eq a) => a -> a -> a
ackermann x y
    | y == 0 = 0
    | x == 0 = y * 2
    | y == 1 = 2
    | otherwise = ackermann (x - 1) (ackermann x (y - 1))

-- What are the values of the following expressions?

ackermann 1 10
-- 1024

ackermann 2 4
-- 65536

ackermann 3 3
-- 65536


-- Consider the following procedures, where `ackermann` is the procedure defined above:

f n = ackermann 0 n
-- 2n

g n = ackermann 1 n
-- 2^n

h n = ackermann 2 n
-- 2^2^2^2... n times

k n = 5 * n * n
-- 5(n^2)

-- Give concise mathematical definitions for the functions computed by the procedures f, g, and h for positive integer values of n. For example, (k n) computes 5(n^2).

main = mapM_ print
        [ ackermann 1 10
        , ackermann 2 4
        , ackermann 3 3 ]