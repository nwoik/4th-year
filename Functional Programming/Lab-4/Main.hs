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


{- Task 2
create initializes an empty binary search tree with the root as null.
-}

create :: BST
create = Null


{- Task 3
pretty_print takes in a BST returns a String

The concat function is applied to every element 
in the list created from the function call make_tree applied to the bst.

There are 2 helper functions that are part of the process.
 
indent takes in a list of strings and returns a list of strings
It applies the map function to a list. 
Each element in that list has "  " concatenated to it


make_tree takes in a BST and returns a list of strings.

Base case:
make_tree Null = []

If Null is passed in, then make_tree outputs an empty list.
If a Node is passed in, then it returns 
indent applied to a recursive call of make_tree applied to the leftchild,
concatenated to a list containing show applied to the root and a newline,
concatenated to indent applied to a recursive call of 
make_tree applied to the rightchild.  

This creates a list of string elements of the tree. 
-}

pretty_print :: BST -> String
pretty_print bst = concat $ (make_tree bst)

indent :: [String] -> [String]
indent = map ("  "++)

make_tree :: BST -> [String]
make_tree Null = []
make_tree (Node root leftchild rightchild)
         = indent (make_tree leftchild) ++
         ([show root, "\n"]) ++
         indent (make_tree rightchild)


{- Task 4

-}

-- pretty_print' :: BST -> String
-- pretty_print' bst = show bst


{- Task 5
contains takes in a BST, Int and returns a Bool.

Base case:
contains Null a = False

If compare applied to the root and a is EQ, then it returns True.
If it's GT, then a recursive call of contains is applied 
to the leftchild and a.
If it's LT then the recursive call of contains is applied 
to the rightchild and a.

This continues until either compare root a returns EQ, making it True,
or the base case is reached making it False.
-}

contains :: BST -> Int -> Bool
contains Null a = False
contains (Node root leftchild rightchild) a
    | compare root a == EQ = True
    | compare root a == GT = contains leftchild a
    | compare root a == LT = contains rightchild a


{- Task 6
insert takes in a BST, an int and returns a BST.

Base case: 
insert Null a = Node a Null Null

If it's a Null node passed in, then a new node is created with the integer
a as it's root and 2 Null children. 
If it's a node with a root and children,
compare is applied to the root and int a.
If it isn't greater than, the left child of node is defined as a
recursive call of insert applied to the left child and int a.
Otherwise, the right child of node is defined as a
recursive call of insert applied to the right child and int a.

This carries on until the base case is reached
-}


insert :: BST -> Int -> BST
insert Null a = Node a Null Null
insert (Node root left right) a
    | compare root a /= GT = Node root (insert left a) right
    | otherwise = Node root left (insert right a)


{- Task 7
from_list takes in a list of ints and returns a BST.

foldl is applied to the insert function (b -> a -> b),
the BST Null and the list of ints.
The function insert is applied to the empty BST and every element of as. 
((Null `insert` a1) `insert` a2) `insert` an

This creates the BST tree.
[[0,1,2], [0,2,1], [1,0,2], [1,2,0], [2,1,0], [2,0,1]]
-}


from_list :: [Int] -> BST
from_list as = foldl insert Null as


{-Task 8


-}

main :: IO ()
main = do
    let bst1 = from_list [0,1,2]
    let bst2 = from_list [0,2,1]
    let bst3 = from_list [1,0,2]
    let bst4 = from_list [1,2,0]
    let bst5 = from_list [2,1,0]
    let bst6 = from_list [2,0,1]

    putStr (pretty_print bst1)
    putStr "\n"
    putStr (pretty_print bst2)
    putStr "\n"
    putStr (pretty_print bst3)
    putStr "\n"
    putStr (pretty_print bst4)
    putStr "\n"
    putStr (pretty_print bst5)
    putStr "\n"
    putStr (pretty_print bst6)


