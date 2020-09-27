type tree =
  Lf
| Br of {
    left: tree;
    value: int;
    right: tree;
  }

let rec fold lf br t =
  match t with
    Lf -> lf
  | Br {left=l; value=v; right=r} ->
     br (fold lf br l) v (fold lf br r)

let find(t, n) =
  fold
    false
    (fun l v r ->
      if n = v then true
      else if n < v then l
      else r)
    t

(* Constructing a sample tree *)
let t1 = Br {left = Lf; value = 10; right = Lf}
let t2 = Br {left = Lf; value = 25; right = Lf}
let t3 = Br {left = t1; value = 15; right = t2}
let t4 = Br {left = Lf; value = 60; right = Lf}
let t5 = Br {left = Lf; value = 48; right = t4}
let t6 = Br {left = t3; value = 30; right = t5}

(* Testing find *)
let test1 = find(t6, 30)  (* should be true *)
let test2 = find(t6, 13)  (* should be false *)

let fold_wo_rec lf br t =
  match t with
    Lf -> lf
  | Br {left=l; value=v; right=r} ->
     br l v r

let rec find2(t, n) =
  fold_wo_rec
    false
    (fun l v r ->
      if n = v then true
      else if n < v then find2(l, n)
      else find2(l, n))
    t

(* Testing find *)
let test3 = find(t6, 30)  (* should be true *)
let test4 = find(t6, 13)  (* should be false *)

type visitor = { caseLf: bool; caseBr: tree -> int -> tree -> bool; }
             
let fold_wo_rec visitor t =
  match t with
    Lf -> visitor.caseLf
  | Br {left=l; value=v; right=r} ->
     visitor.caseBr l v r

let rec find3(t, n) =
  fold_wo_rec
    {caseLf = false;
     caseBr = fun l v r ->
              if n = v then true
              else if n < v then find3(l, n)
              else find3(r, n)}
    t

let find_gen n =
  let rec find t = 
    fold_wo_rec
      {caseLf = false;
       caseBr = fun l v r ->
                if n = v then true
                else if n < v then find l
                else find r}
      t
  in find

let find_gen n =
  let rec find_visitor =
    {caseLf = false;
     caseBr = fun l v r ->
              if n = v then true
              else if n < v then fold_wo_rec find_visitor l
              else fold_wo_rec find_visitor r}
  in find_visitor

(* Testing find *)
let test5 = fold_wo_rec (find_gen 30) t6  (* should be true *)
let test6 = fold_wo_rec (find_gen 13) t6  (* should be false *)
