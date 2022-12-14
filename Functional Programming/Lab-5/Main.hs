{-
- Name: David Nwokoye
- Number: 119380051
- Assignment: 05
-}

module Main where


{- Task 1

Context show is applied to a.

print_it and println_it takes a variable a and outputs an IO class. 
It applies the function putStr to show applied to variable a.
-}

class (Show a) => Printable a where
    print_it, println_it :: a -> IO ()

    print_it a = putStr (show a)
    println_it a = putStr (show a ++ "\n")

instance Printable Int where
    print_it a = putStr (show a) 
    println_it a = putStr (show a ++ "\n")



{- Task 2
An instance where polymorphic type a is a Bool
-}

instance Printable Bool where
    print_it a = putStr (show a) 
    println_it a = putStr (show a ++ "\n")


{- Task 3 -}

data UnaryFunction a b = UnaryFunction {name :: String,
                                        definition :: a -> b}


{- Task 4

Context Bounded, Enum and Show are applied to a.
Context Show is applied to b.  

An instance where the function show is applied 
to a UnaryFunction data type where:

name is concatenated to a closing bracket,
which is concatenated to concat applied to a list comprehension,
where show is applied to variable a and concatenated to "->",
which is concatenated to show applied to 
the result of definition applied to a, for each a in a list
containing minbound to maxbound. 
Which is concatenated to a closing bracket.
-}

instance (Bounded a, Enum a, Show a, Show b) => Show (UnaryFunction a b)
    where show (UnaryFunction name definition) = name ++ " {" 
            ++ concat [show a ++ "->" ++ show (definition a) ++ ", "
            | a <- [minBound..maxBound]] ++ "}"  



{- Task 5
An instance where polymorphic type a is UnaryFunction a b,
where a amd b are polymorphic.
-}

instance (Bounded a, Enum a, Show a, Show b) => 
    Printable (UnaryFunction a b) where 
        print_it (UnaryFunction a b) = putStr (show (UnaryFunction a b))
        println_it (UnaryFunction a b) = 
            putStr (show (UnaryFunction a b) ++ "\n")


{- Task 6

-}

main = do
    print_it (UnaryFunction "UnarFunction" not)