.DEFAULT_GOAL := menu

menu:
	@echo "╔═══════════════════════════════════════╗"
	@echo "║        to_bf — Command Menu           ║"
	@echo "╚═══════════════════════════════════════╝"
	@echo ""
	@echo "  === Development ==="
	@echo "  1) Run tests"
	@echo "  2) Run linter"
	@echo "  3) Open console"
	@echo ""
	@echo "  === Build ==="
	@echo "  4) Build gem"
	@echo "  5) Install locally"
	@echo ""
	@read -p "Enter choice: " choice; \
	case $$choice in \
		1) $(MAKE) test ;; \
		2) $(MAKE) lint ;; \
		3) $(MAKE) console ;; \
		4) $(MAKE) build ;; \
		5) $(MAKE) install ;; \
		*) echo "Invalid choice" ;; \
	esac

test:
	bundle exec rspec

lint:
	bundle exec rubocop

console:
	bin/console

build:
	gem build to_bf.gemspec

install: build
	gem install to_bf-*.gem

help:
	@echo "Available commands:"
	@echo "  make test     - Run RSpec tests"
	@echo "  make lint     - Run RuboCop"
	@echo "  make console  - Open IRB with gem loaded"
	@echo "  make build    - Build the gem"
	@echo "  make install  - Build and install locally"

list: help

.PHONY: menu test lint console build install help list
