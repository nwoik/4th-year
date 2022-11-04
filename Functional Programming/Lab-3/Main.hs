{-
- Name: David Nwokoye
- Number: 119380051
- Assignment: 02
-}

module Main where


{- Task 1
select takes in a compare function, an a variable and a list of a values,
and returns a list of as.

The returned list is made by applying the filter function to a predicate
and the list as. 
The predicate is applied to a' from the list as 
-}

select :: Ord a => (a -> a -> Ordering) -> a -> [a] -> [a]
select f a as = filter prd as
    where prd a' = f a' a /= GT  


{- Task 2

-}

compare_with_tie_breaker :: Ord a =>  (a -> a -> Ordering) -> (a -> a -> Ordering) -> (a -> a -> Ordering)
compare_with_tie_breaker compare compare' = function
    where function a a' = if compare a a' == EQ then compare a a'
                            else compare' a a'



{- Task 3

-}


is_minimum :: Ord a => (a -> a-> Ordering) -> a -> [a] -> Bool
is_minimum f a as = if length (filter prd as) == 0 then True
                    else False
                         where prd a' = f a' a == LT



{- Task 4

-}

select_minima :: Ord a => (a -> a-> Ordering) -> [a] -> [a]
select_minima f as = filter prd as
                       where prd a' = is_minimum f a' as == True

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
select_equivalents i as = 
    if odd i then filter odd result
    else filter even result
        where result = select compare' i as


compare' :: Int -> Int -> Ordering
compare' a a' = if odd a && odd a' then LT
                else if even a && even a' then LT
                else GT


main :: IO ()
main = do
    