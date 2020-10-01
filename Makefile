CURRENT_DIR=$(shell pwd)
OUT_DIR=out
EXAMPLE_DIRS=$(shell ls -d Java/*)

java_example: $(foreach dir,$(EXAMPLE_DIRS),${dir}/Main.class)
	@echo "=== finished. ==="

%/Main.class: %/Main.java
	@echo "=== running $* ==="
	@javac ${shell find $* -type f -name "*.java"}
	@java -cp $* Main

.PHONY: clean
clean:
	rm Java/*/*.class Java/*/*/*.class
