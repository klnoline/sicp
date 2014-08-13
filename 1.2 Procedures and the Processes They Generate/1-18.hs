-- Exercise 1.18
-- Using the results of Exercise 1.16 and Exercise 1.17, devise a procedure that generates an iterative process for multiplying two integers in terms of adding, doubling, and halving and uses a logarithmic number of steps.

mult a b = iter 0 a b  where
    iter acc a b
        | b == 0    = acc
        | even b    = iter acc (double a) (halve b)
        | otherwise = iter (acc + a) a (b-1)
      where
        double x = x + x
        halve  x = x `quot` 2

main = print $ mult 10 10