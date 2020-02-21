type church_numeral = (int -> int) -> int -> int ;;

(* i2c recursively applies a function f to a parameter x n times *)
let rec i2c : int -> church_numeral = fun i f x -> 
  match i with 
    0 -> x (* If 'i' = 0 then return x *)
  | i -> f (i2c (i-1) f x) ;; (* recursivly calling the function '12c', applying f to x , i-1 number of times    *)


(* passes the incrementing function and 0 into the Church numeral, so
   every application of f increases the output by 1. Since it starts
   at 0, this just returns the amount of times f was applied to x,
   thus telling us which Church numeral it was. *)
let c2i : church_numeral -> int = 
  fun i -> i (fun x -> x+1) 0 ;; (* Passes the function and 0 in, it increments by 1 with each application of f. *)

