module Lib

import Data.Vect

allLengths : List String -> List Nat
allLengths [] = []
allLengths (word :: words) = length word :: allLengths words

insert : Ord e => (x : e) -> (xsSorted : Vect len e) -> Vect (S len) e
insert x [] = [x]
insert x (y :: xs) = if x < y then (x :: y :: xs)
  else y :: insert x xs

insSort : (Ord e) => Vect k e -> Vect k e
insSort [] = []
insSort (x :: xs) = let xsSorted = insSort xs in
                        insert x xsSorted
