{-
- Name: David Nwokoye
- Number: 119380051
- Assignment: 05
-}

module Main where


{- Task 1

-}

class (Show a) => Printable a where
    print_it, println_it :: a -> IO ()

    print_it a = print a
    println_it a = putStr (show a ++ "\n")


{- Task 2

-}

instance Printable Bool where
    print_it a = print a
    println_it a = putStr (show a ++ "\n")
    
    


{- Task 3 -}

data UnaryFunction a b = UnaryFunction {name :: String, 
                                        definition :: a -> b}


{- Task 4

-}




{- Task 5

-}

    
    

{- Task 6

-}

main = do
    println_it True