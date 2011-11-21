Note: **Click on `README.md` in the directory view to have working relative
links.**

Google APIs Client library for OCaml
====================================

**gapi-ocaml** is a simple, unofficial, OCaml client for Google Services.
The library supports ClientLogin, OAuth1.0a, and OAuth2.0 authentication.
Supported APIs:

* Calendar Data API


Building gapi-ocaml
------------------

### Requirements

This library was developed with the following dependencies (versions found in
Ubuntu 11.04):

* [OCaml][] = 3.11.2
* [Findlib][] = 1.2.5
* [Ocamlnet][] = 2.2.9
* [Ocurl][] = 0.5.3
* [Cryptokit][] = 1.3.14
* [ExtLib][] = 1.5.1
* [json-wheel][] = 1.0.6
* [Xmlm][] = 1.0.2
* [pa_monad][] = 6.0 Syntax extension for Monads (optional)
* [OUnit][] = 1.0.3 to build and run the tests (optional)

[OCaml]: http://caml.inria.fr/ocaml/release.en.html
[Findlib]: http://projects.camlcity.org/projects/findlib.html/
[Ocamlnet]: http://projects.camlcity.org/projects/ocamlnet.html
[Ocurl]: http://sourceforge.net/projects/ocurl/
[Cryptokit]: http://forge.ocamlcore.org/projects/cryptokit/
[ExtLib]: http://code.google.com/p/ocaml-extlib/
[json-wheel]: http://martin.jambon.free.fr/json-wheel.html
[Xmlm]: http://erratique.ch/software/xmlm/doc/Xmlm
[pa_monad]: http://www.cas.mcmaster.ca/~carette/pa_monad/
[OUnit]: http://ounit.forge.ocamlcore.org/

### Building

To build the library, execute

    $ cd src
    $ ocamlbuild gdata/gdata.cma

To build the tests, execute

    $ cd src
    $ ocamlbuild test/testSuite.byte

To run the tests, see [tests README](src/test/README.md).

### Usage

See [auth examples](src/examples/auth) for some examples of how to use
Google's authorization endpoints.

See [monadic test](src/test/testMonadic.ml) for an example of how to use the
monadic interface.

