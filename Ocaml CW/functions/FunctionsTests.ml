open Functions ;;
open OUnit2;;

(* unit tests *)

let curry_test1 _test_ctxt =
  assert_equal
    (curry
       (fun (x,y) -> x + y) 4 3) 7 ;;

(* Testing the uncurry function, the function here is addition *)
let uncurry_test1 _test_ctxt =
  assert_equal 
  (uncurry
    (+) (4, 3)) 7 ;; 
      

(* forall f, x, y. f x y == uncurry f (x,y) *)
let curry_prop =
  let f = fun x y -> x + y in
  QCheck.Test.make ~name:"curry_prop" ~count:10000
    QCheck.(make
              (Gen.pair
                 Gen.nat (* i1 *)
                 Gen.nat (* i2 *)
  ))
    (fun (i1,i2) -> f i1 i2 = uncurry f (i1,i2)) ;;

(* forall f, x, y. f x y == (curry (uncurry f)) x y *)
let curry_uncurry_prop =
  let f = fun x y -> x + y in
  QCheck.Test.make ~name:"curry_prop" ~count:10000
    QCheck.(make
              (Gen.pair
                 Gen.nat (* i1 *)
                 Gen.nat (* i2 *)
  ))

    (fun (i1,i2) -> f i1 i2 = (curry (uncurry f)) i1 i2) ;;

(* list of unit tests *)
let unit_tests =
  [ (* ismatrix tests *)
    "curry_test1">::curry_test1
  ; "uncurry_test1">::uncurry_test1
  ] ;;

(* list of all property tests *)                  
let property_tests =
  List.map QCheck_ounit.to_ounit2_test
    [
      curry_prop
    ; curry_uncurry_prop
    ];;

(* run the unit and property based tests *)
let () =
  run_test_tt_main
    ("functions_tests">:::
       (List.append unit_tests property_tests));;
