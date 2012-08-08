-module(e3).
-compile(export_all).

start() ->
	register(?MODULE, spawn(?MODULE, loop, [])).

switch() ->
	?MODULE ! code_switch.

compile() ->
	compile:file(?MODULE),
	code:purge(?MODULE),
	code:load_file(?MODULE).

msg() ->
	?MODULE ! hello.

loop() ->
    receive
        code_switch ->
            ?MODULE:loop();
        _ ->
			io:format("~p~n", ["bb"]),
            loop()
    end.
