-- Exercise 1.32:
-- a. Show that sum and product (Exercise 1.31) are both special cases of a still more general notion called accumulate that combines a collection of terms, using some general accumulation function:
-- (accumulate combiner null-value term a next b)
-- Accumulate takes as arguments the same term and range specifications as sum and product, together with a combiner procedure (of two arguments) that specifies how the current term is to be combined with the accumulation of the preceding terms and a null-value that specifies what base value to use when the terms run out. Write accumulate and show how sum and product can both be defined as simple calls to accumulate.
-- b. If your accumulate procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process.


-- iterative version
accumulate combiner nullValue term a next b =
    if a > b
    then nullValue
    else accumulate combiner (combiner (term a) nullValue) term (next a) next b

sum' term a next b     = accumulate (+) 0 term a next b
product' term a next b = accumulate (*) 1 term a next b


-- recursive version
accumulate' combiner nullValue term a next b =
    if a > b
    then nullValue
    else combiner (term a) (accumulate' combiner nullValue term (next a) next b)

sum'' term a next b     = accumulate' (+) 0 term a next b
product'' term a next b = accumulate' (*) 1 term a next b


-- test
main = do
    let identity x = x

    -- iterative version
    let sumIntegers a b = sum' identity a (+1) b
    let factorial n = product' identity 1 (+1) n
    print $ sumIntegers 1 10 -- 55
    print $ factorial 5      -- 120

    -- recursive version
    let sumIntegers' a b = sum'' identity a (+1) b
    let factorial' n = product'' identity 1 (+1) n
    print $ sumIntegers' 1 10 -- 55
    print $ factorial' 5      -- 120