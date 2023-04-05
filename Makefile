#include this ai teh top of your Makefile 

# -include .env
# export 

task:
	@date

some:
	@sleep 1
	@echo "sleep"

thing:
	@cal

VAR = 123

print_var:
	@echo ${VAR}

print_user:
	@echo $USER 

print_foo:
	@echo $$FOO

subshell:
	@echo $(shell echo ${USER})


greet: 
	@echo hello, ${NAME}!

bid:
	@echo bye