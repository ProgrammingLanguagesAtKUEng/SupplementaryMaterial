CURRENT_DIR=$(shell pwd)

java: java/*
	@for f in $(shell ls java/);\
	do (\
		cd "java/$${f}";\
		echo "=== testing $${f} ===";\
		 javac *.java; java -cp . Main);\
	done

ocaml: ocaml/*
	