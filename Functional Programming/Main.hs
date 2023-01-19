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


-- class (Num a) => Movable a where
--     forward :: a -> a 
--     backward :: a -> a
--     step_size :: Int

--     step_size = 2
--     forward a = a + step_size



    
pyths :: Int -> [(Int, Int, Int)]
pyths n = [(x,y,z) | x <- ns, y <- ns, z <- ns, x*x + y*y == z*z]
    where ns = [1..n]

main = do
    print(decide [voter, voter', voter] 3)
