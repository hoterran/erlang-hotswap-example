
one example, show how to swap erlang code online include inner state record 

#step

>os:cmd("cp swap_test1.erl swap_test.erl").

>c(swap_test).

>swap_test:start_link(0).

>swap_test:test_call().

>swap_test:test_call().

>os:cmd("cp swap_test2.erl swap_test.erl").

>compile:file(swap_test).

>sys:suspend(swap_test).

>code:purge(swap_test).

>code:load_file(swap_test).

>sys:change_code(swap_test, swap_test, "0", [3]).

>sys:resume(swap_test).

>swap_test:test_call().

>swap_test:test_call().



