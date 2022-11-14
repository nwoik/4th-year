{-
- Name: David Nwokoye
- Number: 119380051
- Assignment: 04
-}

module Main where


{- Task 1
The Binary Search Tree (BST) can be null
or be a node made up of the root which is an int, 
the left child and right child.
Both of the children are BSTs that can be null or it's own sub tree.
-}

data BST = Null | Node {root::Int,
                        leftchild::BST,
                        rightchild::BST}
                        deriving (Show)


{- Task 2
create initializes an empty binary search tree with the root as null.
-}

create :: BST
create = Null


{- Task 3

-}

indent :: [String] -> [String]
indent = map ("  "++)

pretty_print :: BST -> String
pretty_print bst = concat $ (make_tree bst)

make_tree :: BST -> [String]
make_tree Null = []
make_tree (Node root leftchild rightchild)
         = indent (make_tree leftchild) ++ ([show root] ++ ["\n"]) ++ indent (make_tree rightchild)


{- Task 4

-}




{- Task 5

-}

contains :: BST -> Int -> Bool
contains (Node a' leftchild rightchild) a
    | a' == a = True
    | a' > a = contains leftchild a
    | a' < a = contains rightchild a


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

    putStr (pretty_print (fromList [3,5,1,6,4,2,0]))
