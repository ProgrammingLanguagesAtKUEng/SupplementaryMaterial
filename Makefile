CURRENT_DIR=$(shell pwd)
OUT_DIR=out
EXAMPLE_DIRS=$(shell ls -d Java/*)

java_example: $(foreach dir,$(EXAMPLE_DIRS),${dir}/Main.class)
	@echo "=== finished. ==="

%/Main.class: $(wildcard %/*.java) $(wildcard %/**/*.java)
	@echo "=== running $* ==="
	@javac $^
	@java -cp $* Main

.PHONY: clean
clean:
	rm Java/*/*.class Java/*/*/*.class
