{-
- Name: David Nwokoye
- Number: 119380051
- Assignment: 05
-}
{-# LANGUAGE InstanceSigs #-}

module Main where


{- Task 1

-}

class (Show a) => Printable a where
    print_it, println_it :: a -> IO ()

    print_it a = print a
    println_it a = putStr (show a ++ "\n")

instance Printable Int where
    print_it a = print a
    println_it a = putStr (show a ++ "\n")


{- Task 2

-}

instance Printable Bool where
    print_it a = print a
    println_it a = putStr (show a ++ "\n")


{- Task 3 

-}

data UnaryFunction a b = UnaryFunction {name :: String,
                                        definition :: a -> b}


{- Task 4

-}

instance (Bounded a, Enum a, Show a, Show b)=> Show (UnaryFunction a b) where
-- instance (Bounded definition, Enum definition, Show definition)=> Show (UnaryFunction name definition) where
    show (UnaryFunction name definition) = name ++ " { " ++ show False ++ " -> " ++ show True ++ " : " ++ show True ++ " -> " ++ show False ++ " }"


{- Task 5

-}

-- instance (Bounded definition, Enum definition, Show definition) => Printable (UnaryFunction name definition) where
instance (Bounded a, Enum a, Show a, Show b)=> Printable (UnaryFunction a b) where
    print_it :: UnaryFunction a b -> IO ()
    print_it (UnaryFunction a b) = print (" { " ++ show False ++ " -> " ++ show True ++ " : " ++ show True ++ " -> " ++ show False ++ " }")
    println_it :: UnaryFunction a b -> IO ()
    println_it (UnaryFunction a b) = print (" { " ++ show False ++ " -> " ++ show True ++ " : " ++ show True ++ " -> " ++ show False ++ " }\n")


{- Task 6

-}

main = do
    print_it (UnaryFunction "deez nuts" not)