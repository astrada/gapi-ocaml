Note: **Click on `README.md` in the directory view to have working relative
links.**

gapi-ocaml tests
================

**WARNING**: these tests will use write access to some Google services, so
if you want to run them, it is better to create a test account, and use it
instead of your real Google account (to avoid unpleasant side effects).

How to obtain credentials
-------------------------

### Client login

This authentication method uses username and password of the Google Account to
obtain a long lived token. This method should be used only for testing
purposes because leaking a token may give full read/write access to a
maliciuos user.

See [Auth examples](../../examples/auth/README.md) for instructions on how to
obtain an authorization token.

See [ClientLogin for Installed Applications](http://code.google.com/apis/accounts/docs/AuthForInstalledApps.html) for all the details.

### OAuth 1.0

If you don't have a registered Web Application, you can use the default
consumer key/secret: `anonymous/anonymous`. Otherwise, see [Registration for Web-Based Applications](http://code.google.com/apis/accounts/docs/RegistrationForWebAppsAuto.html)
for details on how to obtain your pair of consumer key/secret.

See [Auth examples](../../examples/auth/README.md) for instructions on how to
obtain an access token.

See [OAuth 1.0 for Web Applications](http://code.google.com/apis/accounts/docs/OAuth.html) for all the details.

See [OAuth Playground](http://googlecodesamples.com/oauth_playground/) for an
alternative way to obtain access tokens and to further experiment with the
Google OAuth 1.0 endpoint.

### OAuth 2.0

See [Auth examples](../../examples/auth/README.md) for instructions on how to
obtain a refresh token.

See [Using OAuth 2.0 for Web Server Applications](http://code.google.com/apis/accounts/docs/OAuth2WebServer.html) for all the details.

See [OAuth 2.0 Playground](https://code.google.com/oauthplayground/) for an
alternative way to obtain access tokens and to further experiment with the
Google OAuth 2.0 endpoint.

Configuring tests
-----------------

To run the test suite you need to provide a configuration file based on
[auth.config.template](../../config/auth.config.template) that contains the
credentials of the test account. So, create the configuration file
`auth.config` copying the template:

    $ cp auth.config.template auth.config

Then edit this file, and fill in the following fields:

Client login:

    cl_user=Google username
    cl_pass=Google password
    cl_token=client login long lived token

OAuth1:

    oa1_displayname=displayname
    oa1_cons_secret=consumer secret
    oa1_cons_key=consumer key
    oa1_callback=callback URI
    oa1_token=token
    oa1_secret=secret

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

To build the tests you will need to install
[pa_monad](http://www.cas.mcmaster.ca/~carette/pa_monad/). By default, the
test suite will run the tests that don't connect to Google services (and don't
need the authorization configuration)

    $ ocaml setup.ml -configure --enable-tests
    $ ocaml setup.ml -build
    $ ocaml setup.ml -test

To test the interaction with the remote services, you can use the `-service`
option to test a specific service (e.g. `urlshortener`, `tasks`, `plus`)

    $ ocaml setup.ml -test -service urlshortener

Or, to run all the tests, you can use the `-all` switch

    $ ocaml setup.ml -test -all

Run this command, to obtain all the details

    $ ocaml setup.ml -test -help

If the OAuth2 access token is expired, run this command (from the root
directory of the project) to refresh the token contained in the configuration
file `auth.config`

    $ ./refreshOAuth2Token.byte

If there are errors in the tests, switching to `true` the `debug` value in the
configuration file `auth.config` will activate the `ocurl` debug output, that
will trace all the HTTP interactions with Google services.

