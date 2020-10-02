open Tester
open Core
open OUnit2

let ( = ) = Stdlib.( = )

let print_var varname var = varname ^ ":\t" ^ var |> print_endline

let bst_test () =
  let open Bst in
  let t1 = Br { left = Lf; value = 10; right = Lf } in
  let t2 = Br { left = Lf; value = 25; right = Lf } in
  let t3 = Br { left = t1; value = 15; right = t2 } in
  let t4 = Br { left = Lf; value = 60; right = Lf } in
  let t5 = Br { left = Lf; value = 48; right = t4 } in
  let t6 = Br { left = t3; value = 30; right = t5 } in
  let t7 = insert (t6, 23) in
  let t8 = insert (t6, 0) in
  let t9 = delete (t8, 30) in
  [
    { input = find (t6, 30); expected = true };
    { input = find (t6, 13); expected = false };
    { input = find (t7, 23); expected = true };
    { input = find (t8, 30); expected = true };
    { input = find (t8, 23); expected = false };
    { input = find (t9, 30); expected = false };
    { input = find (t9, 48); expected = true };
  ]
  |> gen_bool_test "bst" |> run_test_tt_main |> ignore

let bstmodule_test () =
  let open BstModule.Bst.Bst in
  let t0 = empty in
  let t1 = insert (t0, 30) in
  let t2 = insert (t1, 15) in
  let t3 = insert (t2, 48) in
  let t4 = insert (t3, 10) in
  let t5 = insert (t4, 25) in
  let t6 = insert (t5, 60) in
  let t7 = insert (t6, 23) in
  let t8 = insert (t6, 0) in
  let t9 = delete (t8, 30) in
  [
    { input = find (t6, 30); expected = true };
    { input = find (t6, 13); expected = false };
    { input = find (t7, 23); expected = true };
    (* ??? *)
    (* should return false *)
    { input = find (t8, 30); expected = true };
    { input = find (t8, 23); expected = false };
    { input = find (t9, 30); expected = false };
    { input = find (t9, 48); expected = true };
  ]
  |> gen_bool_test "bstModule" |> run_test_tt_main |> ignore

let bstmodule2_test () =
  let open BstModule2.Bst in
  let t0 = empty in
  let t1 = insert (t0, 30) in
  let t2 = insert (t1, 15) in
  let t3 = insert (t2, 48) in
  let t4 = insert (t3, 10) in
  let t5 = insert (t4, 25) in
  let t6 = insert (t5, 60) in
  let t7 = insert (t6, 23) in
  let t8 = insert (t6, 0) in
  let t9 = delete (t8, 30) in
  [
    { input = find (t6, 30); expected = true };
    { input = find (t6, 13); expected = false };
    { input = find (t7, 23); expected = true };
    { input = find (t8, 30); expected = true };
    { input = find (t8, 23); expected = false };
    { input = find (t9, 30); expected = false };
    { input = find (t9, 48); expected = true };
  ]
  |> gen_bool_test "bstModule2" |> run_test_tt_main |> ignore

let bstmutable_test () =
  let open BstMutable.Bst in
  let t1 = Br { left = Lf; value = 10; right = Lf } in
  let t2 = Br { left = Lf; value = 25; right = Lf } in
  let t3 = Br { left = t1; value = 15; right = t2 } in
  let t4 = Br { left = Lf; value = 60; right = Lf } in
  let t5 = Br { left = Lf; value = 48; right = t4 } in
  let t6 = Br { left = t3; value = 30; right = t5 } in
  let t7 = insert (t6, 23) in
  let t8 = delete (t7, 30) in
  [
    { input = find (t6, 30); expected = false };
    { input = find (t6, 13); expected = false };
    { input = find (t7, 23); expected = true };
    { input = find (t7, 30); expected = false };
    { input = find (t8, 30); expected = false };
    { input = find (t8, 48); expected = true };
  ]
  |> gen_bool_test "bstMutable" |> run_test_tt_main |> ignore

