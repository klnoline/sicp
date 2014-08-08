-- Exercise 1.9
-- Each of the following two procedures defines a method for adding two positive integers in terms of the procedures inc, which increments its argument by 1, and dec, which decrements its argument by 1.


add a b =
    if a == 0
    then b
    else succ $ pred a `add` b

add' a b =
    if a == 0
    then b
    else pred a `add'` succ b

-- Using the substitution model, illustrate the process generated by each procedure in evaluating (+ 4 5). Are these processes iterative or recursive?


-- Recursive process
add 4 5
succ $ add 3 5
succ $ succ $ add 2 5
succ $ succ $ succ $ add 1 5
succ $ succ $ succ $ succ $ add 0 5
succ $ succ $ succ $ succ 5
succ $ succ $ succ 6
succ $ succ 7
succ 8
9

-- Iterative process
add 4 5
add 3 6
add 2 7
add 1 8
add 0 9
9