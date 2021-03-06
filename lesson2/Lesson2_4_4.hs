module Demo2_4_4 where
  
{-   
class Enum a where
  succ, pred :: a -> a
  toEnum :: Int -> a
  fromEnum :: a -> Int
-}

--succ 4  ==>  5
--pred 4  ==> 3

--pred 'z'  ==> 'y'
--succ 'z'  ==> '{'

--fromEnum 'a'  ==> 97

--toEnum 97  ==> error  нужно разрешить полиморфизм при вызове
--toEnum 122 :: Int  ==> 122
--toEnum 122 :: Char  ==> 'z'



{-
class Bounded a where
  minBound, maxBound :: a
-}

--succ False  ==> True
-- succ True  ==> *** Exception: Prelude.Enum.Bool.succ: bad argument

--Bounded обычно выступает в паре с Enum

--minBound :: Bool  ==> False
--maxBound :: Bool  ==> True

--minBound :: Int  ==> -9223372036854775808   64 bit platform, на 32 битной было бы другое значение
--maxBound :: Int  ==> 9223372036854775807

--Единственный тип, который является перечислением, но не является Bounded - Integer
--maxBound :: Integer  ==> error No instance for (Bounded Integer) arising from a use of ‘maxBound’


----------

--Реализуйте класс типов
--class SafeEnum a where
--  ssucc :: a -> a
--  spred :: a -> a
--обе функции которого ведут себя как succ и pred стандартного класса Enum, однако являются тотальными, то есть 
--не останавливаются с ошибкой на наибольшем и наименьшем значениях типа-перечисления соответственно, а обеспечивают 
--циклическое поведение. Ваш класс должен быть расширением ряда классов типов стандартной библиотеки, так чтобы можно было 
--написать реализацию по умолчанию его методов, позволяющую объявлять его представителей без необходимости писать какой бы то ни было код. 
--Например, для типа Bool должно быть достаточно написать строку

--instance SafeEnum Bool
--и получить возможность вызывать
--GHCi> ssucc False
--True
--GHCi> ssucc True
--False


class (Enum a, Bounded a, Eq a) => SafeEnum a where
  ssucc :: a -> a
  ssucc x 
    | x == maxBound = minBound
    | otherwise = succ x

  spred :: a -> a
  spred x
    | x == minBound = maxBound
    | otherwise = pred x
    
--Сигнатура функции minBound :: Bounded a => a, т.е. она возвращает рез-т, но на вход ничего не требуется. (нульарные функции)
--А выражение minBound ::Bool просто определяет тип возвращаемого параметра. 
--Соответственно внутри определения класса тип возвращаемого параметра уже определен, и функции вызываются просто по имени без параметров