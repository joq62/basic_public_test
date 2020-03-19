%%% -------------------------------------------------------------------
%%% Author  : uabjle
%%% Description : 
%%% Production environment
%%% 
%%% 
%%% Created : 10 dec 2012
%%% -------------------------------------------------------------------
-module(basic_public_test). 
   
%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------
-include("common_macros.hrl").

%% --------------------------------------------------------------------

%% External exports
%-export([start/0]).
-compile(export_all).


%% ====================================================================
%% External functions
%% ====================================================================

%% --------------------------------------------------------------------
%% Function:tes cases
%% Description: List of test cases 
%% Returns: non
%% --------------------------------------------------------------------
start()->
    clean_start(),
    start_services:start(),
%    pod_master:start(),
  %  spawn(application_test:start() end),
 %   spawn(monkey_test:start() end),
    ok.

%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% --------------------------------------------------------------------
clean_start()->
    create_configs:start(),
    os:cmd("rm -rf latest.log"),
    {ok,NodesInfo}=file:consult("node.config"),
    L1=lists:keydelete(node(),2, NodesInfo),
    [rpc:call(Vm,init,stop,[])||{_,Vm,_,_}<-L1],
    [pod:delete(node(),VmName)||{VmName,_,_,_}<-L1],
    ok.
eunit_start()->
    ok.

clean_stop()->
   
    ok.

stop_computer_pods()->
    {ok,NodesInfo}=file:consult("node.config"),
    L1=lists:keydelete(node(),2, NodesInfo),
    [rpc:call(Vm,init,stop,[])||{_,Vm,_,_}<-L1],
    [pod:delete(node(),VmName)||{VmName,_,_,_}<-L1],
    ok.

eunit_stop()->
    [
   %  stop_service(lib_service),
     timer:sleep(1000),
     init:stop()].

%% --------------------------------------------------------------------
%% Function:support functions
%% Description: Stop eunit tests, set upp needed processes etc
%% Returns: non
%% --------------------------------------------------------------------

start_service(Service)->
    ok=application:start(Service).
check_started_service(Service)->
    {pong,_,Service}=Service:ping().
stop_service(Service)->
    ok=application:stop(Service),
    ok=application:unload(Service).

