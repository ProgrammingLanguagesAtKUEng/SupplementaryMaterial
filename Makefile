CURRENT_DIR=$(shell pwd)

java_example: $(wildcard java/*)
	@for f in $(shell ls -d java/*/);\
	do (\
		cd "$${f}";\
		echo "=== testing $${f} ===";\
		make);\
	done
