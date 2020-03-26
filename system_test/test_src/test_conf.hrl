-define(app_spec,[{"master_service",1,["pod_master"]},{"dns_service",1,["pod_master"]},
			  {"log_service",1,["pod_master"]},
			{"adder_service",2,["pod_1","pod_2"]},
			  {"divi_service",1,["pod_3"]}
			 ]).



-define(node_config,[{"pod_master",'pod_master@asus',"joqhome.dynamic-dns.net",40000,parallell},
		     {"pod_1",'pod_1@asus',"joqhome.dynamic-dns.net",40001,parallell},
		     {"pod_2",'pod_2@asus',"joqhome.dynamic-dns.net",40002,parallell},
		     {"pod_3",'pod_3@asus',"joqhome.dynamic-dns.net",40003,parallell},
		     {"pod_4",'pod_4@asus',"joqhome.dynamic-dns.net",40004,parallell},
		     {"pod_5",'pod_5@asus',"joqhome.dynamic-dns.net",40005,parallell},
		     {"pod_6",'pod_6@asus',"joqhome.dynamic-dns.net",40006,parallell},
		     {"pod_40010",'pod_40010@raspberrypi',"joqhome.dynamic-dns.net",40010,parallell}]).


-define(catalog_info,[{{service,"adder_service"},{git,"https://github.com/joq62/basic.git"}},
		      {{service,"divi_service"},{git,"https://github.com/joq62/basic.git"}},
		      {{service,"dns_service"},{git,"https://github.com/joq62/basic.git"}},
		      {{service,"log_service"},{git,"https://github.com/joq62/basic.git"}},
		      {{service,"lib_service"},{git,"https://github.com/joq62/basic.git"}}]).
