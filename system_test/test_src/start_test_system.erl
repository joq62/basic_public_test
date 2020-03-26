%%% -------------------------------------------------------------------
%%% Author  : uabjle
%%% Description : dbase using dets 
%%%
%%% {"pod_master",'pod_master@asus',"localhost",40000,parallell}.
%%% {"pod_landet_1",'pod_landet_1@asus',"localhost",50100,parallell}.
%%% {"pod_lgh_1",'pod_lgh_1@asus',"localhost",40100,parallell}.
%%% {"pod_lgh_2",'pod_lgh_2@asus',"localhost",40200,parallell}.
%%%
%%% {"adder_service",2,["pod_landet_1","pod_lgh_2"]}.
%%% {"divi_service",1,[]}.
%%% 
%%% 
%%% Created : 10 dec 2012
%%% -------------------------------------------------------------------
-module(start_test_system).  
   
%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------
-include_lib("eunit/include/eunit.hrl").
-include("common_macros.hrl").

%% --------------------------------------------------------------------
-compile(export_all).



%% ====================================================================
%% External functions
%% ====================================================================

%% --------------------------------------------------------------------
%% Function:emulate loader
%% Description: requires pod+container module
%% Returns: non
%% --------------------------------------------------------------------
start()->
    start_nodes(),
    timer:sleep(10*1000),
    check_nodes(),
    ok.




%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% -------------------------------------------------------------------
check_nodes()->
    NodesInfo=master_service:nodes(),
   
    ?assertMatch([],
		 lib_master:check_missing_nodes(NodesInfo)),
 %   ?assertMatch(glurk,dns_service:all()),
    ok.
    



%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% -------------------------------------------------------------------
start_nodes()->
    %% Create worker pods 
    {ok,NodeList}=file:consult(?NODE_CONFIG),
%    WorkerList=[{NodeId,Node,IpAddr,Port,Mode}||{NodeId,Node,IpAddr,Port,Mode}<-NodeList,
%						NodeId=/="pod_master"],
    W1=lists:keydelete("pod_master",1,NodeList),
    WorkerList=lists:keydelete("pod_40010",1,W1),
    IpInfoComputer={"joqhome.dynamic-dns.net",40000},
    NeededServices=[{{service,"lib_service"},{git,"https://github.com/joq62/basic.git"}}],
  
%  ?assertMatch([ok,ok,ok],[lib_master:start_pod(IpInfoComputer,NodeComputer,
%						  {Node,NodeId,IpAddrPod,PortPod,ModePod},
%						  NeededServices)
%		 ||{NodeId,Node,IpAddrPod,PortPod,ModePod}<-WorkerList]),
    ?assertMatch([ok,ok,ok,ok,ok,ok],[tcp_client:call(IpInfoComputer,{lib_master,start_pod,
							     [{"joqhome.dynamic-dns.net",40000},
							      {NodeId,IpAddrPod,PortPod,ModePod},
							      NeededServices]},?CLIENT_TIMEOUT)
		     ||{NodeId,_Node,IpAddrPod,PortPod,ModePod}<-WorkerList]),
    ok.



%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% -------------------------------------------------------------------