let hofun_test () =
  let open Hofun in
  let t1 = Br { left = Lf; value = 10; right = Lf } in
  let t2 = Br { left = Lf; value = 25; right = Lf } in
  let t3 = Br { left = t1; value = 15; right = t2 } in
  let t4 = Br { left = Lf; value = 60; right = Lf } in
  let t5 = Br { left = Lf; value = 48; right = t4 } in
  let t6 = Br { left = t3; value = 30; right = t5 } in
  (* Let's double the values in t6 keeping its shape *)
  let t7 = treemap (fun n -> n * 2) t6 in
  (* Interpret Lf as 0 and Br as addition *)
  let _s6 = treefold 0 (fun l v r -> l + v + r) t6 in
  let _s7 = treefold 0 (fun l v r -> l + v + r) t7 in
  (* Conversion to a string can be written in terms of fold *)
  let str6 =
    treefold "leaf"
      (fun l v r -> "branch(" ^ l ^ ", " ^ string_of_int v ^ ", " ^ r ^ ")")
      t6
  in
  let str7 =
    treefold "leaf"
      (fun l v r -> "branch(" ^ l ^ ", " ^ string_of_int v ^ ", " ^ r ^ ")")
      t7
  in
  let _ = print_var "g1" g1 in
  let _ = print_var "g2" g2 in
  let _ = print_var "str6" str6 in
  print_var "str7" str7

let polybst_test () =
  let open PolyBST.Bst in
  let t1 = Br { left = Lf; value = 10; right = Lf } in
  let t2 = Br { left = Lf; value = 25; right = Lf } in
  let t3 = Br { left = t1; value = 15; right = t2 } in
  let t4 = Br { left = Lf; value = 60; right = Lf } in
  let t5 = Br { left = Lf; value = 48; right = t4 } in
  let t6 = Br { left = t3; value = 30; right = t5 } in
  let t7 = insert (fun x y -> x - y) t6 23 in
  let t8 = insert (fun x y -> x - y) t6 0 in
  let t9 = delete (fun x y -> x - y) t8 30 in
  (* Constructing another sample tree *)
  let t11 = Br { left = Lf; value = "I"; right = Lf } in
  let t12 = Br { left = Lf; value = "love"; right = Lf } in
  let t13 = Br { left = t11; value = "OCaml"; right = t12 } in
  let t14 = Br { left = Lf; value = "you"; right = Lf } in
  let t15 = Br { left = Lf; value = "think"; right = t14 } in
  let t16 = Br { left = t13; value = "so?"; right = t15 } in
  let t17 = insert String.compare t16 "Me" in
  let t18 = insert String.compare t16 "too" in
  let t19 = delete String.compare t18 "Why" in
  [
    { input = find (fun x y -> x - y) t6 30; expected = true };
    { input = find (fun x y -> x - y) t6 13; expected = false };
    { input = find (fun x y -> x - y) t7 23; expected = true };
    { input = find (fun x y -> x - y) t8 30; expected = true };
    { input = find (fun x y -> x - y) t8 23; expected = false };
    { input = find (fun x y -> x - y) t9 30; expected = false };
    { input = find (fun x y -> x - y) t9 48; expected = true };
    { input = find String.compare t16 "so?"; expected = true };
    { input = find String.compare t16 "Ocaml"; expected = false };
    { input = find String.compare t17 "Me"; expected = true };
    { input = find String.compare t18 "Why"; expected = false };
    { input = find String.compare t18 "Me"; expected = false };
    { input = find String.compare t19 "Why"; expected = false };
    { input = find String.compare t19 "She"; expected = false };
  ]
  |> gen_bool_test "polybst" |> run_test_tt_main |> ignore

let polytree_test () =
  let open PolyTree.Tree in
  let t1 = Br { left = Lf; value = 10; right = Lf } in
  let t2 = Br { left = Lf; value = 25; right = Lf } in
  let t3 = Br { left = t1; value = 15; right = t2 } in
  let t4 = Br { left = Lf; value = 60; right = Lf } in
  let t5 = Br { left = Lf; value = 48; right = t4 } in
  let t6 = Br { left = t3; value = 30; right = t5 } in
  let _ = "s6:\t" ^ string_of_int (size t6) |> print_endline in
  let _ = "d6:\t" ^ string_of_int (depth t6) |> print_endline in
  let _ = "t7:\t" ^ string_of_int_tree (reflect t6) |> print_endline in
  let _ = "s7:\t" ^ string_of_int (size t7) |> print_endline in
  let _ = "d7:\t" ^ string_of_int (depth t7) |> print_endline in
  let _ = "t8:\t" ^ string_of_int_tree (add (t6, 100)) |> print_endline in
  let _ = "s8:\t" ^ string_of_int (size t8) |> print_endline in
  let _ = "d8:\t" ^ string_of_int (depth t8) |> print_endline in
  (* Now let's construct a tree holding strings *)
  let t11 = Br { left = Lf; value = "I"; right = Lf } in
  let t12 = Br { left = Lf; value = "love"; right = Lf } in
  let t13 = Br { left = t11; value = "OCaml"; right = t12 } in
  let t14 = Br { left = Lf; value = "How"; right = Lf } in
  let t15 = Br { left = Lf; value = "about"; right = t14 } in
  let t16 = Br { left = t13; value = "you?"; right = t15 } in
  let _ = "s16:\t" ^ string_of_int (size t16) |> print_endline in
  let _ = "d16:\t" ^ string_of_int (depth t16) |> print_endline in
  let _ = "t17:\t" ^ string_of_string_tree (reflect t16) |> print_endline in
  let _ = "s17:\t" ^ string_of_int (size t17) |> print_endline in
  let _ = "d17:\t" ^ string_of_int (depth t17) |> print_endline in
  let _ =
    "t18:\t" ^ string_of_string_tree (add (t16, "Me, too!")) |> print_endline
  in
  let _ = "s18:\t" ^ string_of_int (size t18) |> print_endline in
  let _ = "d18:\t" ^ string_of_int (depth t18) |> print_endline in
  ()

let visitor_test () =
  let open Visitor in
  let t1 = Br { left = Lf; value = 10; right = Lf } in
  let t2 = Br { left = Lf; value = 25; right = Lf } in
  let t3 = Br { left = t1; value = 15; right = t2 } in
  let t4 = Br { left = Lf; value = 60; right = Lf } in
  let t5 = Br { left = Lf; value = 48; right = t4 } in
  let t6 = Br { left = t3; value = 30; right = t5 } in
  [
    { input = find (t6, 30); expected = true };
    { input = find (t6, 13); expected = false };
    { input = find (t6, 30); expected = true };
    { input = find (t6, 13); expected = false };
    { input = fold_wo_rec (find_gen 30) t6; expected = true };
    { input = fold_wo_rec (find_gen 13) t6; expected = false };
  ]
  |> gen_bool_test "visitor" |> run_test_tt_main |> ignore

let () =
  "=== bst ===" |> print_endline;
  let _ = bst_test () in
  "=== bstmodule ===" |> print_endline;
  let _ = bstmodule_test () in
  "=== bstmodule2 ===" |> print_endline;
  let _ = bstmodule2_test () in
  "=== bstmutable ===" |> print_endline;
  let _ = bstmutable_test () in
  "=== hofun ===" |> print_endline;
  let _ = hofun_test () in
  "=== polybst ===" |> print_endline;
  let _ = polybst_test () in
  "=== polytree ===" |> print_endline;
  let _ = polytree_test () in
  "=== visitor ===" |> print_endline;
  let _ = visitor_test () in
  ()
