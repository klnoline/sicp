-- Exercise 1.16
-- Design a procedure that evolves an iterative exponentiation process that uses successive squaring and uses a logarithmic number of steps, as does fast-expt. (Hint: Using the observation that (bn/2)2=(b2)n/2, keep, along with the exponent n and the base b, an additional state variable a, and define the state transformation in such a way that the product abn is unchanged from state to state. At the beginning of the process a is taken to be 1, and the answer is given by the value of a at the end of the process. In general, the technique of defining an invariant quantity that remains unchanged from state to state is a powerful way to think about the design of iterative algorithms.)


expt b n = iter 1 b n where
    iter a b n
        | n == 0    = a
        | even n    = iter  a    (b^2)  (n `quot` 2)
        | otherwise = iter (a*b)  b     (n-1)

main = print $ expt 2 30


-- Also, check out haskell's source code for (^):
-- http://hackage.haskell.org/package/base-4.7.0.1/docs/src/GHC-Real.html#%5e