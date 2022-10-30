.PHONY: all
all: runtime-x86_64-windows runtime-x86_64-linux

.PHONY: shell
shell:
	sh

.PHONY: runtime-x86_64-windows
runtime-x86_64-windows:
	x86_64-w64-mingw32-cmake -B "build/x86_64/windows"
	cmake --build "build/x86_64/windows"

.PHONY: runtime-x86_64-linux
runtime-x86_64-linux:
	cmake -B "build/x86_64/linux"
	cmake --build "build/x86_64/linux"
