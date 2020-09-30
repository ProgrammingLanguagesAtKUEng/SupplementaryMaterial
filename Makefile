CURRENT_DIR=$(shell pwd)

java_example: java/*
	@for f in $(shell ls java/);\
	do (\
		cd "java/$${f}";\
		echo "=== testing $${f} ===";\
		make);\
	done
