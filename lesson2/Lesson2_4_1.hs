--расширение классов типов (class extension)
module Demo2_4 where
  
import Prelude hiding (Eq, (==), (/=), Ord, compare, (<), (>=), (>), (<=), max, min)

class Eq a where
  (==), (/=) :: a -> a -> Bool
  x /= y = not (x == y)
  x == y = not (x /= y)
  
--класс типов Ord расширяет класс типов Eq
class (Eq a) =>  Ord a where
  (<), (<=), (>=), (>) :: a -> a -> Bool
  max, min :: a -> a -> a
  compare :: a -> a -> Ordering
{-Minimal complete definition: either compare or <= -}

--множественное наследование
--class (Eq a, Printable a) => MyClass a where
--  ...

--class A a where
-- foo :: a -> a
--class (A a) => B a where
-- bar :: a -> a
--Можно сделать экземпляром класса B только тип, который уже является экземпляром класса A. Можно вызывать функции интерфейса A с экземплярами класса B.
