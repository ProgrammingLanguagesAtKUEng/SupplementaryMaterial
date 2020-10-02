open Core
open OUnit

type ('a, 'b) testcase = { input : 'a; expected : 'b }

let id x = x

let gen_bool_test name cases =
  cases
  |> List.mapi ~f:(fun i { input; expected } ->
         i |> string_of_int >:: fun _ -> assert_equal input expected)
  |> ( >::: ) name

let gen_tests ?(cmp = ( = )) ~ishow ~oshow ~iprep ~oprep ~exec tests =
  tests
  |> List.map ~f:(fun (test : ('a, 'b) testcase) ->
         "" >:: fun () ->
         let actual = exec @@ iprep @@ test.input in
         assert_bool
           (Printf.sprintf "input:     '%s'\nactual:    %s\nexpected:  %s\n"
              (ishow @@ iprep @@ test.input)
              (oshow actual)
              (oshow @@ oprep @@ test.expected))
           (cmp actual (test.expected |> oprep)))

type ('a, 'b, 'c, 'd, 'f) test = {
  name : string;
  func : 'f;
  prep : 'f -> 'a -> 'b;
  ishow : 'a -> string;
  oshow : 'b -> string;
  iprep : 'c -> 'a;
  oprep : 'd -> 'b;
  cmp : 'b -> 'b -> bool;
  dataset : ('c, 'd) testcase list;
}

let run_test_case (case : ('a, 'b, 'c, 'd, 'f) test) =
  (* printf "Running %s\n" case.name; *)
  run_test_tt_main
    ( case.name
    >::: gen_tests ~cmp:case.cmp ~ishow:case.ishow ~oshow:case.oshow
           ~iprep:case.iprep ~oprep:case.oprep ~exec:(case.prep case.func)
           case.dataset )
