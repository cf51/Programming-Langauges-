open Exercises ;;
open OUnit2;;

(* unit tests *)

let concat_test _ctxt =
  assert_equal
    "helloworld"
    (concat "hello" "world");;

let pluralise_test _ctxt =
  assert_equal
    "toys"
    (pluralise "toy");;

let first_three_test _ctxt =
  assert_equal
    "hap"
    (first_three "happy");;
    

let logical_not_test1 _ctxt =
  assert_equal
    false
    (logical_not true);;

let logical_not_test2 _ctxt =
  assert_equal
    true
    (logical_not false);;

let logical_not_test3 _ctxt =
  assert_equal
    false
    (logical_not' true);;

let logical_not_test4 _ctxt =
  assert_equal
    true
    (logical_not' false);;

let truth_table_and_TT _ctxt =
  assert_equal
    true
    (truth_table_and true true);;

let truth_table_and_TF _ctxt =
  assert_equal
    false
    (truth_table_and true false);;

let truth_table_and_FT _ctxt =
  assert_equal
    false
    (truth_table_and false true);;

let truth_table_and_FF _ctxt =
  assert_equal
    false
    (truth_table_and false false);;

let truth_table_xor_TT _ctxt =
  assert_equal
    false
    (truth_table_xor true true);;

let truth_table_xor_TF _ctxt =
  assert_equal
    true
    (truth_table_xor true false);;

let truth_table_xor_FT _ctxt =
  assert_equal
    true
    (truth_table_xor false true);;

let truth_table_xor_FF _ctxt =
  assert_equal
    false
    (truth_table_xor false false);;

let truth_table_xnor_TT _ctxt =
  assert_equal
    true
    (truth_table_xnor true true);;

let truth_table_xnor_TF _ctxt =
  assert_equal
    false
    (truth_table_xnor true false);;

let truth_table_xnor_FT _ctxt =
  assert_equal
    false
    (truth_table_xnor false true);;

let truth_table_xnor_FF _ctxt =
  assert_equal
    true
    (truth_table_xnor false false);;

let tuple_first_test _ctxt =
  assert_equal
    4
    (tuple_first (4,"hello"));;

let tuple_second_test _ctxt =
  assert_equal
    "hello"
    (tuple_second (4,"hello"));;

let jon = Person ("Jon",45) ;;
let sarah = Person ("Sarah",23) ;;

let age_of_test _ctxt =
  assert_equal
    45
    (age_of jon);;

let who_is_older_test _ctxt =
  assert_equal
    jon
    (who_is_older jon sarah);;

let same_age_test _ctxt =
  assert_equal
    false
    (same_age jon sarah);;

let add_int_test1 _ctxt =
  assert_equal
    6
    (add_int 4 2);;

let add_int_test2 _ctxt =
  assert_equal
    0
    (add_int 4 (-4));;

let add_float_test1 _ctxt =
  assert_equal
    (4.1 +. 2.1)
    (add_float 4.1 2.1);;

let add_float_test2 _ctxt =
  assert_equal
    0.0
    (add_float 4.0 (-4.0));;

let is_even_test1 _ctxt =
  assert_equal
    false
    (is_even (-1));;

let is_even_test2 _ctxt =
  assert_equal
    true
    (is_even 2);;

let any_evens_test1 _ctxt =
  assert_equal
    false
    (any_evens []);;

let any_evens_test2 _ctxt =
  assert_equal
    true
    (any_evens [1;2;3]);;

let any_evens_test3 _ctxt =
  assert_equal
    false
    (any_evens [1;3;7]);;

let is_head_even_test1 _ctxt =
  assert_equal
    false
    (is_head_even []);;

let is_head_even_test2 _ctxt =
  assert_equal
    false
    (is_head_even [1;2]);;

let is_head_even_test3 _ctxt =
  assert_equal
    true
    (is_head_even [4;5;6]);;

let large_list_test1 _ctxt =
  assert_equal
    false
    (large_list []);;

let large_list_test2 _ctxt =
  assert_equal
    false
    (large_list [1;1]);;

let large_list_test3 _ctxt =
  assert_equal
    true
    (large_list [1;1;1]);;

let map_test1 _ctxt =
  assert_equal
    []
    (map (fun x -> x * 2) []);;

let map_test2 _ctxt =
  assert_equal
    [2;4;6]
    (map (fun x -> x * 2) [1;2;3]);;

let filter_test1 _ctxt =
  assert_equal
    []
    (filter is_even []);;

let filter_test2 _ctxt =
  assert_equal
    [2]
    (filter is_even [1;2]);;

let susan = Person ("Susan",41) ;;
let paula = Person ("Paula",29) ;;
let jason = Person ("Jason",16) ;;
let bella = Person ("Bella",76) ;;
let lisa = Person ("Lisa",30) ;;

let club_18_30_test _ctxt =
  assert_equal
    [paula;lisa]
    (club_18_30 [susan;paula;jason;bella;lisa]);;

let count_40_plus_test _ctxt =
  assert_equal
    (3,2)
    (count_40_plus [susan;paula;jason;bella;lisa]);;

let tree1 = Leaf 4 ;;
let tree2 = Tree (Leaf 5 , (Tree (Leaf 8, Leaf 9))) ;;
let tree3 = Tree (Leaf 5 , Leaf 6) ;;

let last_elem_test1 _ctxt =
  let f () = last_elem []
  in
  assert_raises
    (ListException "cannot 'last' on empty list")
    f ;; 

let last_elem_test2 _ctxt =
  assert_equal
    1
    (last_elem [1]) ;; 

let last_elem_test3 _ctxt =
  assert_equal
    3
    (last_elem [1;2;3]) ;; 

let reverse_list_test1 _ctxt =
  assert_equal
    []
    (reverse_list []) ;; 

let reverse_list_test2 _ctxt =
  assert_equal
    [3;2;1]
    (reverse_list [1;2;3]) ;; 

let reverse_list_test3 _ctxt =
  assert_equal
    ["harry"; "luke"; "sarah"; "jon"]
    (reverse_list ["jon";"sarah";"luke";"harry"]) ;; 

let list_or_test1 _ctxt =
  assert_equal
    false
    (list_or []) ;;

let list_or_test2 _ctxt =
  assert_equal
    false
    (list_or [false;false]) ;;

let list_or_test3 _ctxt =
  assert_equal
    true
    (list_or [false;true;false]) ;;

let list_all_true_test1 _ctxt =
  assert_equal
    false
    (list_all_true []) ;;

let list_all_true_test2 _ctxt =
  assert_equal
    false
    (list_all_true [true;false;true]) ;;

let list_all_true_test3 _ctxt =
  assert_equal
    true
    (list_all_true [true;true;true]) ;;

let replicate_elem_test1 _ctxt =
  assert_equal
    []
    (replicate_elem  0 "hello") ;;

let replicate_elem_test2 _ctxt =
  assert_equal
    ["hello"]
    (replicate_elem  1 "hello") ;;

let replicate_elem_test3 _ctxt =
  assert_equal
    ["hello";"hello";"hello"]
    (replicate_elem  3 "hello") ;;

let take_while_test1 _ctxt =
  assert_equal
    []
    (take_while (fun x -> x < 0) [1;2;3]) ;;

let take_while_test2 _ctxt =
  assert_equal
    [1;2]
    (take_while (fun x -> x < 3) [1;2;3;4;1;2;3;4]) ;;

let take_while_test3 _ctxt =
  assert_equal
    [1;2;3]
    (take_while (fun x -> x < 9) [1;2;3]) ;;

let is_prefix_of_test1 _ctxt =
  assert_equal
    true
    (is_prefix_of [1;2] [1;2]) ;;

let is_prefix_of_test2 _ctxt =
  assert_equal
    true
    (is_prefix_of [1;2] [1;2;3]) ;;

let is_prefix_of_test3 _ctxt =
  assert_equal
    false
    (is_prefix_of [1;2;3] [1;2]) ;;

let is_prefix_of_test4 _ctxt =
  assert_equal
    false
    (is_prefix_of [1;2] []) ;;

let is_prefix_of_test5 _ctxt =
  assert_equal
    true
    (is_prefix_of [] [1;2]) ;;

let is_prefix_of_test6 _ctxt =
  assert_equal
    true
    (is_prefix_of [] []) ;;

let zip_lists_test1 _ctxt =
  assert_equal
    []
    (zip_lists [] []) ;;

let zip_lists_test2 _ctxt =
  assert_equal
    []
    (zip_lists [1;2] []) ;;

let zip_lists_test3 _ctxt =
  assert_equal
    [(true, 1); (true, 2); (false, 3)]
    (zip_lists [true;true;false] [1;2;3]) ;;

let zip_lists_with_test1 _ctxt =
  assert_equal
    [2; 4; 6]
    (zip_lists_with (fun x y -> x*y) [1;2;3] [2;2;2]) ;;

let zip_lists_with_test2 _ctxt =
  assert_equal
    [-1; 0; 1]
    (zip_lists_with (fun x y -> x-y) [1;2;3] [2;2;2]) ;;

let zip_lists_with_test3 _ctxt =
  assert_equal
    []
    (zip_lists_with (fun x y -> x*y) [1;2;3] []) ;;

let zip_lists_with_test4 _ctxt =
  assert_equal
    ["rob1"; "sarah2"]
    (zip_lists_with (fun x y -> x ^ (string_of_int y)) ["rob";"sarah"] [1;2]) ;;

let count_leaves_test1 _ctxt =
  assert_equal
    1
    (count_leaves tree1);;

let count_leaves_test2 _ctxt =
  assert_equal
    3
    (count_leaves tree2);;

let count_leaves_test3 _ctxt =
  assert_equal
    2
    (count_leaves tree3);;

let sum_leaves_test1 _ctxt =
  assert_equal
    4
    (sum_leaves tree1);;

let sum_leaves_test2 _ctxt =
  assert_equal
    22
    (sum_leaves tree2);;

let sum_leaves_test3 _ctxt =
  assert_equal
    11
    (sum_leaves tree3);;

(* TODO: add tests for bubble sort and quick sort, and add
         them to 'unit_tests' list below
 *)

(* list of unit tests *)
let unit_tests =
  [ "concat_test" >:: concat_test
  ; "pluralise_test" >:: pluralise_test
  ; "first_three_test" >:: first_three_test
  ; "logical_not_test1"  >:: logical_not_test1
  ; "logical_not_test2"  >:: logical_not_test2
  ; "logical_not_test3"  >:: logical_not_test3
  ; "logical_not_test4"  >:: logical_not_test4
  ; "truth_table_and_TT" >:: truth_table_and_TT
  ; "truth_table_and_TF" >:: truth_table_and_TF
  ; "truth_table_and_FT" >:: truth_table_and_FT
  ; "truth_table_and_FF"  >:: truth_table_and_FF
  ; "truth_table_xor_TT" >:: truth_table_xor_TT
  ; "truth_table_xor_TF"  >:: truth_table_xor_TF
  ; "truth_table_xor_FT" >:: truth_table_xor_FT
  ; "truth_table_xor_FF"  >:: truth_table_xor_FF
  ; "truth_table_xnor_TT" >:: truth_table_xnor_TT
  ; "truth_table_xnor_TF"  >:: truth_table_xnor_TF
  ; "truth_table_xnor_FT" >:: truth_table_xnor_FT
  ; "truth_table_xnor_FF"  >:: truth_table_xnor_FF
  ; "tuple_first_test" >:: tuple_first_test
  ; "tuple_second_test" >:: tuple_second_test
  ; "age_of_test" >:: age_of_test
  ; "who_is_older_test" >:: who_is_older_test
  ; "same_age_test" >:: same_age_test
  ; "add_int_test1"  >:: add_int_test1
  ; "add_int_test2"  >:: add_int_test2
  ; "add_float_test1"  >:: add_float_test1
  ; "add_float_test2"  >:: add_float_test2
  ; "is_even_test1"  >:: is_even_test1
  ; "is_even_test2"  >:: is_even_test2
  ; "any_evens_test1"  >:: any_evens_test1
  ; "any_evens_test2"  >:: any_evens_test2
  ; "any_evens_test3"  >:: any_evens_test3
  ; "is_head_even_test1"  >:: is_head_even_test1
  ; "is_head_even_test2"  >:: is_head_even_test2
  ; "is_head_even_test3"  >:: is_head_even_test3
  ; "large_list_test1" >:: large_list_test1
  ; "large_list_test2" >:: large_list_test2
  ; "large_list_test3" >:: large_list_test3
  ; "map_test1"  >:: map_test1
  ; "map_test2"  >:: map_test2
  ; "filter_test1"  >:: filter_test1
  ; "filter_test2"  >:: filter_test2
  ; "club_18_30_test" >:: club_18_30_test
  ; "count_40_plus_test" >:: count_40_plus_test
  ; "last_elem_test1" >:: last_elem_test1
  ; "last_elem_test2" >:: last_elem_test2
  ; "last_elem_test3" >:: last_elem_test3
  ; "reverse_list_test1" >:: reverse_list_test1
  ; "reverse_list_test2" >:: reverse_list_test2
  ; "reverse_list_test3" >:: reverse_list_test3
  ; "list_or_test1" >:: list_or_test1
  ; "list_or_test2" >:: list_or_test2
  ; "list_or_test3" >:: list_or_test3
  ; "list_all_true_test1" >:: list_all_true_test1
  ; "list_all_true_test2" >:: list_all_true_test2
  ; "list_all_true_test3" >:: list_all_true_test3
  ; "replicate_elem_test1" >:: replicate_elem_test1
  ; "replicate_elem_test2" >:: replicate_elem_test2
  ; "replicate_elem_test3" >:: replicate_elem_test3
  ; "take_while_test1" >:: take_while_test1
  ; "take_while_test2" >:: take_while_test2
  ; "take_while_test3" >:: take_while_test3
  ; "is_prefix_of_test1" >:: is_prefix_of_test1
  ; "is_prefix_of_test2" >:: is_prefix_of_test2
  ; "is_prefix_of_test3" >:: is_prefix_of_test3
  ; "is_prefix_of_test4" >:: is_prefix_of_test4
  ; "is_prefix_of_test5" >:: is_prefix_of_test5
  ; "is_prefix_of_test6" >:: is_prefix_of_test6
  ; "zip_lists_test1" >:: zip_lists_test1
  ; "zip_lists_test2" >:: zip_lists_test2
  ; "zip_lists_test3" >:: zip_lists_test3
  ; "zip_lists_with_test1" >:: zip_lists_with_test1
  ; "zip_lists_with_test2" >:: zip_lists_with_test2
  ; "zip_lists_with_test3" >:: zip_lists_with_test3
  ; "zip_lists_with_test4" >:: zip_lists_with_test4
  ; "count_leaves_test1"  >:: count_leaves_test1
  ; "count_leaves_test2"  >:: count_leaves_test2
  ; "count_leaves_test3"  >:: count_leaves_test3
  ; "sum_leaves_test1"  >:: sum_leaves_test1
  ; "sum_leaves_test2"  >:: sum_leaves_test2
  ; "sum_leaves_test3"  >:: sum_leaves_test3
  ];;

(* property based tests *)

(* TODO: think of some desirable properties for the functions
         in Exercises.ml , then add them below and then add
         them to the 'property_tests' list.
 *)

(* list of all property tests *)                  
let property_tests =
  List.map QCheck_ounit.to_ounit2_test
    [
    ];;

(* run the unit and property based tests *)
let () =
  run_test_tt_main
    ("exercise_tests">:::
       (List.append unit_tests property_tests));;
