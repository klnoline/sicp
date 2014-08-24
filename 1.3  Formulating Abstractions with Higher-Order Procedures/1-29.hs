-- Exercise 1.29
-- Simpson’s Rule is a more accurate method of numerical integration than the method illustrated above. Using Simpson’s Rule, the integral of a function f between a and b is approximated as
-- h3(y0+4y1+2y2+4y3+2y4+...+2yn−2+4yn−1+yn),
-- where h=(b−a)/n, for some even integer n, and yk=f(a+kh). (Increasing n increases the accuracy of the approximation.) Define a procedure that takes as arguments f, a, b, and n and returns the value of the integral, computed using Simpson’s Rule. Use your procedure to integrate cube between 0 and 1 (with n=100 and n=1000), and compare the results to those of the integral procedure shown above.

cube :: Num a => a -> a
cube x = x * x * x

sum' :: (Int -> Double) -> Int -> (Int -> Int) -> Int -> Double
sum' term a next b =
    if a > b
    then 0
    else term a + sum' term (next a) next b

integral :: (Double -> Double) -> Double -> Double -> Int -> Double
integral f a b n = (h / 3) * sum' term 0 (+1) n  where
    h = (b - a) / n'  where n' = fromIntegral n
    y k = f $ a + (k * h)
    term k
        | k == 0 || k == n  = y k'
        | odd  k            = 4 * y k'
        | even k            = 2 * y k'
        where k' = fromIntegral k

main = do
    print $ integral cube 0 1 100                -- 0.2499
    print $ integral cube 0 1 1000               -- 0.2500
    print $ integral (\x -> 3 * x * x) 1 3 100   -- 26.000
    print $ integral (\x -> 3 * x * x) 1 3 1000  -- 25.999