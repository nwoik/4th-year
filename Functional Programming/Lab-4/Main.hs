{-
- Name: David Nwokoye
- Number: 119380051
- Assignment: 04
-}

module Main where

{- Task 1

-}

data BST = Null | Node Int (BST) (BST) deriving (Show)


{- Task 2

-}

create :: BST
create = Null


{- Task 3

-}

pretty_print :: BST -> [Int]
pretty_print (Node a l r)
  | r /= Null = pretty_print r
  | l /= Null = pretty_print l
  | otherwise = (a:[])




{- Task 5

-}

contains :: BST -> Int -> Bool
contains (Node a' t1 t2) a
    | compare a' a == EQ = True
    | compare a' a == GT = contains t1 a
    | compare a' a == LT = contains t2 a


{- Task 6

-}


insert :: BST -> Int -> BST
insert Null a = Node a Null Null
insert (Node a' left right) a
    | compare a' a /= GT = Node a' (insert left a) right
    | otherwise = Node a' left (insert right a)


{- Task 7

-}


fromList :: Foldable t => t Int -> BST
fromList as = foldl insert Null as

main = do

    putStrLn ""
    
    print(pretty_print (fromList [3,5,1,6,4,2,0]))
