module Demo1_6 where
	
roots :: Double -> Double -> Double 
           -> (Double, Double)
		   
roots a b c = 
	(
	  (-b - sqrt (b ^ 2 - 4 * a * c) ) / (2 * a)
	,
	  (-b + sqrt (b ^ 2 - 4 * a * c) ) / (2 * a)
	)
	
roots' a b c = 
	let d = sqrt (b ^ 2 - 4 * a * c) in
	(
	  (-b - d ) / (2 * a)
	,
	  (-b + d ) / (2 * a)
	)	
	
roots'' a b c = 
	let {d = sqrt (b ^ 2 - 4 * a * c); x1 = (-b - d ) / (2 * a); x2 = (-b + d ) / (2 * a)}
	in (x1, x2)	
	
-- отступ у всех локальных связываний должен быть один и тот же	
roots''' a b c = 
	let 
	  x1 = (-b - d ) / aTwice
	  x2 = (-b + d ) / aTwice
	  d = sqrt $ b ^ 2 - 4 * a * c
	  aTwice = 2 * a
	in (x1, x2)	
	
  
factorial6 n 
    | n >= 0 = let
        helper acc 0 = acc
        helper acc n = helper (acc * n) (n - 1)
	  in helper 1 n
    | otherwise = error "arg must be >= 0"
    
	
rootsDiff a b c = let
  (x1, x2) = roots a b c
  in x2 - x1
  
  
  
-- a[k] = a[k-1] + a[k-2] - 2*a[k-3]  
 
seqA n = 
  let
    helper :: Integer -> (Integer, Integer, Integer)
    helper 0 = (1, 0, 0)
    helper 1 = (2, 1, 0)
    helper 2 = (3, 2, 1)
    helper n = let (ak1, ak2, ak3) = helper (n - 1)
               in (ak1 + ak2 - 2 * ak3, ak1, ak2)
    (x1, x2, x3) = helper n
  in
    x1
	
	
	
roots4 a b c = (x1, x2)
	where 
	  x1 = (-b - d ) / aTwice
	  x2 = (-b + d ) / aTwice
	  d = sqrt $ b ^ 2 - 4 * a * c
	  aTwice = 2 * a
	
factorial7 :: Integer -> Integer
factorial7 n 
    | n >= 0 = helper 1 n
    | otherwise = error "arg must be >= 0"
  where
    helper acc 0 = acc
    helper acc n = helper (acc * n) (n - 1)
	

sum'n'count :: Integer -> (Integer, Integer)
sum'n'count n 
  | n > 0 = helper 0 0 n
  | n == 0 = (0, 1)
  | otherwise = helper 0 0 (-n)
  where
    helper sum count 0 = (sum, count)
    helper sum count n = helper (sum + (n `mod` 10)) (count + 1) (n `div` 10)
	
  
  
integration :: (Double -> Double) -> Double -> Double -> Double
integration f a b 
  | a < b = integral f a b
  | otherwise =  - integral f b a
  where
    integral f x1 x2 = dx * ( (f x1 + f x2) / 2 + sumIntervals (x2 - dx) 1000 )
      where 
        dx = abs (b - a) / 1000
        sumIntervals x n
          | n == 1 = 0
          | otherwise = f x + sumIntervals (x - dx) (n - 1)
  
	
	
	
	
	
	
	
			 
