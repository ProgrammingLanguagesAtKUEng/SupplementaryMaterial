# 工学部専門科目「プログラミング言語」(2020年度)

## 実行方法

### Java

+ すべての例をビルド
   ```console
   make java_build
   ```
+ すべての例を実行
   ```console
   make java_run
   ```
+ 特定の例を実行(`polyBSTPolyVisitor`の場合)
   ```console
   make polyBSTPolyVisitor
   ```

### OCaml

それぞれの実装は，`OCaml/src/` にあります．`OCaml/main.ml` は，それぞれの実装を呼び出して，テストを定義しています．

+ すべての例をビルドしてテストを実行
   ```console
   make ocaml_run
   ```
+ (注) 実行には [ounit2](https://github.com/gildor478/ounit) と [dune](https://github.com/ocaml/dune) が必要です．
   ```console
   opam install ounit2 dune
   ```
