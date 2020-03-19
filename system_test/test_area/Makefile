all:
	rm -rf basic *_service *.info *.spec *.config ../src/*~ test_ebin/* ../test_src/*~ ;
	git clone https://github.com/joq62/basic.git;
#	master_service
	cp -r basic/master_service .;	
	cp basic/master_service/src/*.app master_service/ebin;
	erlc -D public -I basic/include -o master_service/ebin master_service/src/*.erl;
#	lib_service
	cp -r basic/lib_service .;	
	cp basic/lib_service/src/*.app lib_service/ebin;
	erlc -D public -I basic/include -o lib_service/ebin lib_service/src/*.erl;
#	log_service
	cp -r basic/log_service .;	
	cp basic/log_service/src/*.app log_service/ebin;
	erlc -D public -I basic/include -o log_service/ebin log_service/src/*.erl;
#	dns_service
	cp -r basic/dns_service .;	
	cp basic/dns_service/src/*.app dns_service/ebin;
	erlc -D public -I basic/include -o dns_service/ebin dns_service/src/*.erl;
#	test
	erlc -D public -I basic/include -I ../test_src -o test_ebin ../test_src/*.erl;
#	remove basic
	rm -rf basic;

	erl -pa master_service/ebin -pa log_service/ebin -pa lib_service/ebin -pa dns_service/ebin  -pa test_ebin -s basic_public_test start -sname pod_master
