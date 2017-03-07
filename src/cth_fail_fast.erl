%% The contents of this file are subject to the Mozilla Public License
%% Version 1.1 (the "License"); you may not use this file except in
%% compliance with the License. You may obtain a copy of the License at
%% http://www.mozilla.org/MPL/
%%
%% Software distributed under the License is distributed on an "AS IS"
%% basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
%% License for the specific language governing rights and limitations
%% under the License.
%%
%% Copyright (c) 2017 Pivotal Software, Inc.  All rights reserved.
%%

-module(cth_fail_fast).

-include_lib("eunit/include/eunit.hrl").

%% API exports
-export([init/2, on_tc_fail/3]).

%%====================================================================
%% API functions
%%====================================================================

init(_Id, _Options) ->
    {ok, ok}.

on_tc_fail(_TestName, _Reason, State) ->
    ct_util:set_testdata({skip_rest, true}),
    State.

%%====================================================================
%% Internal functions
%%====================================================================

on_tc_fail_test() ->
    Result = ct:run_test([
        {suite, filename:join(["examples", "example_SUITE"])},
        {ct_hooks, cth_fail_fast},
        {logdir, "tmp"}
    ]),

    ?assertEqual({1, 1, {0, 1}}, Result).
