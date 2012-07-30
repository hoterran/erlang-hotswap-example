-module(swap_test).
-vesion("0").
-behaviour(gen_server).

-export([start_link/1, test_call/0]).

-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-define(SERVER,	swap_test).

-record(state, {counter}).

start_link(Start) ->
	gen_server:start_link({local, ?SERVER}, ?MODULE, [Start], []).

test_call() ->
	gen_server:call(?SERVER, counter).

%%
%% CALLBACK
%%

init([Start]) ->
	io:format("Args is ~p~n", [Start]),
	{ok, #state{counter=Start}}.

handle_call(Msg, {From,_}, State) ->
	io:format("call ~p ~p~n", [Msg, From]),
	Counter = State#state.counter,
	{reply, Counter, State#state{counter = Counter + 1}}.

handle_cast(Msg, State) ->
	io:format("cast ~p~n", [Msg]),
	{noreply, State}.

handle_info(Info, State) ->
	io:format("info ~p~n", [Info]),
	{stop, normal, State}.

terminate(Reason, _State) ->
	io:format("stop ~p~n", [Reason]),
	ok.

code_change(_OldVsn, _State, _Extra) ->
	{ok, _State}.

