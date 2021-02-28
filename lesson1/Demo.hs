module Demo where
	
import Data.Char	
	
infixl 6 *+*

(*+*) a b = a ^ 2 + b ^ 2

x |-| y = if x > y then x - y else y - x

twoDigits2Int :: Char -> Char -> Int
twoDigits2Int a b = if isDigit a && isDigit b then digitToInt a * 10 + digitToInt b else 100

dist :: (Double, Double) -> (Double, Double) -> Double
dist p1 p2 = sqrt $ (fst p1 - fst p2) ^ 2 + (snd p1 - snd p2) ^ 2

factorial n = if n == 0 then 1 else n * factorial (n - 1)

factorial' 0 = 1
factorial' n = n * factorial' (n - 1)

doubleFact :: Integer -> Integer
doubleFact 0 = 1
doubleFact 1 = 1
doubleFact n = n * doubleFact (n - 2)

factorial'' 0 = 1
factorial'' n =  if n < 0 then error "arg must be >= 0" else n * factorial'' (n - 1)

factorial''' 0 = 1
factorial''' n | n < 0 = error "arg must be >= 0"
               | n > 0 = n * factorial''' (n - 1)
			   
factorial4 :: Integer -> Integer
factorial4 n | n == 0 = 1
             | n > 0 = n * factorial4 (n - 1)
			 | otherwise = error "arg must be >= 0"
			 
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci (-1) = 1
fibonacci (-2) = -1
fibonacci n | n > 0 = fibonacci (n - 1) + fibonacci (n - 2)
            | n < 0 = fibonacci (n + 2) - fibonacci (n + 1)
			
			
factorial5 n | n >= 0 = helper 1 n
             | otherwise = error "arg must be >= 0"
			 
helper acc 0 = acc
helper acc n = helper (acc * n) (n - 1)


			 
fibonacci2 :: Integer -> Integer
fibonacci2 0 = 0
fibonacci2 1 = 1
fibonacci2 (-1) = 1
fibonacci2 (-2) = -1
fibonacci2 n | n > 0 = helperFibPositive 0 1 n
             | n < 0 = helperFibNegative 0 1 n
			 
helperFibPositive acc1 acc2 0 = acc1
helperFibPositive acc1 acc2 n = helperFibPositive acc2 (acc2 + acc1) (n - 1)

helperFibNegative acc1 acc2 (0) = acc1
helperFibNegative acc1 acc2 n = helperFibNegative acc2 (acc1 - acc2) (n + 1)

-- acc1 acc2 res
-- 2: 0  1    1
-- 3: 1  1    2
-- 4: 1  2    3			
-- 5: 2  3    5

--0  1  5
--1  1  4
--1  2  3
--2  3  2
--3  5  1
--5  8  0

-- 0  1  -5
-- 1  -1  -4
-- -1  2  -3
-- 2  -3  -2
-- -3  5  -1
-- 5  -8  0