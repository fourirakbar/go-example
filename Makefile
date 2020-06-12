.PHONY: help setup dev destroy
.DEFAULT_GOAL := help

APP_NAME ?= go-app

help: ## List of help for this repository
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

setup: ## Setup project for the first time
	@echo "Setup project for the first time..."
	@pre-commit install

destroy: ## Destroy all
	@helm delete ${APP_NAME} --purge

dev: ## Deploy on GKE
	@helm install -n ${APP_NAME} helm-chart
