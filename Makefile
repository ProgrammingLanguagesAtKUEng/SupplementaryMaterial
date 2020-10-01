CURRENT_DIR=$(shell pwd)

java_example: $(wildcard Java/*)
	@for f in $(shell ls -d Java/*/);\
	do (\
		cd "$${f}";\
		echo "=== testing $${f} ===";\
		make);\
	done
