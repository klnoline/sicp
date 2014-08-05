-- Exercise 1.12.  The following pattern of numbers is called Pascal's triangle.

--     1
--    1 1
--   1 2 1
--  1 3 3 1
-- 1 4 6 4 1

-- The numbers at the edge of the triangle are all 1, and each number inside the triangle is the sum of the two numbers above it. Write a procedure that computes elements of Pascal's triangle by means of a recursive process.

pascal row col
    | col > row || col < 0      = 0
    | col == 0 || col == row    = 1
    | otherwise                 = pascal (row-1) col + pascal (row-1) (col-1)

main = do
    print $ pascal 0 0 -- 1
    print $ pascal 2 1 -- 2
    print $ pascal 4 2 -- 6