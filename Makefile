SHELL:=/bin/bash
AWS_DEFAULT_REGION?=ap-southeast-2

TERRAFORM_VERSION=0.12.24
TERRAFORM=docker run --rm -v "${PWD}:/work" -v "${HOME}:/root" -e AWS_DEFAULT_REGION=$(AWS_DEFAULT_REGION) -e http_proxy=$(http_proxy) --net=host -w /work hashicorp/terraform:$(TERRAFORM_VERSION)

TERRAFORM_DOCS=docker run --rm -v "${PWD}:/work" tmknom/terraform-docs

CHECKOV=docker run --rm -v "${PWD}:/work" bridgecrew/checkov

TFSEC=docker run --rm -v "${PWD}:/work" liamg/tfsec

DIAGRAMS=docker run -v "${PWD}:/work" figurate/diagrams python

EXAMPLE=$(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))

.PHONY: all clean validate test docs format

all: validate test docs format

clean:
	rm -rf .terraform/

validate:
	$(TERRAFORM) init && $(TERRAFORM) validate && \
		$(TERRAFORM) init modules/cloud-init && $(TERRAFORM) validate modules/cloud-init && \
		$(TERRAFORM) init modules/ansible && $(TERRAFORM) validate modules/ansible

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
