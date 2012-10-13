# Example1

show how to upgrade erlang code online, which include inner state record change. 

first, we have a gen server swap_test.

this is counter program, each call will show inner state counter, than incrment this counter, step is 1.

now, we need change code, can setup random step, with running gen process.

## step

swap_test1.erl is old version code, swap_test2.erl is new version.

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

now the new step become 3 .

##code 

you can see this chinese blog for [detail](http://www.hoterran.info/erlang-otp-sys-sourcecode)


#Example2


how to kill old code process

    1> c(e3).
    {ok,e3}
    2> e3:start().
    true
    3> whereis(e3).
    <0.41.0>
    4> c(e3).
    {ok,e3}
    5> whereis(e3).
    <0.41.0>
    6> c(e3).
    {ok,e3}
    7> whereis(e3).
    undefined

the second c(e3) kill old code process

#Example3

##upgrade

>> c(e3).
{ok,e3}
>> e3:start().
true
>> e3:msg().
"aa"
hello

modify code ``aa`` to ``bb``

>> e3:compile().
{module,e3}
>> e3:msg(). 
hello
"aa"

yes cant change, still old code, now switch

>> e3:switch().
code_switch
8> e3:msg(). 
"bb"
hello

