import Data.Fin
import Data.Vect

vectTake : (k : Fin (S n)) -> Vect n a -> Vect (finToNat k) a
vectTake FZ (x :: xs) = []
vectTake (FS k) (x :: xs) = x :: vectTake k xs

sumEntries : (Num a) => (pos : Integer) -> Vect n a -> Vect n a -> Maybe a
sumEntries idx xs ys = do
  finIdx <- integerToFin idx
  pure (index finIdx xs + index finIdx ys)

