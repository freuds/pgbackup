SHELL:=/bin/bash -eu

# define standard colors
BLACK        := $(shell tput -Txterm setaf 0)
RED          := $(shell tput -Txterm setaf 1)
GREEN        := $(shell tput -Txterm setaf 2)
YELLOW       := $(shell tput -Txterm setaf 3)
LIGHTPURPLE  := $(shell tput -Txterm setaf 4)
PURPLE       := $(shell tput -Txterm setaf 5)
BLUE         := $(shell tput -Txterm setaf 6)
WHITE        := $(shell tput -Txterm setaf 7)
RESET        := $(shell tput -Txterm sgr0)

.PHONY: default install install-db test
default: help

##########################################################################
## This command manage helm release with the cluster Kubernetes
## Usage:
##	make <command>
##
## Available Commands:
##  - make help : Display help for this command (default)
help:
		@cat $(MAKEFILE_LIST) | grep ^\#\# | grep -v ^\#\#\# |cut -c 4-

##  - make install-db : Install docker postgres + inject sample table
install-db:
		@./db/db_setup.sh

##  - make install : Create env with pip
install:
		pipenv install --dev --skip-lock

##  - make test : launch pytest on src directory
test:
		# pipenv install --dev pytest pytest-mock boto3
		PYTHONPATH=./src pytest