{-
- Name: David Nwokoye
- Number: 119380051
- Assignment: 01
-}

module Main where

-- Task 1
{-
f1 takes in an int and returns a bool.
If a is equal to 1,2,3 or 5, then it returns true.
Any other number passed in returns false.
-}

f1 :: Int -> Bool
f1 a =
    if a == 1 then True
    else if a == 2 then True
    else if a == 3 then True
    else if a == 5 then True
    else False

-- Task 2
{-
f2 is the same as f1.
Except rather than using if and else's, guards are used.
-}

f2 :: Int -> Bool
f2 a
  | a == 1 = True
  | a == 2 = True
  | a == 3 = True
  | a == 5 = True
  | otherwise = False

-- Task 3
{-
f3 is the same as f1.
Except rather than using if else's,  
the function is redefined for each case
-}
f3 :: Int -> Bool
f3 1 = True
f3 2 = True
f3 3 = True
f3 5 = True
f3 a = False

-- Task 4
{-
g1 does the opposite of f1.
It takes an int and applies it to f1.
The the result is applied to the not function.
-}
g1 :: Int -> Bool
g1 a = not (f1 a)

-- Task 5
{-
g2 does the same thing as g1.
Instead it uses the lambda of the variable.
-}
g2 :: Int -> Bool
g2 = \a -> not (f1 a)

-- Task 6
predicates = [f1,f2,f3,g1,g2]

-- Task 7
{-
i is the index of the item from the list predicates
-}

get_predicate i = predicates!!i

-- Task 8
{-
get_and_apply takes in 2 ints and returns a bool.
It returns the function call get_predicate with int i.
Int v is applied to the function returned from get_predicate
-}

get_and_apply :: Int -> Int -> Bool
get_and_apply i v = get_predicate i v

-- Task 9
{-
apply_to_all takes in an int and returns a list of bools.
The returned list is made up of the booleans returned
from the all the functions in predicates when applied to a.
-}

apply_to_all :: Int -> [Bool]
apply_to_all a = [f a | f <- predicates]

-- Task 10
{-
count_false_applications takes an int and an int.
The returned int is calculated by the length of
a list created consisting of the function outputs of apply_to_all
when applied to a. 
The only function outputs added are the ones that are false
-}

count_false_applications :: Int -> Int
count_false_applications a = length[f | f <- apply_to_all a, f == False]

-- Task 11
{-
has_opposites works by comparing the lengths of 2 lists.
The first list created contains all the False values. (If any)
The second list contains all the True values. (If any)
It checks if the length of the false and true lists is not 0. 
If they're both not 0, then there are both True and False in the list.
Meaning it has opposites.
-}
has_opposites :: Int -> Bool
has_opposites a = length [f | f <- apply_to_all a, f == False] /= 0
  && length [f | f <- apply_to_all a, f == True] /= 0


main = do
    print "[Task 1] f1 :: Int -> Bool. Entered: 1"
    print (f1 1)

    print "[Task 2] f2 :: Int -> Bool. Entered: 2"
    print (f2 2)

    print "[Task 3] f3 :: Int -> Bool. Entered: 4"
    print (f3 4)

    print "[Task 4] g1 :: Int -> Bool. Entered: 4"
    print (g1 4)

    print "[Task 5] g2 :: Int -> Bool. Entered: 5"
    print (g2 5)

    print "[Task 8] get_and_apply :: Int -> Int -> Bool. Entered: 3 4"
    print (get_and_apply 3 4)

    print "[Task 9] apply_to_all :: Int -> [Bool]. Entered: 5"
    print (apply_to_all 5)

    print "[Task 10] count_false_applications :: Int -> Int. Entered: 6"
    print (count_false_applications 6)

    print "[Task 11] has_opposites :: Int -> Bool. Entered: 3"
    print (has_opposites 3)