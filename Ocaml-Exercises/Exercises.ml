
exception NotImplementedYet

(* concatenate two strings

# concat "hello" "world" ;;
- : string = "helloworld"
 *) 
let concat : string -> string -> string =
  fun string1 string2 -> string1 ^ string2 ;;

(* turn a word into a plural by adding 's' character to the end

# pluralise "toy" ;;
- : string = "toys"
 *)
let pluralise : string -> string =
  fun string1 -> string1 ^ "s";;
(* return the first 3 characters of a word

# first_three "happy" ;;
- : string = "hap"

  Hint: you could use the String module from the OCaml
        standard library.
  https://caml.inria.fr/pub/docs/manual-ocaml/libref/String.html

  Which includes:

  sub : string -> int -> int -> string
 *)
 
let first_three : string -> string =
  fun string1 -> String.sub string1 0 3;;
  

(* returns logical opposite of a boolean

   OCaml has a built in primitive 'not'

# logical_not true ;;
- : bool = false
# logical_not false ;;
- : bool = true
 *)
let logical_not : bool -> bool =
  fun b -> not b;;

(* now implement the same function by
   pattern matching on the input boolean value
*)
let logical_not' : bool -> bool =
  fun b -> match b with
  
  true -> false 
|  false -> true ;;

(* logical AND:
     T T => T
     T F => F
     F T => F
     F F => F
 *)
let truth_table_and : bool -> bool -> bool =
  fun b1 b2 -> match b1, b2 with
  
  true, true -> true 
 | true, false -> false 
 | false, true -> false 
 | false, false -> false ;;

(* logical XOR:
     T T => F
     T F => T
     F T => T
     F F => F
 *)
let truth_table_xor : bool -> bool -> bool =
  fun b1 b2 -> match b1, b2 with 
  
  true, true -> false
 | true, false -> true
 | false, true -> false 
 | false, false -> false ;;

(* logical XNOR:
     T T => T
     T F => F
     F T => F
     F F => T
 *)
let truth_table_xnor : bool -> bool -> bool =
  fun b1 b2 -> match b1, b2 with 
  true, true -> true
 | true, false -> false
 | false, true -> false 
 | false, false -> true ;;

(* return first element in the tuple *)
let tuple_first : int * string -> int =
  fun (i,s) -> (i);;

(* return second element in the tuple *)
let tuple_second : int * string -> string =
  fun (i,s) -> (s) ;;
 
type person = Person of string * int ;;
let jon = Person ("Jon",45) ;;
let sarah = Person ("Sarah",23) ;;

(* return the age of a value of type 'person'

# age_of jon ;;
- : int = 45
 *)
let age_of : person -> int =
  fun person1 -> match person1 with
  Person (name, age) -> age ;;

(* take two values of type 'person' and return the
   person who has the old age.

# who_is_older jon sarah ;;
- : person = Person ("Jon", 45)

  hint: use the 'age_of' function
 *)
let who_is_older : person -> person -> person =
  fun person1 person2 -> 
  if age_of person1 > age_of person2
   then person1
   else person2  ;;

(* return true if two input person values have the
   same age.

# same_age jon sarah ;;
- : bool = false
 *)
let same_age : person -> person -> bool =
  fun person1 person2 -> 
  if age_of person1 = age_of person2
  then true
  else false ;;

(* add two integers together

# add_int 2 4 ;;
- : int = 6
 *)
let add_int : int -> int -> int =
  fun i j -> i + j ;;

(* add two floats together

# add_float 2.3 2.1 ;;
- : float = 4.4
 *)
let add_float : float -> float -> float =
  fun i j -> i +. j ;;

(* output the double of the input integer

TODO: add type signature to this function
 *)
let double_int =
  fun i -> i * 2 ;;

(* returns true if the input integer is an even value *)
let is_even : int -> bool =
  fun i -> if  (i mod 2) = 0 
  then true 
  else false;;

(* return true if the input integer list contains
   any even values, return false otherwise.

# any_evens [] ;;
- : bool = false
# any_evens [1;2;3] ;;
- : bool = true
# any_evens [1;3;7] ;;
- : bool = false
 *)
let rec any_evens : int list -> bool =
  fun xs -> failwith "not yet implemented" ;;

(* Return true if the first element in the list an
   even number, return false otherwise. Also return
   false for empty input lists.

is_head_even [] ;;
- : bool = false
is_head_even [1;2] ;;
- : bool = false
is_head_even [4;5;6] ;;
- : bool = true
 *)
