Google APIs Client library for OCaml
====================================

**gapi-ocaml** is a simple, unofficial, OCaml client for Google Services. The
library supports ClientLogin, OAuth 1.0a, and OAuth 2.0 authentication.
Supported RESTful APIs:

* Calendar APIs v3
* Google+ API v1
* Tasks API v1
* APIs Discovery Service v1
* URL Shortener API v1
* OAuth2 API v2
* Custom Search API v1
* Google Analytics API v3
* Page Speed Online API v1
* Blogger API v2
* Site Verification API v1
* AdSense Management API v1.1
* BigQuery API v2
* Drive API v2
* Drive API v3
* Gmail API v1

Google Data Protocol APIs (GData):

* Google Documents List API v3 (supports Google Drive)

### Features

* Monadic interface
* [Functional lenses](http://astrada.github.com/gapi-ocaml/GapiLens.html) to
  access data structures
* Service generator (experimental): a tool for generating client libraries for
  APIs based on the Google API Discovery format

Building gapi-ocaml
-------------------

### Requirements

You will need the following libraries:

* [OCaml][] >= 4.02.3
* [Findlib][] >= 1.2.7
* [Ocamlnet][] >= 4.1.4
* [Ocurl][] >= 0.5.3
* [Cryptokit][] >= 1.3.14
* [Yojson][] >= 1.0.2
* [Xmlm][] >= 1.0.2
* [OUnit][] >= 1.1.0 (to build and run the tests, optional)

This library was developed and tested on Ubuntu LTS (64-bit).

[OCaml]: http://www.ocaml.org/docs/install.html
[Findlib]: http://projects.camlcity.org/projects/findlib.html/
[Ocamlnet]: http://projects.camlcity.org/projects/ocamlnet.html
[Ocurl]: http://ygrek.org.ua/p/ocurl/
[Cryptokit]: https://github.com/xavierleroy/cryptokit
[Yojson]: http://mjambon.com/yojson.html
[Xmlm]: http://erratique.ch/software/xmlm
[OUnit]: http://ounit.forge.ocamlcore.org/

### Configuration and installation

This project provides 2 libraries:

* `gapi-ocaml`: Google APIs client library
* `gapi-ocaml.gdata`: Google Data Protocol client library

To build the libraries, run

    $ make

To install the libraries, run (as root, if your user doesn't have enough
privileges)

    $ make install

To build and run the tests, execute

    $ make test

See `src/test/README.md` for further details regarding the tests.

To build the examples:

    $ dune build @examples

See `examples/README.md` for further details regarding the examples.

To generate the documentation, run

    $ make doc

Then you can browse the HTML documentation starting from
`gapi-ocaml.docdir/index.html`, but is not installed by default.

To uninstall anything that was previously installed, execute

    $ make uninstall

### Usage

See auth examples in `examples/auth` for some examples of how to use Google's
authorization endpoints.

See `examples` directory to find code samples that show usage of some
services.

See `tools/serviceGenerator.ml` for a complex example of how to use functional
lenses within the state monad.

See `tools/README.md` for the instructions of how to build and run the service
generator utility.

