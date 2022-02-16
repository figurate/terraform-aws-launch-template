SHELL:=/bin/bash
include .env

EXAMPLE=$(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))

.PHONY: all clean validate test docs format

all: validate test docs format

clean:
	rm -rf .terraform/

validate:
	$(TERRAFORM) init -reconfigure && $(TERRAFORM) validate

test: validate
	$(CHECKOV) -d /work
	$(TFSEC) /work

diagram:
	$(DIAGRAMS) diagram.py

docs: diagram
	$(TERRAFORM_DOCS) markdown ./ >./README.md && \
		$(TERRAFORM_DOCS) markdown ./modules/cloud-init >./modules/cloud-init/README.md && \
		$(TERRAFORM_DOCS) markdown ./modules/ecs-optimized >./modules/ecs-optimized/README.md

format:
	$(TERRAFORM) fmt -list=true ./ && \
		$(TERRAFORM) fmt -list=true ./modules/cloud-init && \
		$(TERRAFORM) fmt -list=true ./modules/ecs-optimized && \
		$(TERRAFORM) fmt -list=true ./examples/al2 && \
		$(TERRAFORM) fmt -list=true ./examples/ubuntu && \
		$(TERRAFORM) fmt -list=true ./examples/s3fs

example:
	$(TERRAFORM) init examples/$(EXAMPLE) && $(TERRAFORM) plan -input=false examples/$(EXAMPLE)
