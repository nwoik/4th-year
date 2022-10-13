{-
- Name: David Nwokoye
- Number: 119380051
- Assignment: 02
-}

module Main where

rev_bin_rep :: Int -> [Int]
rev_bin_rep 0 = [0]
rev_bin_rep 1 = [1]
rev_bin_rep i = reverse (i `mod` 2: rev_bin_rep (i `div` 2))


selections :: [Int] -> [(Int, Int)] -> [Int]
selections [] [] = []
selections [] (t:ts) = []
selections (i:is) [] = []
selections (i:is) (t:ts) = if fst t == i then (snd t : selections is ts)
    else selections (i:is) ts


concatenations :: [[[a]]] -> [[a]]
concatenations [] = []
concatenations [as] = as
concatenations ((b:bs):as) = [ x ++ z | x <- (b:bs), 
        z <- concatenations [y | y <- as]]




main = do
    print()
