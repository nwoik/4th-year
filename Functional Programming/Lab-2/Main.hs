{-
- Name: David Nwokoye
- Number: 119380051
- Assignment: 02
-}

module Main where

{- Task 1
rev_bin_rep takes an int and converts it to binary,
represented in a reversed list of ints.

The base cases:
rev_bin_rep 0 = [0]
rev_bin_rep 1 = [1]

A list is created of the modulus of int i.
The tail of the list is a recursive call of i divided by 2.
This happens until either of the base cases are reached.
Then the result is reversed.
-}

rev_bin_rep :: Int -> [Int]
rev_bin_rep 0 = [0]
rev_bin_rep 1 = [1]
rev_bin_rep i = reverse (i `mod` 2: rev_bin_rep (i `div` 2))


{- Task 2
selections takes a list of ints, a list of tuples,
and returns a list of ints.

The base cases:
selections [] [] = []
selections [] (t:ts) = []
selections (i:is) [] = []

A list is created of the snd of tuple t, 
if the fst of tuple t is equals to int i. 
The tail of the list is a recursive call,
with the tails of both lists is and ts.

Else if the fst t isn't equal to i,
then selections is called with ts
and the tail of is to move the tuples along.
Else then selections is called with is
and the tail of ts to move the indices along.
-}

selections :: [Int] -> [(Int, Int)] -> [Int]
selections [] [] = []
selections [] (t:ts) = []
selections (i:is) [] = []
selections (i:is) (t:ts) = 
    if fst t == i then (snd t : selections is ts)
    else if fst t < i then selections (i:is) ts
    else selections is (t:ts)


{- Task 3
concatenations takes in a list of a list of a list of a's,
and returns a list of a list of a's.

The base cases:
concatenations [] = []
concatenations [as] = as

Using a list comprehension,
A concatenation of variables b and l is added to the list,
where b is the head of bs 
and l is the result of the recursive call of concatenations,
with a list comprehension passed in as a variable
containing each item of as.
-}

concatenations :: [[[a]]] -> [[a]]
concatenations [] = []
concatenations [as] = as
concatenations ((b:bs):as) = [b ++ l | b <- (b:bs), 
        l <- concatenations [a | a <- as]]


{- Task 4
There are no base cases because it's infinitely recurring.

k_ary_patterns takes in an int and returns a list of tuples,
containing an int as the first value 
and a list of lists of integers as the second value.


A list is made up with the head being a tuple containing
variable i and ls. Where i is equals to 1 and ls is a list
of lists containing integers from [0] to [n].

The tail of the list is the result of the helper function.

increment_n_concatenate, the helper function takes an int i
and a list of list of integers ls and returns a list of tuples.
It has 2 base cases.

If list ls is empty, then the head of the list is a tuple made
up of i+1 as the first value and the empty list as the second value.
The tail of the list is a recursive call with i+1 and the empty list.

Otherwise instead of the empty list as the second value, a variable c
is the second value. Where c is the result of the function
concatenations with a list of 2 ls variables.
The tail of the list is a recursive call with i+1 and variable c.
-}

k_ary_patterns :: Int -> [(Int, [[Int]])]
k_ary_patterns n = (i, ls):increment_n_concatenate i ls
    where ls = take n [[j] | j <- [0..]]
          i = 1

increment_n_concatenate :: Int -> [[Int]] -> [(Int, [[Int]])]
increment_n_concatenate i ls
    | null ls = (i + 1, []): increment_n_concatenate (i + 1) []
    | otherwise = (i + 1, c): increment_n_concatenate (i + 1) c
    where c = concatenations [ls, ls]


main = do 
    putStrLn $ concat ["k_ary_patterns ", show kp_a, " = [ ", 
        show $ kp_res !! 0, ",", show $ kp_res !! 1, 
        show $ kp_res !! 2, "..]" ]
    putStrLn $ concat ["concatenations " , show conc_a , " = ", conc_r]
    putStrLn $ concat ["selections " , show sel_a1, " ", show sel_a2
                        , " = ", show sel_res]
    putStrLn $ concat ["rev_bin_rep ", show rbr_a, " = " , rbr_res]
    where rbr_a = 3
          rbr_res = show $ rev_bin_rep rbr_a
          kp_a = 3
          kp_res = k_ary_patterns kp_a
          sel_a1 = [0, 1, 3]
          sel_a2 = [(0, 0), (1, 1), (2, 4 ), (3, 9)]
          sel_res = selections sel_a1 sel_a2
          conc_a = [[[0, 1]], [[2], [3]], [[4, 5]]]
          conc_r = show $ concatenations conc_a
