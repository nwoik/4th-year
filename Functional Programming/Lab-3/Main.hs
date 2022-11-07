{-
- Name: David Nwokoye
- Number: 119380051
- Assignment: 03
-}

module Main where


{- Task 1
select takes in a compare function f, variable a and a list of a values,
and returns a list of as.

The returned list is created by applying the filter function to 
predicate prd and the list as. 
The list is made up of values that satisfy the predicate prd.

The predicate prd takes a' for each in list as.
prd is defined as comparator f applied to a' and a, 
and returns a' if it isn't greater than a.

Only values that are not greater than a are filtered from as.
-}

select :: Ord a => (a -> a -> Ordering) -> a -> [a] -> [a]
select f a as = filter prd as
    where prd a' = f a' a /= GT  


{- Task 2
compare_with_tie_breaker takes in 2 comparator functions c and c'
and returns a comparator function.

The new comparator is defined as the first compare function c
if c applied to a and a' is EQ. 
Else it returns c'.
-}

compare_with_tie_breaker :: Ord a =>  (a -> a -> Ordering) -> 
    (a -> a -> Ordering) -> (a -> a -> Ordering)
compare_with_tie_breaker c c' = comparator
    where comparator a a' = if c a a' == EQ then c a a'
                            else c' a a'


{- Task 3
is_minimum takes in a comparator function f, 
variable a and list of a values and returns a bool.
The purpose of this function is to find if a is the minimum value
of the list.

If the length of the list created from filter being applied to predicate
prd and as is equals to 0 (empty), then True is returned.  
If not, then False is returned.

The predicate prd takes a' for each in list as.
prd is defined as comparator f applied to a' and a, 
and returns a' only if it's less than a.

Only values that are less than a are filtered from as.
-}

is_minimum :: Ord a => (a -> a-> Ordering) -> a -> [a] -> Bool
is_minimum f a as = if length (filter prd as) == 0 then True
                    else False
                         where prd a' = f a' a == LT


{- Task 4
select_minima takes in a comparator function f and a list as,
and returns a list of a values.
This function only selects the minimum values from a list.

The list is created by filter being applied to predicate prd and as.

Predicate prd takes a' for each value in as,
is_minimum is applied to f, a' and as, 
and checks if each value is the minimum.
If it is the minimum, then a' is returned.

The returned list is made of all the 
values that satisfy the predicate prd.
-}

select_minima :: Ord a => (a -> a-> Ordering) -> [a] -> [a]
select_minima f as = filter prd as
                       where prd a' = is_minimum f a' as == True


{- Task 5
select_equivalents takes an int and a list of ints 
and returns list as' when is a list of ints.

List as' is the result of the function select 
being applied to a comparator compare', i and as.

compare' takes 2 integers a and a', and returns an Ordering.
If both a and a' are odd or even, then EQ is returned.
Else GT is returned.

This ensures that only numbers added to as' are of the same parity as i.
-}

select_equivalents :: Int -> [Int] -> [Int]
select_equivalents i as = as'
        where as' = select compare' i as

compare' :: Int -> Int -> Ordering
compare' a a' = if odd a && odd a' then EQ
                else if even a && even a' then EQ
                else GT


main :: IO ()
main = do
    print "{Task 1}"
    print "select compare 3 [1,2,3,4,5]"
    print (select compare 3 [1,2,3,4,5])

    print "{Task 2}" 
    print "compare_with_tie_breaker compare compare' 3 3"
    print (compare_with_tie_breaker compare compare' 3 3)

    print "{Task 3}"
    print "is_minimum compare 3 [1,2,3,4,5]"
    print (is_minimum compare 3 [1,2,3,4,5])
    print "is_minimum compare 1 [1,2,3,4,5]"
    print (is_minimum compare 1 [1,2,3,4,5])

    print "{Task 4}"
    print "select_minima compare [1,2,3,4,3,2,1]"
    print (select_minima compare [1,2,3,4,3,2,1])

    print "{Task 5}"
    print "select_equivalents 3 [1,2,3,4,5,6,7]"
    print (select_equivalents 3 [1,2,3,4,5,6,7])
    print "select_equivalents 4 [1,2,3,4,5,6,7]"
    print (select_equivalents 4 [1,2,3,4,5,6,7])