{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use camelCase" #-}
module Test where

f1 :: Int -> Bool
f1 a =
    if a == 1 then True
    else if a == 2 then True
    else if a == 3 then True
    else if a == 5 then True
    else False

f2 :: Int -> Bool
f2 a
  | a == 1 = True
  | a == 2 = True
  | a == 3 = True
  | a == 5 = True
  | otherwise = False

f3 :: Int -> Bool
f3 a = False
f3 1 = True
f3 2 = True
f3 3 = True
f3 5 = True

g1 :: Int -> Bool
g1 a = not (f1 a)

g2 :: Int -> Bool
g2 = \a -> not (f1 a)

predicates = [f1,f2,f3,g1,g2]

get_predicate :: Int -> (Int -> Bool)
get_predicate i = predicates!!i

get_and_apply :: Int -> Int -> (Int -> Bool)
get_and_apply i v = predicates!!i 



main = do
    print (f1 1)
