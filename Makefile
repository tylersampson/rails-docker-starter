.DEFAULT_GOAL := help

build: ## build develoment environment	
	docker-compose run --rm web bundle install && yarn install

serve: up ## Run Serve

up: ## Run web container
	docker-compose up -d web

console: ## Run Rails console
	docker-compose run --rm web bundle exec rails c

bundle: ## Run bundle install
	docker-compose run --rm web bundle install

migrate:
	docker-compose run --rm web bundle exec rails db:migrate


.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'