module Demo2_4_5 where
  
--класс типов Num и его расширения
--представителями Num являются все числа

{-
class Num a where
  (+), (-), (*) :: a -> a -> a
  negate :: a -> a
  abs :: a -> a
  signum :: a -> a
  fromInteger :: Integer -> a
  
  x - y = x + negate y
  negate x = 0 - x
-}
  
--есть некоторый закон для Num (и вообще для других классов типов)
--компилятор эти законеы не может проверять, но чтобы класс типов можно было использовать и полагаться на каике-то его св-ва, выполнение этих законов требуется от программиста

{-
LAW     abs x * signum x == x
-}

--(/) не определено в классе Num, т.к. деление целых чисел и чисел с плавающей точкой реализовано по-разному
--У Num есть 2 расширения (наследника): Integral (целочисл. деление) и Fractional(деление чисел с плав. точкой)

--Intergal - не прямой наследник
{- 
class (Real a, Enum a) => Integral a where
  quot :: a -> a -> a
  rem :: a -> a -> a
  div :: a -> a -> a
  mod :: a -> a -> a
  quotRem :: a -> a -> (a, a)
  divMod :: a -> a -> (a, a)
  toInteger :: a -> Integer
  	-- Defined in ‘GHC.Real’
instance Integral Integer -- Defined in ‘GHC.Real’
instance Integral Int -- Defined in ‘GHC.Real’
-}
--целочисленное деление на отриц. числах может быть определено двумя способами:
--div mod - стандартное целочисленное деление
--quot rem - работают слегка эффективнее, но результат по знаку отличается от div mod
--стандартные представители: Integer и Int


--Fractional
{-
class Num a => Fractional a where
  (/) :: a -> a -> a
  recip :: a -> a
  fromRational :: Rational -> a
  	-- Defined in ‘GHC.Real’
instance Fractional Float -- Defined in ‘GHC.Float’
instance Fractional Double -- Defined in ‘GHC.Float’
-}


--стандартные математич. ф-ции определены в Floating
{-
class Fractional a => Floating a where
  pi :: a
  exp :: a -> a
  sqrt :: a -> a
  log :: a -> a
  (**) :: a -> a -> a
  logBase :: a -> a -> a
  sin :: a -> a
  tan :: a -> a
  cos :: a -> a
  asin :: a -> a
  atan :: a -> a
  acos :: a -> a
  sinh :: a -> a
  tanh :: a -> a
  cosh :: a -> a
  asinh :: a -> a
  atanh :: a -> a
  acosh :: a -> a
  	-- Defined in ‘GHC.Float’
instance Floating Float -- Defined in ‘GHC.Float’
instance Floating Double -- Defined in ‘GHC.Float’
-}


--ф-ции связанные с округлением
{-
class (Real a, Fractional a) => RealFrac a where
  properFraction :: Integral b => a -> (b, a)
  truncate :: Integral b => a -> b
  round :: Integral b => a -> b
  ceiling :: Integral b => a -> b
  floor :: Integral b => a -> b
  	-- Defined in ‘GHC.Real’
instance RealFrac Float -- Defined in ‘GHC.Float’
instance RealFrac Double -- Defined in ‘GHC.Float’
-}


--внутреннее представление чисел с плавающей точкой
{-
class (RealFrac a, Floating a) => RealFloat a where
  floatRadix :: a -> Integer
  floatDigits :: a -> Int
  floatRange :: a -> (Int, Int)
  decodeFloat :: a -> (Integer, Int)
  encodeFloat :: Integer -> Int -> a
  exponent :: a -> Int
  significand :: a -> a
  scaleFloat :: Int -> a -> a
  isNaN :: a -> Bool
  isInfinite :: a -> Bool
  isDenormalized :: a -> Bool
  isNegativeZero :: a -> Bool
  isIEEE :: a -> Bool
  atan2 :: a -> a -> a
  	-- Defined in ‘GHC.Float’
instance RealFloat Float -- Defined in ‘GHC.Float’
instance RealFloat Double -- Defined in ‘GHC.Float’
-}

----------

--Напишите функцию с сигнатурой:
--avg :: Int -> Int -> Int -> Double
--вычисляющую среднее значение переданных в нее аргументов:
--GHCi> avg 3 4 8
--5.0

avg :: Int -> Int -> Int -> Double
avg x y z = ((fromIntegral x :: Double) + (fromIntegral y :: Double) + (fromIntegral z :: Double)) / 3.0
