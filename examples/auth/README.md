gapi-ocaml examples
===================

How to obtain credentials
-------------------------

The preferred authorization mechanism to access Google services is OAuth 2.0,
the other authorization methods are useful for development purposes only.

All the utilities use a file named `auth.conf` that must be placed in
`../../config` to read authentication credentials.

You can start from the `auth.config.template` you can find in `../../config`:

    $ cp auth.config.template auth.config

and then fill in the values obtained by the following tools.

### Build the examples

    $ dune build @examples

### OAuth 2.0

To obtain an OAuth2 refresh token, you can use the `oauth2Flow` utility that
request an access token to your calendar feeds.

If you don't already have an OAuth2 client ID/secret, visit
https://code.google.com/apis/console/ to register your application:

 - Create a project (if it's the first time you access the API console)
 - Click on "APIs & Services" in the left menu
 - Click on "Credentials" submenu
 - Click the button labeled "+ Create credentials"
 - Select "OAuth client ID"
 - Select "Desktop app" as Application type
 - Give your credentials a name and click "Create"
 - Download the JSON file containing the client secret
 - Click on "Enabled APIs & services" in the left column
 - Turn on all the APIs you want to use

Then

 1. Fill in these values in `auth.conf`

        oa2_id=OAuth2 client ID from previous step
        oa2_secret=OAuth2 client secret from previous step
        oa2_port=8080 (or another port)

 2. Run the server

        $ cd example/auth
        $ dune build ./oauth2Flow.exe
        $ dune exec -- ./oauth2Flow.exe

This program will show a link to the Google authorization URL that you must
open using a web browser, then it will start a web server listening to port
`8091` (be sure that this port is not already in use). After signin in with
your Google account, you will be asked for authorization, then you will be
redirected to the page specified in the `oa2_callback` of the `auth.conf`
file. That page will show the access token and the refresh token. You can put
these values manually in `oa2_token` and `oa2_refresh` of the config file to
run tests based on OAuth2, or you can automatically save them using the `Save`
button of the form, then copy back the saved file to the `config` directory.

You can revoke the refresh token in your Google Account settings.

**Important!** Try to keep your client secret and developer key secret! Anyone
who has access to those can potentially abuse all the privileges granted to
your application.

