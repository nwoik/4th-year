module Example where 
import Data.Char (ord, chr)

letter_to_int :: Char -> Int 
letter_to_int c = ord c - ord 'a'


int_to_letter :: Int -> Char 
int_to_letter i = chr (i + ord 'a')

shift :: Int -> Char -> Char
shift i c = chr $ ((ord c - ord 'a') + i) `mod` 26

encode :: Int -> String -> String
encode n = map (shift n) 

percentage :: Int -> Int -> Float
percentage m n = (fromIntegral m / fromIntegral n) * 100

count :: Char -> String -> Int
count c cs = length [c' | c' <- cs, c' == c]
count c cs = length (filter prd cs)
    where prd c' = c' == c

main = do
    print()