{-
- Name: David Nwokoye
- Number: 119380051
- Assignment: 02
-}

module Main where


{- Task 

-}

select :: (a -> a -> Ordering) -> a -> [a] -> [a]
select f a [] = []
select f a (a':as) = foldl f a (a':as)
    where foldl f a [] = []
          foldl f a (a':as) = if f a a' == GT then (a:foldl f a as) 
                              else if f a a' == EQ then (a:foldl f a as)
                              else (a':foldl f a as) 


compare_with_tie_breaker :: (a -> a -> Ordering) -> (a -> a -> Ordering) -> (a -> a -> Ordering)
compare_with_tie_breaker compare'' compare' a' a = EQ


{- Task 5

-}

select_equivalents :: Int -> [Int] -> [Int]
select_equivalents a [] = []
select_equivalents i (a:as) = if odd i then filter odd (select compare 1 (a:as))
                            else filter even (select compare 2 (a:as))


main :: IO ()
main = do
    print()