all: clean generate form fmt build

codegen: clean generate form fmt build

clean:
	rm -rf src/

generate:
	svd2rust --target xtensa-lx -i svd/esp32s2.svd

form:
	form -i lib.rs -o src/
	rm lib.rs

fmt:
	cargo fmt

build:
	cargo clean
	cargo +esp build -Zbuild-std --target xtensa-esp32-none-elf
