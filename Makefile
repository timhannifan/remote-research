# Makefile for Anthropic MCP Chatbot

.PHONY: help setup up down logs clean

# Default target
help: ## Show available commands
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-15s %s\n", $$1, $$2}'

# Setup
setup: ## Copy .env.example to .env
	@if [ ! -f .env ]; then \
		cp .env.example .env; \
		echo "✓ Created .env from .env.example"; \
		echo "⚠ Please edit .env and add your ANTHROPIC_API_KEY"; \
	else \
		echo "⚠ .env already exists"; \
	fi

# Docker operations
up: setup ## Start all services
	docker compose up --build

down: ## Stop all services
	docker compose down

logs: ## Show logs from all services
	docker compose logs -f

# Cleanup
clean: ## Remove containers and clean up
	docker compose down -v --remove-orphans
	docker system prune -f
