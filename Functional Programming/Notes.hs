module Notes where

data Op = Add | Sub | Mul | Div 

instance Show Op where
    show Add = "+"
    show Sub = "-"
    show Mul = "*"
    show Div = "/"

valid :: Op -> Int -> Int -> Bool 
valid Div _ 0 = False
valid Sub a b = a >= b
valid _ _ _ = True 

apply :: Op -> Int -> Int -> Int 
apply Add a b = a + b
apply Sub a b = a - b
apply Mul a b = a * b
apply Div a b = a / b

data Expr = Val Int | Expr Op Expr Expr

instance Show Expr where
    show (Val a) = show a
    show (apply op a b) = "(" ++ show a ++ show op ++ show b ++ ")"

values :: Expr -> [Int]
values (Val a) = [a]
values (apply _ a b) = values a ++ values b 

eval :: Expr -> [Int]
eval (Val a) = [a]
eval (apply op a b) = Val a ++ Val b 

solution :: Expr -> [Int] -> Int -> Bool
solution expr as a = values expr `elem` as && eval expr == [a]

split :: [a] -> ([a], [a])
split [] = []
split [_] = []
split (a:as) = ([a], as):[(a:ls,rs) | (ls, rs) <- split as] 

combine :: Expr -> Expr -> [Expr]
combine l r = [App op l r | op <- ops]
    where ops = [Add, Sub, Mul, Div]

exprs :: [Int] -> [Expr]
exprs [] = []
exprs [a] = [Val a]
exprs as = [e | (ls, rs) <- split as, e <- combine l r, l <- exprs ls, r <- exprs rs]

solutions :: [Int] -> Int -> [Expr]
solutions as a = [e | cs <- choices as, e <- exprs cs, eval e == [a]]
