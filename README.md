cth_fail_fast
=====

A Common Test hook that skips all tests on first failure.

To use with CT, run `ct_run -ct_hooks cth_fail_fast`

Build
-----

    $ rebar3 compile

Test
-----

    $ rebar3 eunit
