all: llvmir assembly
CC=/goshawk/llvm-project/build/bin/clang

llvmir:
	$(CC) -O3 -emit-llvm -S --target=aarch64 test.c -o test.ll
assembly:
	$(CC) -O3 -S --target=aarch64 test.c -o test.s
clean:
	rm -rf test.ll test.s
