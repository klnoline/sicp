-- Exercise 1.31
-- a. The sum procedure is only the simplest of a vast number of similar abstractions that can be captured as higher-order procedures.51 Write an analogous procedure called product that returns the product of the values of a function at points over a given range. Show how to define factorial in terms of product. Also use product to compute approximations to π using the formula52
-- π/4 = (2⋅4⋅4⋅6⋅6⋅8⋅...) / (3⋅3⋅5⋅5⋅7⋅7⋅...)
-- b. If your product procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process.


-- recursive version
product' term a next b =
    if a > b
    then 1
    else term a * product' term (next a) next b

-- iterative version
product'' term a next b = iter a 1  where
    iter a result =
        if a > b
        then result
        else iter (next a) (result * term a)


identity x = x

factorial n = product' identity 1 (+1) n
factorial' n = product'' identity 1 (+1) n

piProduct :: Int -> Int -> Double
piProduct a b = product' piTerm a (+1) b  where
    piTerm n' = x / (x - 1)  where
        x = 4 * n * n
        n = fromIntegral n'

main = do
    print $ factorial 5           -- 120
    print $ factorial' 5          -- 120
    print $ 2 * piProduct 1 1000  -- 3.14

-- http://en.wikipedia.org/wiki/Wallis_product