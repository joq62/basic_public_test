%%% -------------------------------------------------------------------
%%% Author  : uabjle
%%% Description : dbase using dets 
%%% 
%%% Created : 10 dec 2012
%%% -------------------------------------------------------------------
-module(misc_test). 
   
%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------
-include_lib("eunit/include/eunit.hrl").
-include("common_macros.hrl").
%% --------------------------------------------------------------------



-compile(export_all).



%% ====================================================================
%% External functions


%------------------ misc_lib -----------------------------------
-define(SERVER_ID,"test_misc_lib").

start()->
    node_by_id(),
    unconsult(),

    ok.

node_by_id()->
    {ok,Host}=inet:gethostname(),
    PodIdServer=?SERVER_ID++"@"++Host,
    PodServer=list_to_atom(PodIdServer),
    ?assertEqual(PodServer,misc_lib:get_node_by_id(?SERVER_ID)).


unconsult()->
    L=[{vm_name,"pod_computer_1"},
       {vm,'pod_computer_1@asus'},
       {ip_addr,"localhost"},
       {port,40100},
       {mode,parallell},
       {worker_start_port,40101},
       {num_workers,5}],
    misc_lib:unconsult("computer_1.config",L),
    ?assertEqual({ok,[{vm_name,"pod_computer_1"},
		      {vm,'pod_computer_1@asus'},
		      {ip_addr,"localhost"},
		      {port,40100},
		      {mode,parallell},
		      {worker_start_port,40101},
		      {num_workers,5}]},file:consult("computer_1.config")),
    file:delete("computer_1.config"),
    ok.
