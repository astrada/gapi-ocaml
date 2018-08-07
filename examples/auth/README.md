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

### Client login

To obtain an authorization token, you can use the `clientLoginFlow` utility
that request an access token to your calendar feeds.

 1. Fill in these values in `auth.conf`

        cl_user=Google account username
        cl_pass=Google account password

 2. Run the program

        $ _build/default/examples/auth/clientLoginFlow.exe

This program will print the obtained authorization token that you can put in
`cl_token` of the config file to run tests based on Client Login.

**WARNING**: There is no easy way to revoke an authorization token obtained
in this way. So, be careful to not disclose these values online.

### OAuth 1.0

To obtain an OAuth token and corresponding secret, you can use the oauth1Flow
utility that request an access token to your calendar feeds.

 1. Fill in these values in `auth.conf`

        oa1_displayname=anonymous
        oa1_cons_secret=anonymous
        oa1_cons_key=anonymous
        oa1_callback=http://localhost:8091/oauth1callback

 2. Run the server

        $ _build/default/examples/auth/oauth1Flow.exe

This program will show a link to the Google authorization URL that you must
open using a web browser, then it will start a web server listening to port
`8091` (be sure that this port is not already in use). After signin in with
your Google account, you will be asked for authorization, then you will be
redirected to the page specified in the `oa1_callback` of the `auth.conf`
file. That page will show the access token with its corresponding secret. You
can put these values manually in `oa1_token` and `oa1_secret` of the config
file to run tests based on OAuth1, or you can automatically save them using
the `Save` button of the form, then copy back the saved file to the `config`
directory.

You can revoke the access token in your Google Account settings.

### OAuth 2.0

To obtain an OAuth2 refresh token, you can use the `oauth2Flow` utility that
request an access token to your calendar feeds.

If you don't already have an OAuth2 client ID/secret, visit
https://code.google.com/apis/console/ to register your application:

 - Create a project (if it's the first time you access the API console)
 - Click on "API Access" in the left column
 - Click the button labeled "Create an OAuth2 client ID"
 - Give your application a name and click "Next"
 - Select "Web Application" as the "Application type"
 - Under "Your Site or Hostname" select http:// as the protocol and enter
   "localhost:8091" for the domain name
 - Click "Create client ID"
 - Click on "Services" in the left column
 - Turn on all the APIs you want to use

Then

 1. Fill in these values in `auth.conf`

        oa2_id=OAuth2 client ID from previous step
        oa2_secret=OAuth2 client secret from previous step
        oa2_uri=http://localhost:8091/oauth2callback

 2. Run the server

        $ _build/default/examples/auth/oauth2Flow.exe

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

