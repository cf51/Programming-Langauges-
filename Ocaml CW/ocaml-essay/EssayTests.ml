
open Essay ;;
open OUnit2;;

(* unit tests *) 

let add_test1 _test_ctxt =
  assert_equal 9 (add 5 4);;

(* Testing that the maximum number is 5, the function is given 5 and 3 and checks that the largest number is 5 *)
let maxNum_test1 _test_ctxt =
  assert_equal 5 (maxNum 3 5);; 

(* Testing that when the subtract function is given 10 and 6, the answer is 4 (10-6 = 4) *)
let sub_test1 _test_ctxt = 
  assert_equal 4 (sub 10 6);; 

(* Testing that when the subtract function is given 5 and 2, the answer is 3 (5-2 = 3) *)
let sub_test2 _test_ctxt = 
  assert_equal 3 (sub 5 2);; 

(* Testing that when the mult function is given 5 and 2, the answer is 10 (5 * 2 = 10) *)
let mult_test1 _test_ctxt = 
  assert_equal 10 (mult 5 2);;

(* Testing that when the mult function is given 20 and 2, the answer is 40 (20 * 2 = 40) *)
let mult_test2 _test_ctxt = 
  assert_equal 40 (mult 20 2);;


(* Testing that the sum function works with pattern matching *)
let sum_test1 _test_ctxt = 
  assert_equal [8] (sum [4;4]);; 

(* Testing that the word 'toy' is made plural *)
let pluralise_test _ctxt =
  assert_equal "toys" (pluralise "toy");;

(* Here we are testing the truth table values for AND *)

(* If both are true then the table is true *)
let truth_table_and_TT _ctxt =
    assert_equal
      true
      (truth_table_and true true);;
  
  (* If one is true and one is false, the table is false *)
  let truth_table_and_TF _ctxt =
    assert_equal
      false
      (truth_table_and true false);;

  (* If one is false and one is true, the table is false *)
  let truth_table_and_FT _ctxt =
    assert_equal
      false
      (truth_table_and false true);;
  
  (* If both are false then the table is false *)
  let truth_table_and_FF _ctxt =
    assert_equal
      false
      (truth_table_and false false);;

 (* Testing if there is any even numbers in the integer list *)
 (* As it is an empty list there are no even numbers so the test expects a false *)
  let any_evens_test1 _ctxt =
     assert_equal
       false
       (any_evens []);;
  
  (* As there is an even number the tests expects a true *)
  let any_evens_test2 _ctxt =
      assert_equal
        true
        (any_evens [1;2;3]);;
  
        (* As there is no even numbers the tests expects a false *)
  let any_evens_test3 _ctxt =
      assert_equal
        false
        (any_evens [1;3;7]);;
      
  


(*---------------------------------------------------------------------------------------------------------------------------------------------*)

(* The following funtion demonstrates unit testing and property based testing *)

(* Using traditional top level testing only works on small programs as the whole program needs to be complete before you can test it, 
 this isnt suitable for large scale programs. In larger you programs you need to have seperate test files containing unit tests in 
 order to test the smaller function and aspect of a larger project. A unit test is a small test on a piece of a programs such as a function 
 or method, this tests the fucntionality of a piece of code and can be re-run everytime the code is updated.*)

 
 (* Here we are testing that the maximum number is 6, the function is given 3 and 6 and checks that the largest number is 6 *)

let maxNum_test2 _test_ctxt = (* Here we tell the unit test what function we are wanting to test *)
    assert_equal 6 (maxNum 3 6);; (* We use the keyword 'assert_equals', this takes input values (in this case two) and asserts what the answer will be *)
                                  (* We could also assert that it would be true or false *)
                                  (* This test takes the values, '3' and '6', calls the function 'maxNum' to perform the function and then expects the answer '6' *)

(* Property testing is a much thorough way of testing a function in Ocmal, it checks that a function or program under test abides by a property *) 
(* This allows you to cover the scope of all outputs, you can run a test 100+ times without having to write 100+ tests. *)
(* You can also test corner cases *)

                                                      (*************************************************************************)
                                                      (* Property tests for the 'sub', 'add' and 'mult' method are found below *)
                                                      (*************************************************************************)
                                                        

(* list of unit tests *)
let unit_tests =
  [ "add_test1">::add_test1  
   ; "maxNum_test1">::maxNum_test1 
   ; "maxNum_test2">::maxNum_test2 
   ; "sum_test1">::sum_test1
   ; "pluralise_test">::pluralise_test
   ; "truth_table_and_TT">::truth_table_and_TT
   ; "truth_table_and_FT">::truth_table_and_FT
   ; "truth_table_and_TF">::truth_table_and_TF
   ; "truth_table_and_FF">::truth_table_and_FF
   ; "any_evens_test1">::any_evens_test1
   ; "any_evens_test2">::any_evens_test2
   ; "any_evens_test3">::any_evens_test3
   ; "sub_test1">::sub_test1
   ; "sub_test2">::sub_test2
   ; "mult_test2">::mult_test2
   ; "mult_test1">::mult_test2
  ];;

(* property based tests *)

let add_zero =
  QCheck.Test.make ~name:"add_zero" ~count:1000
    QCheck.(make Gen.nat)
    (fun x ->
      add x 0 = x
      && add 0 x = x);;

let sub_zero = 
  QCheck.Test.make ~name:"sub_zero" ~count:1000
    QCheck.(make Gen.nat)
    (fun x ->
       sub x 0 = x
       && sub 0 x = x);;


let mult_zero = 
  QCheck.Test.make ~name:"mult_zero" ~count:1000
    QCheck.(make Gen.nat)
    (fun x ->
      mult x 0 = 0
      && mult 0 x = 0);;

(* list of all property tests *)                  
let property_tests =
  List.map QCheck_ounit.to_ounit2_test
    [ add_zero
    ; sub_zero
    ; mult_zero
    ];;

(* run the unit and property based tests *)
let () =
  run_test_tt_main
    ("sequence_arithmetic_tests">:::
       (List.append unit_tests property_tests));;
