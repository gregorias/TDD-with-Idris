import Data.Vect

empties : Vect n (Vect 0 a)
empties = replicate _ []

emptiesImplicit : Vect n (Vect 0 a)
emptiesImplicit {n} = replicate n []
