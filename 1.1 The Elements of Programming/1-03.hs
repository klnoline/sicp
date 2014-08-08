-- Exercise 1.3
-- Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

import Data.List
import Test.HUnit

-- Auxiliary function
sumOfSquares :: (Num a) => a -> a -> a
sumOfSquares x y = x^2 + y^2


-- First solution, Java-like
f :: Int -> Int -> Int -> Int
f x y z
    | smallestNumber == x = sumOfSquares y z
    | smallestNumber == y = sumOfSquares x z
    | smallestNumber == z = sumOfSquares x y
    where smallestNumber = minimum [x, y, z]


-- Second solution, LISP-like
f' :: (Num a, Ord a) => a -> a -> a -> a
f' a b c = sumOfSquares x y
    where x = max a b
          y = max (min a b) c


-- Third solution, algebra-like
f'' :: (Num a, Ord a) => a -> a -> a -> a
f'' a b c = (sum . map square $ numbers) - (square $ minimum numbers)
    where square = (^2)
          numbers = [a, b, c]


-- Fourth solution, Haskell-like
f''' :: (Num a, Ord a) => a -> a -> a -> a
f''' a b c = sum . map (^2) . drop 1 . sort $ [a, b, c]


-- Tests
tests = TestList
    [ TestCase (assertEqual "first solution"  (f    1 2 3) 13)
    , TestCase (assertEqual "second solution" (f'   1 2 3) 13)
    , TestCase (assertEqual "third solution"  (f''  1 2 3) 13)
    , TestCase (assertEqual "fourth solution" (f''' 1 2 3) 13) ]

main = runTestTT tests