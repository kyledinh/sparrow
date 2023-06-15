export SHELL := /bin/bash

## VARS AND ENVS
REPO_DIR ?= $(shell pwd | xargs echo -n)

## MAIN ####
.PHONY: check ingest run setup

check:
	@echo "Python3: $(shell python3 --version)"
	@echo "REPO_DIR: $(REPO_DIR)"
	@./scripts/check-system.sh

docker-build-data:
	@cd sparrow-data/api && docker build --tag kyledinh/sparrow-data .

docker-build-ui:
	@cd sparrow-ui && docker build --tag kyledinh/sparrow-ui .

docker-up-data:
	@open http://127.0.0.1:7860/api/v1/sparrow-data/docs
	@source .env && docker run -it --name sparrow-data -p 7860:7860 -e HUGGINGFACE_ACCESS_TOKEN -e SPARROW_KEY kyledinh/sparrow-data

docker-up-ui:
	@open http://127.0.0.1:7860
	@source .env && printenv && docker run -it --name sparrow-ui -p 7860:7860 kyledinh/sparrow-ui

docker-down:
	@docker stop sparrow-ui

docker-clean:
	@docker rm container sparrow-ui

setup:
	@echo "SETUP: update .env with your HUGGINGFACE_KEY"
	@cd scripts && ./setup-init.sh
	@cat .env
