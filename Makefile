.PHONY: build clean test doc format generator drivev3

build:
	dune build @install

test:
	dune runtest

format:
	./format_ocaml

install:
	dune install

uninstall:
	dune uninstall

clean:
	dune clean

doc:
	dune build @doc

generator:
	dune build tools/serviceGenerator.exe

drivev3: generator
	dune exec -- tools/serviceGenerator.exe -api drive -version v3
	
