CURRENT_DIR=$(shell pwd)
OUT_DIR=out
EXAMPLE_DIRS=$(shell ls -d Java/*)
EXAMPLE_NAMES=$(shell cd Java; ls -d *)

java_build: $(foreach dir,$(EXAMPLE_DIRS),${dir}/Main.java)
	@make $(foreach dir,${EXAMPLE_DIRS},${dir}/Main.class)
	
%/Main.class: %/Main.java
	@echo "building $*"
	@javac ${shell find $* -type f -name "*.java"}

.PHONY: java_run
java_run:
	@make $(foreach name,$(EXAMPLE_NAMES),${name})
	@echo "finished"

%: Java/%/Main.class
	@echo "=== Java/$* ===" 
	@java -cp Java/$* Main

.PHONY: clean
clean:
	rm Java/*/*.class Java/*/*/*.class
