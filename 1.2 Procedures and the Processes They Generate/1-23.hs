-- Exercise 1.23
-- The smallest-divisor procedure shown at the start of this section does lots of needless testing: After it checks to see if the number is divisible by 2 there is no point in checking to see if it is divisible by any larger even numbers. This suggests that the values used for test-divisor should not be 2, 3, 4, 5, 6, …, but rather 2, 3, 5, 7, 9, …. To implement this change, define a procedure next that returns 3 if its input is equal to 2 and otherwise returns its input plus 2. Modify the smallest-divisor procedure to use (next test-divisor) instead of (+ test-divisor 1). With timed-prime-test incorporating this modified version of smallest-divisor, run the test for each of the 12 primes found in Exercise 1.22. Since this modification halves the number of test steps, you should expect it to run about twice as fast. Is this expectation confirmed? If not, what is the observed ratio of the speeds of the two algorithms, and how do you explain the fact that it is different from 2?


import Data.Time.Clock


printTime :: Show a => a -> IO ()
printTime result = do
    start <- getCurrentTime
    putStr $ show result
    end   <- getCurrentTime
    putStr " *** "
    putStrLn . show $ diffUTCTime end start


isPrime :: Int -> Bool
isPrime n = n == smallestDivisor n

smallestDivisor :: Int -> Int
smallestDivisor n = findDivisor n 2  where
    findDivisor n testDivisor
        | square testDivisor > n    = n
        | testDivisor `isDivides` n = testDivisor
        | otherwise                 = findDivisor n (next testDivisor)
        where
            a `isDivides` b = b `rem` a == 0
            square x = x * x
            next n = if even n
                     then n + 1
                     else n + 2

searchForPrimes :: Int -> Int -> Int -> [Int]
searchForPrimes start end count = reverse $ iterPrimes start []  where
    iterPrimes n xs
        | length xs == count = xs
        | n > end            = xs
        | even n             = iterPrimes (n + 1) xs
        -- We don't have to check even numbers for primality
        -- so we can make jumping increment by 2:
        | isPrime n          = iterPrimes (n + 2) (n:xs)
        | otherwise          = iterPrimes (n + 2) xs



-- The observed ratio of the speed of the two algorithms is not 2, but √2, expectation not confirmed. But why?

-- See also: http://www.billthelizard.com/2010/02/sicp-exercise-123-improved-prime-test.html


main = do

    -- Take each number from list, compute test for prime and measure how long it takes
    -- isPrime is returning True or False, so I used this lambda to print an actual number
    let massTimedPrint = mapM_ $ printTime . (\x -> isPrime x `seq` x)


    massTimedPrint $ searchForPrimes 1000 10000 3
    --          before        after
    -- 1009 *** 0.000069s *** 0.000058s
    -- 1013 *** 0.000063s *** 0.00005s
    -- 1019 *** 0.000061s *** 0.000045s

    massTimedPrint $ searchForPrimes 10000 100000 3
    --           before        after
    -- 10007 *** 0.000168s *** 0.000131s
    -- 10009 *** 0.000189s *** 0.00013s
    -- 10037 *** 0.000188s *** 0.00013s

    massTimedPrint $ searchForPrimes 100000 1000000 3
    --            before        after
    -- 100003 *** 0.000546s *** 0.000368s
    -- 100019 *** 0.000645s *** 0.000402s
    -- 100043 *** 0.000626s *** 0.000416s

    massTimedPrint $ searchForPrimes 1000000 10000000 3
    --             before        after
    -- 1000003 *** 0.001724s *** 0.001133s
    -- 1000033 *** 0.001822s *** 0.001262s
    -- 1000037 *** 0.001801s *** 0.001254s

    -- BONUS SECTION (1e12)
    massTimedPrint $ searchForPrimes 1000000000000 10000000000000 3
    --                   before        after
    -- 1000000000039 *** 1.679653s *** 1.164681s
    -- 1000000000061 *** 1.690982s *** 1.167976s
    -- 1000000000063 *** 1.690254s *** 1.181148s