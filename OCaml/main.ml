open Tester
open Core
open OUnit

let ( = ) = Stdlib.( = )

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
  let _ = bst_test () in
  let _ = bstmodule_test () in
  let _ = bstmodule2_test () in
  let _ = bstmutable_test () in
  let _ = visitor_test () in
  ()
