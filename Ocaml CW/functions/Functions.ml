
(* implement the function *)
let curry : (('a * 'b) -> 'c) -> 'a -> 'b -> 'c  =  
   (*Currying is the process of translating a function that takes multiple arguments into a sequence of functions each with a single argument *)
   (* The name is a reference to logician Haskell Curry *)
   fun f x y -> f(x,y);;

(* implement the function *)
let uncurry : ('a -> 'b -> 'c) -> ('a * 'b) -> 'c =
   (*Uncurry takes a function of 2 inputs and changes it into a function of 1 argument where that arguement is a tuple of the original 2 arguements*)
   fun f(x,y) -> f x y;;
