
(* type declaration for intseq *)

type intseq = int list;;

(* implementations *)

(* function that adds two sequences from head to tail, summing at each
   position. *)
let rec seqadd : intseq -> intseq -> intseq =
  fun xs ys -> match xs, ys with (*Pattern matching*)
  (*If you add a sequence to an empty sequnce then it should return empty*)
  | [], _ -> []
  | _, []  -> []
  (*from head to tail of both list*) (*adding the first list from head to tail, then recursivly adding the second list from head to tail*)
  | hd1 :: tl1 , hd2 :: tl2 -> (hd1 + hd2) :: (seqadd tl1 tl2) ;;

  
(* function that multiplies two lists from head to tail, multiplying
   at each position *)
let rec seqmult : intseq -> intseq -> intseq =
  fun xs ys ->
  match xs, ys with (*Pattern matching*)
  (*If you add a sequnce to an ampty sequnce then it should return empty*)
  | [], _ -> []
  | _, [] -> []
  (*from head to tail of both list*) (*multiply the first list from head to tail, then recursivly multiply the second list from head to tail*)
  | hd1 :: tl1 , hd2 :: tl2 -> (hd1 * hd2) :: (seqmult tl1 tl2) ;;
