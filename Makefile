SHELL:=/bin/bash
include .env

EXAMPLE=$(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))

.PHONY: all clean validate test docs format

all: validate test docs format

clean:
	rm -rf .terraform/

validate:
	$(TERRAFORM) init && $(TERRAFORM) validate && \
		$(TERRAFORM) -chdir=modules/cloud-init init && $(TERRAFORM) -chdir=modules/cloud-init validate && \
		$(TERRAFORM) -chdir=modules/ansible init && $(TERRAFORM) -chdir=modules/ansible validate

test: validate
	$(CHECKOV) -d /work && \
		$(CHECKOV) -d /work/modules/cloud-init && \
		$(CHECKOV) -d /work/modules/ansible

	$(TFSEC) /work && \
		$(TFSEC) /work/modules/cloud-init && \
		$(TFSEC) /work/modules/ansible

diagram:
	$(DIAGRAMS) diagram.py

docs: diagram
	$(TERRAFORM_DOCS) markdown ./ >./README.md && \
		$(TERRAFORM_DOCS) markdown ./modules/cloud-init >./modules/cloud-init/README.md && \
		$(TERRAFORM_DOCS) markdown ./modules/ansible >./modules/ansible/README.md

format:
	$(TERRAFORM) fmt -list=true ./ && \
		$(TERRAFORM) fmt -list=true ./modules/cloud-init && \
		$(TERRAFORM) fmt -list=true ./examples/ecs && \
		$(TERRAFORM) fmt -list=true ./examples/al2 && \
		$(TERRAFORM) fmt -list=true ./examples/ubuntu && \
		$(TERRAFORM) fmt -list=true ./examples/s3fs

example:
	$(TERRAFORM) init examples/$(EXAMPLE) && $(TERRAFORM) plan -input=false examples/$(EXAMPLE)
