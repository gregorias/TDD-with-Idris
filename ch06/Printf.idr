data Format = Number Format
            | Str Format
            | Lit String Format
            | End

PrintfType : Format -> Type
PrintfType (Number x) = Integer -> PrintfType x
PrintfType (Str x) = String -> PrintfType x
PrintfType (Lit x y) = PrintfType y
PrintfType End = String

printf' : (fmt : Format) -> (acc : String) -> PrintfType fmt
printf' (Number x) acc = \num => printf' x (acc ++ show num)
printf' (Str x) acc = \str => printf' x (acc ++ str)
printf' (Lit x y) acc = printf' y (acc ++ x)
printf' End acc = acc

printf : (fmt : Format) -> PrintfType fmt
printf fmt = printf' fmt ""
