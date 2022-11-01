{-
- Name: David Nwokoye
- Number: 119380051
- Assignment: 02
-}

module Main where


{- Task 1
select takes in a compare function, an a variable and a list of a's,
and returns a list of a's.

Base case:
select f a [] = []

Using foldl,
foldl takes in function f, variable a 
and list of (a':as) where a' is the head of the list.
The base case of foldl is if list (a':as) is [] return [].

Using if statements,
if the f of variable a and a' is not greater than,
then a is passed in as the head of the returned list
and the tail is a function call of foldl with function f, 
variable a and as.

If the f of a and a' is equal,
then it's a tie meaning it doesn't matter which one is passed in as
the head. The tail is a function call of foldl with function f, 
variable a and as.

Else a' is preferred over a if a is greater than a'.
The resulting list has a' as the head and the tail is
a function call of foldl with function f, 
variable a and as.

This continues until the base case is met.  
-}

select :: Ord a => (a -> a -> Ordering) -> a -> [a] -> [a]
select f a [] = []
select f a as = filter (\f -> a /= GT) as


{- Task 2

-}

compare_with_tie_breaker :: (a -> a -> Ordering) -> (a -> a -> Ordering) -> (a -> a -> Ordering)
compare_with_tie_breaker compare compare' = function
    where function a a' = if compare a a' == EQ then compare a a'
                            else compare' a a'



{- Task 3

-}


{- Task 4

-}


{- Task 5
select_equivalents takes an int and a list of ints 
and returns a list of ints 

Bases case:
select_equivalents i [] = []
If list (a:as) is empty then return empty list.

Using filter,
if result of the function call odd applied to i is true,
then the function filter is applied to predicate odd
and list of ints es. Where es is the result of the function select
applied to comparator compare, 1 and (a:as). 

Else
-}

select_equivalents :: Int -> [Int] -> [Int]
select_equivalents i [] = []
select_equivalents i (a:as) = 
    if odd i then filter odd os
    else filter even es
        where os = select compare 1 (a:as)
              es = select compare 2 (a:as)


main :: IO ()
main = do
    print()