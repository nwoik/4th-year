{-
- Name: David Nwokoye
- Number: 119380051
- Assignment: 01
-}

module Main where

-- Task 1
f1 :: Int -> Bool
f1 a =
    if a == 1 then True
    else if a == 2 then True
    else if a == 3 then True
    else if a == 5 then True
    else False

-- Task 2
f2 :: Int -> Bool
f2 a
  | a == 1 = True
  | a == 2 = True
  | a == 3 = True
  | a == 5 = True
  | otherwise = False

-- Task 3
f3 :: Int -> Bool
f3 a = False
f3 1 = True
f3 2 = True
f3 3 = True
f3 5 = True

-- Task 4
g1 :: Int -> Bool
g1 a = not (f1 a)

-- Task 5
g2 :: Int -> Bool
g2 = \a -> not (f1 a)

-- Task 6
predicates = [f1,f2,f3,g1,g2]

-- Task 7
get_predicate :: Int -> (Int -> Bool)
get_predicate i = predicates!!i

-- Task 8
get_and_apply :: Int -> Int -> Bool
get_and_apply i v = get_predicate i v

-- Task 9
apply_to_all :: Int -> [Int -> Bool]
apply_to_all a = fs
  where fs = [f | f <- predicates, get_and_apply 5 a]

main = do
    print (f1 1)
