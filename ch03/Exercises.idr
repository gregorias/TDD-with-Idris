import Data.Vect

total myMap : (a -> b) -> Vect k a -> Vect k b
myMap f [] = []
myMap f (x :: xs) = f x :: myMap f xs

total myLength : List a -> Nat
myLength [] = 0
myLength (x :: xs) = 1 + myLength xs

createEmpties : Vect n (Vect 0 e)
createEmpties = replicate _ []

transposeMat : Vect m (Vect n e) -> Vect n (Vect m e)
transposeMat [] = createEmpties
transposeMat (x :: xs) = zipWith (\e, v => e :: v) x (transposeMat xs)

scalar : (xs : Vect n Integer) -> (ys : Vect n Integer) -> Integer
scalar [] [] = 0
scalar (x :: xs) (y :: ys) = x * y + scalar xs ys

multiplyRowMat : Vect n Integer -> Vect n (Vect m Integer) -> Vect m Integer
multiplyRowMat xs ys = map (scalar xs) (transposeMat ys)

multiplyMat : Vect n (Vect m Integer) -> Vect m (Vect k Integer) -> Vect n (Vect k Integer)
multiplyMat xs ys = map (\row => multiplyRowMat row ys) xs

multiplyMatTest : Vect 2 (Vect 1 Integer)
multiplyMatTest = multiplyMat [[1,2], [3,4]] [[1], [2]]
