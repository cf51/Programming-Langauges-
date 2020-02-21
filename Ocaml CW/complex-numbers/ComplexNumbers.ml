type complex_number = CI of int*int;;

(* implementations *)

(* addition of two Complex Integers *)
let cadd (CI(x,y)) (CI(x2,y2)) = 
  (*Adding the real number with the imaginary number for x and y *) (* So x + x2 and y + y2 *)
  (*complex_number -> complex_number -> complex_number = <fun>*)
  (CI((x+x2), (y+y2)));; 
  

(* multiplication of two Complex Integers *)
let cmult (CI(x,y)) (CI(x2,y2)) =
  (*Multiply the real number with the imaginary number for x and y *) (* Mutiplying using the equation (ac-bd) + (ad + bc)i *)
  (CI(((x*x2)-(y*y2)),((x*y2) + (x2*y))));;                           (* Using the FOIL method we get (x*x2)-(y*y2)),((x*y2) + (x2*y) *)
                                                                      (* x = a , y = b , x2 = c , y2 = d *)
