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
* Functional lenses to access data structures
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

### Building

To build the library, execute

    $ cd src
    $ ocamlbuild gdata/gdata.cma

To build the tests, execute

    $ cd src
    $ ocamlbuild test/testSuite.byte

To run the tests, see [tests README](src/test/README.md).

To generate the documentation, execute

    $ cd src
    $ ocamlbuild gapi/gapi.docdir/index.html

Then you can access the HTML documentation starting from
`src/gapi.docdir/index.html`.

### Usage

See [auth examples](src/examples/auth) for some examples of how to use
Google's authorization endpoints.

See [monadic test](src/test/testMonadic.ml) for an example of how to use the
monadic interface.

See [calendar v3 test](src/test/testCalendarModelV3.ml) for an example of how
to use functional lenses to read and modify calendar data.

