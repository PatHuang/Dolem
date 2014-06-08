TESTSUITE_AT +=        		\
	at/testdlm.at

EXTRA_SCRIPTS +=

EXTRA_DIST += 	

BUILT_SOURCES += at/placeholder

at/placeholder: Makefile
	@if ! test -d at; then \
		mkdir at;\
	fi; 
	@if ! test -f $@; then \
		touch $@; \
	fi;

