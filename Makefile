.PHONY: start stop bash logs status jasmine phpunit clean

MAKEPATH := $(abspath $(lastword $(MAKEFILE_LIST)))
PWD := $(dir $(MAKEPATH))

TTY_PARAM := $(shell tty > /dev/null && echo "" || echo "-T")
WINPTY := $(shell command -v winpty && echo "winpty " ||  echo "")


start: stop
	docker-compose up -d
	$(WINPTY)docker-compose exec $(TTY_PARAM) blade bash -c "composer install -n"

stop:
	docker-compose down

bash:
	$(WINPTY)docker-compose exec $(TTY_PARAM) blade bash