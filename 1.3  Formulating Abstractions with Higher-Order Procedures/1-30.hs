-- Exercise 1.30
-- The sum procedure above generates a linear recursion. The procedure can be rewritten so that the sum is performed iteratively. Show how to do this by filling in the missing expressions in the following definition:

-- (define (sum term a next b)
--   (define (iter a result)
--     (if ⟨??⟩
--         ⟨??⟩
--         (iter ⟨??⟩ ⟨??⟩)))
--   (iter ⟨??⟩ ⟨??⟩))

sum' term a next b = iter a 0  where
    iter a result =
        if a > b
        then result
        else iter (next a) (result + term a)


-- Test

sumIntegers a b = sum' identity a succ b  where
    identity x = x

main = print $ sumIntegers 1 10