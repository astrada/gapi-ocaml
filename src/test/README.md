gapi-ocaml tests
================

**WARNING**: these tests will use write access to some Google services, so
if you want to run them, it is better to create a test account, and use it
instead of your real Google account (to avoid unpleasant side effects).

How to obtain credentials
-------------------------

### OAuth 2.0

See `../../examples/auth/README.md` for instructions on how to obtain a
refresh token.

See [Using OAuth 2.0 for Web Server Applications](http://code.google.com/apis/accounts/docs/OAuth2WebServer.html) for all the details.

See [OAuth 2.0 Playground](https://code.google.com/oauthplayground/) for an
alternative way to obtain access tokens and to further experiment with the
Google OAuth 2.0 endpoint.

Configuring tests
-----------------

To run the test suite you need to provide a configuration file based on
`auth.config.template` (you can find in `../../config`) that contains the
credentials of the test account. So, create the configuration file
`auth.config` copying the template:

    $ cp auth.config.template auth.config

Then edit this file, and fill in the following fields:

OAuth2:

    oa2_id=client ID from API console
    oa2_secret=client secret from API console
    oa2_uri=callback URI from API console
    oa2_token=access token
    oa2_refresh=refresh token

Additional parameters:

    key=API key (The API key is displayed in the Simple API Access section)
    debug=enable/disable debugging output (true/false)

`auth.config` example:

    cl_user=username@gmail.com
    cl_pass=password
    cl_token=ZZZAAA
    oa1_displayname=anonymous
    oa1_cons_key=anonymous
    oa1_cons_secret=anonymous
    oa1_callback=oob
    oa1_token=123ABCDEF
    oa1_secret=abcdefg
    oa2_id=111111111111.apps.googleusercontent.com
    oa2_secret=abcdefg
    oa2_uri=http://localhost:8091/oauth2callback
    oa2_token=bbbaaaddd
    oa2_refresh=000aaAADD
    key=12121212121212121212121
    debug=false

Running the tests
-----------------

By default, the test suite will run the tests that don't connect to Google
services (and don't need the authorization configuration)

    $ make test

To test the interaction with the remote services, you can use the `-service`
option to test a specific service (e.g. `urlshortener`, `tasks`, `plus`)

    $ dune build @runtest-urlshortener

Or, to run all the tests, you can use the `-all` switch

    $ dune build @runtest-all

If the OAuth2 access token is expired, run this command (from the root
directory of the project) to refresh the token contained in the configuration
file `auth.config`

    $ cd src/test
    $ dune build ./refreshOAuth2Token.exe
    $ dune exec -- ./refreshOAuth2Token.exe

If there are errors in the tests, switching to `true` the `debug` value in the
configuration file `auth.config` will activate the `ocurl` debug output, that
will trace all the HTTP interactions with Google services.
