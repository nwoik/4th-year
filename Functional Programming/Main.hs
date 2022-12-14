module Main where

odd_pairs :: [Int] -> [(Int,Int)]
odd_pairs is = [(i,j) | i <- is, odd i, j <- is, odd j]

tails :: [a] -> [[a]]
tails [] = [[]]
tails as = (as:tails(tail(reverse as)))

replicate1 :: Int -> e -> [e]
replicate1 n e = take n $ repeat e

forget :: (a -> b -> a) -> String
forget con = "forget"

cont :: a -> b -> a
cont a b = a

voter :: Int -> Bool
voter n | n == 3 = True
        | otherwise = False

voter' :: Int -> Bool
voter' n | n == 4 = True | otherwise = False

decide :: [Int -> Bool] -> Int -> Bool
decide vs i = compare (length ts) (length fs) == GT
    where ts = filter prd vs
          prd v' = v' i == True
          fs = filter prd2 vs
          prd2 v' = v' i == False


class (Num a) => Movable a where
    forward :: Int -> a
    backward :: Int -> a
    step_size :: Int

    forward n a = sum n a
    forward n a = product n a

    


main = do
    print(decide [voter, voter', voter] 3)