let is_head_even : int list -> bool =
  fun xs -> failwith "not implemented yet" ;;

(* Return true if the list has 3 or more elements.
   You're not allowed to use the List module.

# large_list [] ;;
- : bool = false
# large_list [1;1] ;;
- : bool = false
# large_list [1;1;1] ;;
- : bool = true
 *)
let large_list : 'a list -> bool =
  fun xs -> failwith "not implemented yet" ;;

(* apply a function to every element in the list *)
let rec map (f:'a -> 'b) (xs:'a list) : 'b list =
  failwith "not implemented yet" ;;

(* Filter values in the input list that satisfy the
   given predicate function, i.e. the predicate function
   returns true for that element. Return a list containing
   only the values that satisfy the predicate.

# filter is_even [1;2] ;;
- : int list = [2]
 *)
let rec filter : ('a -> bool) -> 'a list -> 'a list =
  fun f xs -> failwith "not implemented yet" ;;

(* some person examples *)

let susan = Person ("Susan",41) ;;
let paula = Person ("Paula",29) ;;
let jason = Person ("Jason",16) ;;
let bella = Person ("Bella",76) ;;
let lisa = Person ("Lisa",30) ;;

(* Return true if the input person has an age that is
   between 18 and 30 (inclusive).
 *)
let age_between_18_30 : person -> bool =
  fun p -> failwith "not implemented yet" ;;

(* Return only the persons in the 18-30 club
   (aged between 18 and 30).
   
   Use the 'filter' function you have defined above.

# club_18_30 [susan;paula;jason;bella;lisa] ;;
- : person list = [Person ("Paulo", 29); Person ("Lisa", 30)]
*)
let club_18_30 : person list -> person list =
  fun people -> failwith "not implemented yet" ;;

(* Return a tuple of integers. The first integer
   in the tuple is the number of persons less than
   40 years old, the second integer is the number
   of persons 40+ years old.

# count_40_plus [susan;paula;jason;bella;lisa] ;;
- : int * int = (3, 2)
 *)
let count_40_plus : person list -> int * int =
  fun persons -> failwith "not implemented yet" ;;

(* exception for impossible operations on lists *)
exception ListException of string

(* Return the last element in a list.
   If applied to an empty list, return the ListException
   with the exception message:
      "cannot 'last' on empty list"

# last_elem [1] ;;
- : int = 1
# last_elem [] ;;
Exception: ListException "cannot 'last' on empty list".
# last_elem [1;2;3] ;;
- : int = 3
 *)
let rec last_elem : 'a list -> 'a =
  fun xs -> failwith "not implemented yet" ;;

(* Reverse the elements of a list.

# reverse_list [1;2;3] ;;
- : int list = [3; 2; 1]
# reverse_list [] ;;
- : 'a list = []
# reverse_list ["jon";"sarah";"luke";"harry"] ;;
- : string list = ["harry"; "luke"; "sarah"; "jon"]

Hint: the infix '@' operator appends two lists e.g.
      list1 @ list2
*)
let rec reverse_list : 'a list -> 'a list =
  fun xs -> failwith "not implemented yet" ;;

(* Return true if any element is true, false otherwise.

# list_or [] ;;
- : bool = false
# list_or [false;true;false] ;;
- : bool = true
# list_or [false;false] ;;
- : bool = false
 *)
let rec list_or : bool list -> bool =
  fun xs -> failwith "not implemented yet" ;;

(* Returns true if all elements are true, false otherwise.
   Return false for empty input lists.

# list_all_true [] ;;
- : bool = false
# list_all_true [true;false;true] ;;
- : bool = false
# list_all_true [true;true;true] ;;
- : bool = true
 *)
let rec list_all_true : bool list -> bool =
  fun xs -> failwith "not implemented yet" ;;

(* Replicate a value N number of time to create a list.

# replicate_elem 1 "hello" ;;
- : string list = ["hello"]
# replicate_elem 3 "hello" ;;
- : string list = ["hello"; "hello"; "hello"]
# replicate_elem 0 "hello" ;;
- : string list = []
 *)
let rec replicate_elem : int -> 'a -> 'a list =
  fun n x -> failwith "not implemented yet" ;;

(* Return the input list up to the element that
   does not satisfy the predicate function.

# take_while (fun x -> x < 3) [1;2;3;4;1;2;3;4] ;;
- : int list = [1; 2]
# take_while (fun x -> x < 9) [1;2;3] ;;
- : int list = [1; 2; 3]
# take_while (fun x -> x < 0) [1;2;3] ;;
- : int list = []
 *)
let rec take_while : ('a -> bool) -> 'a list -> 'a list =
  fun f xs -> failwith "not implemented yet" ;;

(* Return true if the first list is a prefix of the second.
   Return true if either input list is empty.

# is_prefix_of [1;2] [1;2] ;;
- : bool = true
# is_prefix_of [1;2] [1;2;3] ;;
- : bool = true
# is_prefix_of [1;2;3] [1;2] ;;
- : bool = false
# is_prefix_of [1;2] [] ;;
- : bool = false
# is_prefix_of [] [1;2] ;;
- : bool = true
# is_prefix_of [] [] ;;
- : bool = true
 *)
let rec is_prefix_of : 'a list -> 'a list -> bool =
  fun xs ys -> failwith "not implemented yet" ;;

(* Combine two lists together elementwise. At each position
   in the lists, creating a tuple in the output list containing
   each element at that position from the two lists, as a tuple.

# zip_lists [] [] ;;
- : ('a * 'b) list = []
# zip_lists [1;2] [] ;;
- : (int * 'a) list = []
# zip_lists [true;true;false] [1;2;3] ;;
- : (bool * int) list = [(true, 1); (true, 2); (false, 3)]
 *)
let rec zip_lists : 'a list -> 'b list -> ('a * 'b) list =
  fun xs ys -> failwith "not implemented yet" ;;

(* Combine two lists together elementwise with a user defined
   function. At each position in the lists, creating a new value
   in the output list at that position from the two lists, as
   determined by the user defined function.

# zip_lists_with (fun x y -> x*y) [1;2;3] [2;2;2] ;;
- : int list = [2; 4; 6]
# zip_lists_with (fun x y -> x-y) [1;2;3] [2;2;2] ;;
- : int list = [-1; 0; 1]
# zip_lists_with (fun x y -> x*y) [1;2;3] [] ;;
- : int list = []
# zip_lists_with (fun x y -> x ^ (string_of_int y)) ["rob";"sarah"] [1;2] ;;
- : string list = ["rob1"; "sarah2"]
 *)
let rec zip_lists_with
        : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list =
  fun f xs ys -> failwith "not implemented yet" ;;

(* binary tree of integers.
    A node is either a leaf or a parent of two child trees
*)
type binary_tree =
  | Leaf of int
  | Tree of binary_tree * binary_tree ;;

(* Some binary trees. Hint: draw them, it will help with
   implementing the functions below. *)

let tree1 = Leaf 4 ;;
let tree2 = Tree (Leaf 5 , (Tree (Leaf 8, Leaf 9))) ;;
let tree3 = Tree (Leaf 5 , Leaf 6) ;;

(* Recall: you performed counting/summing binary tree nodes
           in SD3 in Java. The Ocaml implementations will
           be shorter than equivalent Java code. *) 

(* Count the number of nodes in the input binary tree.

# count_leaves tree1 ;;
- : int = 1
# count_leaves tree2 ;;
- : int = 3
# count_leaves tree3 ;;
- : int = 2
 *)
let rec count_leaves : binary_tree -> int =
  fun tree -> failwith "not implemented yet" ;;

(* Sum the integer values of all nodes in the input binary tree.

# sum_leaves tree1 ;;
- : int = 4
# sum_leaves tree2 ;;
- : int = 22
# sum_leaves tree3 ;;
- : int = 11
 *)
let rec sum_leaves : binary_tree -> int =
  fun tree -> failwith "not implemented yet" ;;

(* You implemented bubble sort and quick sort in SD3 in Java.
   Now try in OCaml.

   To test your implements, add unit tests and property tests
   in test/ExercisesTests.ml .

   Idea for a property test: generate a random integer list
   with a QuickCheck generator function, then apply the
   bubble_sort and quick_sort functoins to that list and make
   sure that their returned values are equal.
 *)

(* Bubble sort
   
   Sort an input integer list using a recursive bubble sort function.
 *)
let rec bubble_sort (xs:int list) : int list =
  failwith "not implemented yet";;

(* Quick sort

   Sort an input integer list using a recursive quick sort function.
 *)
let rec quick_sort (xs:int list) : int list =
  failwith "not implemented yet";;
