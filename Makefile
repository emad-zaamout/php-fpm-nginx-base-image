.PHONY: help ps build build-prod start fresh fresh-prod stop restart destroy \
	cache cache-clear migrate migrate migrate-fresh tests tests-html

BASE_IMAGE_NAME=laravel-base-image

help: ## Print help.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

build-all: ## Build local and prod containers.
	@make -j 2 build-local build-prod

build-local: ## Build local containers.
	@docker build --no-cache . -t local-${BASE_IMAGE_NAME} -f ./Dockerfile.local

build-prod: ## Build prod containers.
	@docker build --no-cache . -t prod-${BASE_IMAGE_NAME} -f ./Dockerfile
