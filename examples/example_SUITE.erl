-module(example_SUITE).

-export([all/0, pass/1, fail/1, auto_skip/1]).

all() ->
    [
     pass,
     fail,
     auto_skip
    ].

pass(_) ->
    ok.

fail(_) ->
    throw(fail).

auto_skip(_) ->
    ok.
