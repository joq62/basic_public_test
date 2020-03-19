all:
	rm -rf ebin/* src/*~;
	erlc -o ebin src/*.erl;
	cp src/*.app ebin;
	erl -pa ebin -s node_controller_service start -sname node_controller_service
test:
	rm -rf basic boot_service *_service include;
	git clone https://github.com/joq62/basic.git;
#	boot_service
	cp basic/boot_service/src/*.app ../ebin;
	cp -r basic/boot_service .;	
	cp basic/boot_service/src/*.app boot_service/ebin;
	erlc -D public -I basic/include -o boot_service/ebin boot_service/src/*.erl;
#	lib_service
	cp -r basic/lib_service .;	
	cp basic/lib_service/src/*.app lib_service/ebin;
	erlc -D local -I basic/include -o lib_service/ebin lib_service/src/*.erl;
#	test purpose
	erlc -D public -I basic/include -o test_ebin ../test_src/*.erl;
	erl -pa */ebin -pa ebin -pa test_ebin -s boot_service_tests start -sname test_boot_service
