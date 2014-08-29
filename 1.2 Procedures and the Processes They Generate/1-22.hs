-- Exercise 1.22
-- Most Lisp implementations include a primitive called runtime that returns an integer that specifies the amount of time the system has been running (measured, for example, in microseconds). The following timed-prime-test procedure, when called with an integer n, prints n and checks to see if n is prime. If n is prime, the procedure prints three asterisks followed by the amount of time used in performing the test.


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
        | otherwise                 = findDivisor n (testDivisor + 1)
        where
            a `isDivides` b = b `rem` a == 0
            square x = x * x


-- Using this procedure, write a procedure search-for-primes that checks the primality of consecutive odd integers in a specified range. Use your procedure to find the three smallest primes larger than 1000; larger than 10,000; larger than 100,000; larger than 1,000,000. Note the time needed to test each prime. Since the testing algorithm has order of growth of Θ(√n), you should expect that testing for primes around 10,000 should take about √10 times as long as testing for primes around 1000. Do your timing data bear this out? How well do the data for 100,000 and 1,000,000 support the Θ(√n) prediction? Is your result compatible with the notion that programs on your machine run in time proportional to the number of steps required for the computation?

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


-- Ratios stay very close to √10. These results do seem to verify that programs run in time proportional to the number of steps required for the computation.

main = do

    -- Take each number from list, compute test for prime and measure how long it takes
    -- isPrime is returning True or False, so I used this lambda to print an actual number
    let massTimedPrint = mapM_ $ printTime . (\x -> isPrime x `seq` x)

    massTimedPrint $ searchForPrimes 1000 10000 3
    -- 1009 *** 0.000069s
    -- 1013 *** 0.000063s
    -- 1019 *** 0.000061s

    massTimedPrint $ searchForPrimes 10000 100000 3
    -- 10007 *** 0.000168s
    -- 10009 *** 0.000189s
    -- 10037 *** 0.000188s

    massTimedPrint $ searchForPrimes 100000 1000000 3
    -- 100003 *** 0.000546s
    -- 100019 *** 0.000645s
    -- 100043 *** 0.000626s

    massTimedPrint $ searchForPrimes 1000000 10000000 3
    -- 1000003 *** 0.001724s
    -- 1000033 *** 0.001822s
    -- 1000037 *** 0.001801s