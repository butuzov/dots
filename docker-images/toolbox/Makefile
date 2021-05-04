##################################################################
## toolbox image
##################################################################

help: ## Show this help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {sub("\\\\n",sprintf("\n%22c"," "), $$2);printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: clean ## Build docker image
	@docker build -t butuzov/toolbox -f Dockerfile .

run: ## Run docker image
	docker run --rm -it butuzov/toolbox /bin/bash

size: build ## Show image size
	@docker images | grep butuzov/toolbox | awk '{print $$NF}'

clean: ## Cleanup images and containers
	@docker ps -q -f "status=exited" | xargs -L1 docker rm
	@docker images -q -f "dangling=true" | xargs -L1 docker rmi
