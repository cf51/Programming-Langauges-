
(* declaration of types intseq and intmatrix *)

type intseq = int list;; (* list *)

type intmatrix = IM of intseq list;; (* List of rows *)

(* useful for debugging *)
let string_of_row row =
  String.concat ""
    (List.map (fun x -> string_of_int x ^ " ") row);;

(* useful for debugging *)
let rec string_of_matrix m =
  match m with
          [] -> ""
      | [[]] -> ""
      | (row::rest) ->
         string_of_row row ^ "\n" 
         ^ string_of_matrix rest;;

(* function getbody to retrieve the body of the intmatrix which is of type intseq list *)
let getbody (IM x) = x;;

(* This helper function counts the number of rows in a matrix *)
let rec row: intseq -> int =
  fun x-> match x with 
  [] -> 0 (* If the row is empty it returns 0 *)
  | hd :: tl -> 1 + row (tl);; (*concatinating the head and tail together, adding 1 for the head, passing tail through the row *)
                               (* This adds 1 for the head, counts the tail, and recurisvly continues until it is all counted and the matrix returns empty *)
                               
                               
(* This helper function counts the number of columns in a matrix *)
let rec column: intmatrix-> int =
  fun x -> match x with 
  IM([]) -> 0 
  | IM(hd :: tl) -> 1 + column(IM(tl));; 


(* test whether a list of lists of integers represents a matrix. 
   The length of each row should be equal.*)
   let rec ismatrix: intmatrix -> bool = 
   fun x -> match x with 
   IM ([]) -> true   (*asserting that an empty matrix is true*)
  | IM (hd :: []) -> true 
  | IM (hd :: next :: tl) ->  (* Concatinating the head, the next row and the tail *)
   if row(hd) == row(next)     (* If the head and the next row are of equal size *)
      then ismatrix(IM(next :: tl))  (* then recursivly move to the next row until you reach the tail, checking that they are equal *)
   else false                        (* Checking that the first is equal to the next then the next is equal to the next until you reach the tail *)
      ;;                             (* This solves the problem of a [[2;3]] [3;4] [3;4;5]] looking the equal as you compare each row to the previous, checking they are all the same size *)



(* function matrixshape takes the matrix, and calculates the number of
   columns and rows *)
let matrixshape: intmatrix -> (int * int) =
  fun x -> match x with 
  IM ([]) -> (0,0) (* If the matrix is empty then the number of rows is 0 and number of columnms is 0 *)    
  | IM([[]]) -> (0,1)    (* 1 row and 0 columns *)
  | IM(hd :: []) -> (1,1) (* 1 row and 1 column *)
  | IM(hd :: tl) -> (row(hd), column(IM(hd :: tl)))  (* Moving from the head to the tail of the matrix, joining the head and tail and passing them through columns so it can count them *)
  ;;                                                 (* passing head through the row, as the colums counts the other ones  *)                                                                                 

let rec seqadd : intseq -> intseq -> intseq =
  fun xs ys -> match xs, ys with (*Pattern matching*)
  (*If you add a sequence to an empty sequnce then it should return empty*)
  | [], _ -> []
  | _, []  -> []
  (*from head to tail of both list*) (*adding the first list from head to tail, then recursivly adding the second list from head to tail*)
  | hd1 :: tl1 , hd2 :: tl2 -> (hd1 + hd2) :: (seqadd tl1 tl2) ;;

  (* Helper function to change the types, from a list to a list of lists *)
  let rec change : intseq list -> intseq list -> intseq list =
    fun xs ys -> match xs, ys with (*Pattern matching*)
    (*If you add a sequence to an empty sequnce then it should return empty*)
    | [], _ -> []
    | _, []  -> []
    (*from head to tail of both list*) (*adding the first list from head to tail, then recursivly adding the second list from head to tail*)
    | hd1 :: tl1 , hd2 :: tl2 -> (seqadd hd1 hd2) :: (change tl1 tl2) ;;

(* matrix addition *)
let matrixadd : intmatrix -> intmatrix -> intmatrix =
  fun xs ys -> match xs, ys with 
  IM([]), IM([]) -> IM([]) (* If both matrices are empty then return an empty matrix *)
| IM(x :: xs), IM(y :: ys) -> IM((seqadd x y) :: (change xs ys)) (* Joins the head and rest of the first matrix, and does the same to the other matrix *)
;;                              (* adds the two heads of the matrixs together, change recursively calls the seqadd on the rest of the two matrices *)


(* matrix multiplication *)
let matrixmult x y =
  failwith "not implemented yet" ;;


             
