.PHONY: build clean test doc generator drivev3

build:
	dune build @install

test:
	dune runtest

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
	_build/default/tools/serviceGenerator.exe -api drive -version v3
	