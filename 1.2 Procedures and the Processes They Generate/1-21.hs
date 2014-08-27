-- Exercise 1.21
-- Use the smallest-divisor procedure to find the smallest divisor of each of the following numbers: 199, 1999, 19999.


square x = x * x
smallestDivisor x = findDivisor x 2  where
    findDivisor n testDivisor
        | square testDivisor > n  = n
        | isDivides testDivisor n = testDivisor
        | otherwise               = findDivisor n (testDivisor + 1)
    isDivides a b = b `rem` a == 0

main = mapM_ (print . smallestDivisor) [199, 1999, 19999]