-- My first attempt to write a type-safe sorted vector

data SortStatus = Unknown
                | Sorted

data MyVect : SortStatus -> (k : Nat) -> (elem : Type) -> Type where
  Nil : MyVect Sorted 0 elem
  (::) : (x : elem) -> (xs : MyVect status len elem) -> MyVect Unknown (S len) elem

insert : Ord e => (x : e) -> (xsSorted : MyVect Sorted len e) -> MyVect Sorted (S len) e
insert x [] = ?hole

mySort : (Ord e) => MyVect status k e -> MyVect Sorted k e
mySort {status=Sorted} xs  = xs
mySort {status=Unknown} (x :: xs) = let xsSorted = mySort xs in insert x xsSorted

-- I can't implement ?hole compile time safely as I don't know how to create a safe
-- cons operator that returns a sorted MyVect.
-- `safeAppend` : (Ord e) => (x : e) -> ((y :: ysSorted) : MyVect Sorted len e) -> MyVect Sorted (S len) elem [x <= y]
