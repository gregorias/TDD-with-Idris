-- An experiment: does `fromList` (`List -> Vect`) work for a dynamically created list?
module Main

import Data.Vect
import Data.String

total myId : Vect k a -> Vect k a
myId xs = xs

readInteger : IO Integer
readInteger = do
  stringLine <- getLine
  case parseInteger stringLine of
       Nothing => pure 0
       Just i => pure i

readElementCount : IO Nat
readElementCount = fromInteger <$> readInteger

readList : (count : Nat) -> IO (List Integer)
readList Z = pure []
readList (S k) = do
  i <- readInteger
  is <- readList k
  pure (i :: is)

main : IO ()
main = do
  elementCount <- readElementCount
  userList <- readList elementCount
  putStrLn "You have provided: "
  (putStrLn . show . myId) (fromList userList)
