AdderType : (n : Nat) -> Type
AdderType Z = Integer
AdderType (S k) = Integer -> AdderType k

adder : (n : Nat) -> (acc : Integer) -> AdderType n
adder Z acc = acc
adder (S k) acc = \b => adder k (acc + b)
