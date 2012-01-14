Note: **Click on `README.md` in the directory view to have working relative
links.**

Google APIs Client library for OCaml
====================================

**gapi-ocaml** is a simple, unofficial, OCaml client for Google Services. The
library supports ClientLogin, OAuth 1.0a, and OAuth 2.0 authentication.
Supported RESTful APIs:

* Calendar APIs v3 (JSON based)
* Google+ API v1
* Tasks API v1
* APIs Discovery Service v1
* URL Shortener API v1
* OAuth2 API v2

Old versions:

* Calendar Data API v2 (Atom based)

### Features

* Monadic interface
* [Functional lenses](src/gapi/gapiLens.mli) to access data structures
* Service generator (experimental): a tool for generating client libraries for
  APIs based on the Google API Discovery format.

Building gapi-ocaml
------------------

### Requirements

This library was developed with the following dependencies ([Unofficial OCaml
packages for Debian](http://ocaml.debian.net/debian/ocaml-3.12.1/)):

* [OCaml][] = 3.12.1
* [Findlib][] = 1.2.7
* [Ocamlnet][] = 3.3.5
* [Ocurl][] = 0.5.3
* [Cryptokit][] = 1.3.14
* [ExtLib][] = 1.5.1
* [json-wheel][] = 1.0.6
* [Xmlm][] = 1.0.2
* [pa_monad][] = 6.0 Syntax extension for Monads (optional)
* [OUnit][] = 1.1.0 to build and run the tests (optional)

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

### Configuration and installation

This project provides 2 libraries:

* gapi: Google APIs client library
* gdata: Google Data Protocol client library

and 1 executable:

* serviceGenerator: Tool used to generate strongly typed client libraries for
  Discovery-based services

To build and install the libraries and the executable, run

    $ ocaml setup.ml -configure
    $ ocaml setup.ml -build
    $ ocaml setup.ml -install

To run the tests, execute

    $ ocaml setup.ml -test

See [tests README](src/test/README.md) for further details regarding the tests.

To generate the documentation, run

    $ ocaml setup.ml -doc

Then you can browse the HTML documentation starting from
`gapi-ocaml.docdir/index.html`, but is not installed by default.

To uninstall anything that was previously installed, execute

    $ ocaml setup.ml -uninstall

### Usage

See [auth examples](src/examples/auth) for some examples of how to use
Google's authorization endpoints.

See [monadic test](src/test/testMonadic.ml) for an example of how to use the
monadic interface.

See [calendar v3 test](src/test/testCalendarModelV3.ml) for an example of how
to use functional lenses to read and modify calendar data.

See [tools README](src/tools/README.md) for the instructions of how to run the
service generator utility.

