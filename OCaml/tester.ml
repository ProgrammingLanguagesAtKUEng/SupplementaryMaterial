open Core
open OUnit2

type ('a, 'b) testcase = { input : 'a; expected : 'b }

let id x = x

let gen_bool_test name cases =
  cases
  |> List.mapi ~f:(fun i { input; expected } ->
         i |> string_of_int >:: fun _ -> assert_equal input expected)
  |> ( >::: ) name
