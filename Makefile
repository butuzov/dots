export BIN    := $(PWD)/bin
export PATH   := $(BIN):$(PATH)
export SHELL  := bash
export OSTYPE := $(shell uname -s)

# Include functionality
version = $(or $(word 2,$(subst v, ,$1)),$(word 1,$(subst v, ,$1)))

include scripts/Makefile/Makefile

# ========= Install Tools ============================================================== #
ACT_VERSION:=0.2.24
install_tools: act

AIR_VERSION:=1.27.3
install_tools: air

EVANS_VERSION:=0.9.2
install_tools: evans

# DOCKER_SQUASH_VERSION:=0.2.0
# install_tools: docker-squash

GOLANGCI-LINT_VERSION:=1.42.1
install_tools: golangci-lint

GOTESTSUM_VERSION:=1.6.4
install_tools: gotestsum

GRPCURL_VERSION:=1.8.0
install_tools: grpcurl

# GOSEC_VERSION:=2.6.1
# install_tools: gosec

MOCKERY_VERSION:=2.5.1
install_tools: mockery

PROTOC_VERSION:=3.14.0
install_tools: protoc

PROTOC_GEN_GO_VERSION:=1.25.0
install_tools: protoc-gen-go

PROTOC_GET_GO_GRPC_VERSION:=1.1.0
install_tools: protoc-gen-go-grpc

# # PROTOC-GEN-BQ-SCHEMA_VERSION:=1.0
# # install_tools: protoc-gen-bq-schema

# PROTOCS_GEN_JSONSCHEMA_VERSION:=0.9.7
# install_tools: protoc-gen-jsonschema

# PROTOC_GEN_MICRO_VERSION:=3.0.4
# install_tools: protoc-gen-micro

# PROTOC_GEN_OPENAPI_VERSION:=3.0.4
# install_tools: protoc-gen-openapi

# PROTOC_GEN_VALIDATE_VERSION:=0.4.1
# install_tools: protoc-gen-validate

TPARSE_VERSION:=0.8.3
install_tools: tparse

# WIRE_VERSION:=0.5.0
# install_tools: wire

MIGRATE_VERSION:=4.14.1
install_tools: migrate

TERN_VERSION:=0.12.3
install_tools: tern

ALI_VERSION:=0.5.4
install_tools: ali

HUGO_VERSION:=0.86.1
install_tools: hugo

# VELERO_VERSION:=1.5.3
# install_tools: velero

MINIKUBE_VERSION:=1.22.0
install_tools: minikube

# HELM_VERSION:=3.2.1
# install_tools: helm

# KUBECTL_VERSION:=1.18.2
# install_tools: kubectl

# OCTANT_VERSION:=0.16.3
# install_tools: octant

TASK_VERSION:=3.2.2
install_tools: task

install: install_tools

# ========= Tools ====================================================================== #
# --- chamber ----------------------------------------------------------------------------
CHAMBER_VERSION:=2.9.1
install_tools: chamber

chamber: bin/chamber-$(CHAMBER_VERSION)
	@ ln -sf chamber-$(CHAMBER_VERSION) ./bin/$@

bin/chamber-$(CHAMBER_VERSION):
	@ $(MAKE) bin/chamber

.PHONY: bin/chamber
bin/chamber: GITHUB=segmentio/chamber
bin/chamber: VERSION=$(CHAMBER_VERSION)
bin/chamber: ARCHIVE=chamber-v$(VERSION)-darwin-amd64
bin/chamber: ARCHIVE_PATH=chamber
bin/chamber:
	@ printf "Install chamber... \n"
	@ curl -Ls $(shell echo $(call github_url) | tr A-Z a-z) > $@ && chmod +x $@
	@ echo "done."


# --- act --------------------------------------------------------------------------------
act: bin/act-$(ACT_VERSION)
	@ ln -sf act-$(ACT_VERSION) ./bin/$@

bin/act-$(ACT_VERSION):
	@ $(MAKE) bin/act

.PHONY: bin/act
bin/act: GITHUB_REPOSITORY=nektos/act
bin/act: GITHUB_VERSION=v$(ACT_VERSION)
bin/act: GITHUB_ARCHIVE=act_Darwin_x86_64.tar.gz
bin/act: ARCHIVE_PATH=act
bin/act:
	$(call install/github/release/tgz,$@)


# --- air --------------------------------------------------------------------------------
air: bin/air-$(AIR_VERSION)
	@ ln -sf air-$(AIR_VERSION) ./bin/$@

bin/air-$(AIR_VERSION):
	@ $(MAKE) bin/air

.PHONY: bin/air
bin/air: GITHUB_REPOSITORY=cosmtrek/air
bin/air: GITHUB_VERSION=v$(AIR_VERSION)
bin/air: GITHUB_ARCHIVE=air_%s_darwin_amd64.tar.gz
bin/air: ARCHIVE_PATH=air
bin/air:
	$(call install/github/release/tgz,$@)

# --- evans ------------------------------------------------------------------------------
evans: bin/evans-$(EVANS_VERSION)
	@ ln -sf evans-$(EVANS_VERSION) ./bin/$@

bin/evans-$(EVANS_VERSION):
	@ $(MAKE) bin/evans

.PHONY: bin/evans
bin/evans: GITHUB_REPOSITORY=ktr0731/evans
bin/evans: GITHUB_VERSION=$(EVANS_VERSION)
bin/evans: GITHUB_ARCHIVE=evans_darwin_amd64.tar.gz
bin/evans: ARCHIVE_PATH=evans
bin/evans:
	$(call install/github/release/tgz,$@)


# --- docker squash ----------------------------------------------------------------------
docker-squash: bin/docker-squash-$(DOCKER_SQUASH_VERSION)
	@ ln -sf docker-squash-$(DOCKER_SQUASH_VERSION) ./bin/$@

bin/docker-squash-$(DOCKER_SQUASH_VERSION):
	@ $(MAKE) bin/docker-squash

.PHONY: bin/docker-squash
bin/docker-squash: GITHUB_REPOSITORY=jwilder/docker-squash
bin/docker-squash: GITHUB_VERSION=v$(DOCKER_SQUASH_VERSION)
bin/docker-squash: GITHUB_ARCHIVE=docker-squash-darwin-amd64-$(GITHUB_VERSION).tar.gz
bin/docker-squash: ARCHIVE_PATH=docker-squash
bin/docker-squash:
	$(call install/github/release/tgz,$@)

# --- golangci-lint ----------------------------------------------------------------------
golangci-lint: bin/golangci-lint-$(GOLANGCI-LINT_VERSION)
	@ ln -sf golangci-lint-$(GOLANGCI-LINT_VERSION) ./bin/$@

bin/golangci-lint-$(GOLANGCI-LINT_VERSION):
	@ $(MAKE) bin/golangci-lint

.PHONY: bin/golangci-lint
bin/golangci-lint: GITHUB_REPOSITORY=golangci/golangci-lint
bin/golangci-lint: GITHUB_VERSION=v$(GOLANGCI-LINT_VERSION)
bin/golangci-lint: GITHUB_ARCHIVE="golangci-lint-%s-darwin-amd64.tar.gz"
bin/golangci-lint: ARCHIVE_PATH=$(shell printf golangci-lint-%s-darwin-amd64/golangci-lint $(subst v,,$(GITHUB_VERSION)))
bin/golangci-lint:
	$(call install/github/release/tgz,$@)


# --- gotestsum --------------------------------------------------------------------------
gotestsum: bin/gotestsum-$(GOTESTSUM_VERSION)
	@ ln -sf gotestsum-$(GOTESTSUM_VERSION) ./bin/$@

bin/gotestsum-$(GOTESTSUM_VERSION):
	@ $(MAKE) bin/gotestsum

.PHONY: bin/gotestsum
bin/gotestsum: GITHUB_REPOSITORY=gotestyourself/gotestsum
bin/gotestsum: GITHUB_VERSION=v$(GOTESTSUM_VERSION)
bin/gotestsum: GITHUB_ARCHIVE=gotestsum_%s_darwin_amd64.tar.gz
bin/gotestsum: ARCHIVE_PATH=gotestsum
bin/gotestsum:
	$(call install/github/release/tgz,$@)

# --- grpcurl ----------------------------------------------------------------------------
grpcurl: bin/grpcurl-$(GRPCURL_VERSION)
	@ ln -sf grpcurl-$(GRPCURL_VERSION) ./bin/$@

bin/grpcurl-$(GRPCURL_VERSION):
	@ $(MAKE) bin/grpcurl

.PHONY: bin/grpcurl
bin/grpcurl: GITHUB_REPOSITORY=fullstorydev/grpcurl
bin/grpcurl: GITHUB_VERSION=v$(GRPCURL_VERSION)
bin/grpcurl: GITHUB_ARCHIVE=grpcurl_%s_osx_x86_64.tar.gz
bin/grpcurl: ARCHIVE_PATH=grpcurl
bin/grpcurl:
	$(call install/github/release/tgz,$@)

# --- gosec ------------------------------------------------------------------------------
gosec: bin/gosec-$(GOSEC_VERSION)
	@ ln -sf gosec-$(GOSEC_VERSION) ./bin/$@

bin/gosec-$(GOSEC_VERSION):
	@ $(MAKE) bin/gosec

.PHONY: bin/gosec
bin/gosec: GITHUB_REPOSITORY=securego/gosec
bin/gosec: GITHUB_VERSION=v$(GOSEC_VERSION)
bin/gosec: GITHUB_ARCHIVE=gosec_%s_darwin_amd64.tar.gz
bin/gosec: ARCHIVE_PATH=gosec
bin/gosec:
	$(call install/github/release/tgz,$@)

# --- mockery ----------------------------------------------------------------------------
mockery: bin/mockery-$(MOCKERY_VERSION)
	@ ln -sf mockery-$(MOCKERY_VERSION) ./bin/$@

bin/mockery-$(MOCKERY_VERSION):
	@ $(MAKE) bin/mockery

.PHONY: bin/mockery
bin/mockery: GITHUB_REPOSITORY=vektra/mockery
bin/mockery: GITHUB_VERSION=v$(MOCKERY_VERSION)
bin/mockery: GITHUB_ARCHIVE=mockery_%s_Darwin_x86_64.tar.gz
bin/mockery: ARCHIVE_PATH=mockery
bin/mockery:
	$(call install/github/release/tgz,$@)


# --- protoc -----------------------------------------------------------------------------
protoc: bin/protoc-$(PROTOC_VERSION)
	@ ln -sf protoc-$(PROTOC_VERSION) ./bin/$@

bin/protoc-$(PROTOC_VERSION):
	@ $(MAKE) bin/protoc

.PHONY: bin/protoc
bin/protoc: GITHUB_REPOSITORY=protocolbuffers/protobuf
bin/protoc: GITHUB_VERSION=v$(PROTOC_VERSION)
bin/protoc: GITHUB_ARCHIVE=protoc-%s-osx-x86_64.zip
bin/protoc: ARCHIVE_PATH=bin/protoc
bin/protoc:
	$(call install/github/release/protoc,$@)

	# Additional rule - copy include into gopath/src dir
	@ unzip -qqo $(shell printf $(GITHUB_ARCHIVE) $(subst v,,$(GITHUB_VERSION))) \
		include/google/* -d $(GOPATH)/src
	@ unlink $(shell printf $(GITHUB_ARCHIVE)  $(subst v,,$(GITHUB_VERSION)))


# --- protoc-gen-go ----------------------------------------------------------------------
protoc-gen-go: bin/protoc-gen-go-$(PROTOC_GEN_GO_VERSION)
	@ ln -sf protoc-gen-go-$(PROTOC_GEN_GO_VERSION) ./bin/$@

bin/protoc-gen-go-$(PROTOC_GEN_GO_VERSION):
	@ $(MAKE) bin/protoc-gen-go

.PHONY: bin/protoc-gen-go
bin/protoc-gen-go: GITHUB_REPOSITORY=protocolbuffers/protobuf-go
bin/protoc-gen-go: GITHUB_ARCHIVE=protoc-gen-go.v%s.darwin.amd64.tar.gz
bin/protoc-gen-go: GITHUB_VERSION=v$(PROTOC_GEN_GO_VERSION)
bin/protoc-gen-go: ARCHIVE_PATH=protoc-gen-go
bin/protoc-gen-go:
	$(call install/github/release/tgz,$@)


# --- protoc-gen-go-grpc -----------------------------------------------------------------
protoc-gen-go-grpc: bin/protoc-gen-go-grpc-$(PROTOC_GET_GO_GRPC_VERSION)
	@ ln -sf protoc-gen-go-grpc-$(PROTOC_GET_GO_GRPC_VERSION) ./bin/$@

bin/protoc-gen-go-grpc-$(PROTOC_GET_GO_GRPC_VERSION):
	@ $(MAKE) bin/protoc-gen-go-grpc

.PHONY: bin/protoc-gen-go-grpc
bin/protoc-gen-go-grpc: GITHUB_REPOSITORY=grpc/grpc-go
bin/protoc-gen-go-grpc: GITHUB_VERSION=cmd%2Fprotoc-gen-go-grpc%2Fv$(PROTOC_GET_GO_GRPC_VERSION)
bin/protoc-gen-go-grpc: GITHUB_ARCHIVE=protoc-gen-go-grpc.v$(PROTOC_GET_GO_GRPC_VERSION).darwin.amd64.tar.gz
bin/protoc-gen-go-grpc: ARCHIVE_PATH=protoc-gen-go-grpc
bin/protoc-gen-go-grpc:
	$(call install/github/release/tgz,$@)


# --- protoc-gen-jsonschema --------------------------------------------------------------
protoc-gen-jsonschema: bin/protoc-gen-jsonschema-$(PROTOCS_GEN_JSONSCHEMA_VERSION)
	@ ln -sf protoc-gen-jsonschema-$(PROTOCS_GEN_JSONSCHEMA_VERSION) ./bin/$@

bin/protoc-gen-jsonschema-$(PROTOCS_GEN_JSONSCHEMA_VERSION):
	@ $(MAKE) bin/protoc-gen-jsonschema

.PHONY: bin/protoc-gen-jsonschema
bin/protoc-gen-jsonschema: GITHUB_REPOSITORY=chrusty/protoc-gen-jsonschema
bin/protoc-gen-jsonschema: GITHUB_PATH=cmd/protoc-gen-jsonschema
bin/protoc-gen-jsonschema: GITHUB_VERSION=$(PROTOCS_GEN_JSONSCHEMA_VERSION)
bin/protoc-gen-jsonschema: BINARY_NAME=protoc-gen-jsonschema
bin/protoc-gen-jsonschema:
	$(call install/github/release/go/get,$@)


# --- protoc-gen-bq-schema ---------------------------------------------------------------
protoc-gen-bq-schema: bin/protoc-gen-bq-schema-$(PROTOC-GEN-BQ-SCHEMA_VERSION)
	@ ln -sf protoc-gen-bq-schema-$(PROTOC-GEN-BQ-SCHEMA_VERSION) ./bin/$@

bin/protoc-gen-bq-schema-$(PROTOC-GEN-BQ-SCHEMA_VERSION):
	@ $(MAKE) bin/protoc-gen-bq-schema

.PHONY: bin/protoc-gen-bq-schema
bin/protoc-gen-bq-schema: GITHUB_REPOSITORY=GoogleCloudPlatform/protoc-gen-bq-schema
bin/protoc-gen-bq-schema: BINARY_NAME=protoc-gen-bq-schema
bin/protoc-gen-bq-schema: GITHUB_VERSION=$(PROTOC-GEN-BQ-SCHEMA_VERSION)
bin/protoc-gen-bq-schema:
	$(call install/github/release/go/get,$@)


# --- protoc-gen-micro -------------------------------------------------------------------
protoc-gen-micro: bin/protoc-gen-micro-$(PROTOC_GEN_MICRO_VERSION)
	@ ln -sf protoc-gen-micro-$(PROTOC_GEN_MICRO_VERSION) ./bin/$@

bin/protoc-gen-micro-$(PROTOC_GEN_MICRO_VERSION):
	@ $(MAKE) bin/protoc-gen-micro

.PHONY: bin/protoc-gen-micro
bin/protoc-gen-micro: GITHUB_REPOSITORY=micro/micro
bin/protoc-gen-micro: GITHUB_PATH=cmd/protoc-gen-micro
bin/protoc-gen-micro: BINARY_NAME=protoc-gen-micro
bin/protoc-gen-micro: GITHUB_VERSION=$(PROTOC_GEN_MICRO_VERSION)
bin/protoc-gen-micro: GO_PACKAGE_VERSION=3
bin/protoc-gen-micro:
	$(call install/github/release/go/get/ver,$@)


# --- gocritic --------- -----------------------------------------------------------------
gocritic: bin/gocritic-$(GOCRITIC_VERSION)
	@ ln -sf gocritic-$(GOCRITIC_VERSION) ./bin/$@

bin/gocritic-$(GOCRITIC_VERSION):
	@ $(MAKE) bin/gocritic

.PHONY: bin/go-critic
bin/gocritic: GITHUB_REPOSITORY=go-critic/go-critic
bin/gocritic: GITHUB_PATH=cmd/gocritic
bin/gocritic: BINARY_NAME=gocritic
bin/gocritic: GITHUB_VERSION=$(GOCRITIC_VERSION)
bin/gocritic:
	$(call install/github/release/go/get,$@)

# --- protoc-gen-openapi -----------------------------------------------------------------
protoc-gen-openapi: bin/protoc-gen-openapi-$(PROTOC_GEN_OPENAPI_VERSION)
	@ ln -sf protoc-gen-openapi-$(PROTOC_GEN_OPENAPI_VERSION) ./bin/$@

bin/protoc-gen-openapi-$(PROTOC_GEN_OPENAPI_VERSION):
	@ $(MAKE) bin/protoc-gen-openapi

.PHONY: bin/protoc-gen-openapi
bin/protoc-gen-openapi: GITHUB_REPOSITORY=micro/micro
bin/protoc-gen-openapi: GITHUB_PATH=cmd/protoc-gen-openapi
bin/protoc-gen-openapi: BINARY_NAME=protoc-gen-openapi
bin/protoc-gen-openapi: GITHUB_VERSION=$(PROTOC_GEN_OPENAPI_VERSION)
bin/protoc-gen-openapi: GO_PACKAGE_VERSION=3
bin/protoc-gen-openapi:
	$(call install/github/release/go/get/ver,$@)


# --- bin/protoc-gen-validate ------------------------------------------------------------
protoc-gen-validate: bin/protoc-gen-validate-$(PROTOC_GEN_VALIDATE_VERSION)
	@ ln -sf protoc-gen-validate-$(PROTOC_GEN_VALIDATE_VERSION) ./bin/$@

bin/protoc-gen-validate-$(PROTOC_GEN_VALIDATE_VERSION):
	@ $(MAKE) bin/protoc-gen-validate

.PHONY: bin/protoc-gen-validate
bin/protoc-gen-validate: GITHUB_REPOSITORY=envoyproxy/protoc-gen-validate
bin/protoc-gen-validate: GITHUB_PATH=protoc-gen-validate-%s
bin/protoc-gen-validate: GITHUB_VERSION=v$(PROTOC_GEN_VALIDATE_VERSION)
bin/protoc-gen-validate: GITHUB_ARCHIVE=v%s.tar.gz
bin/protoc-gen-validate: ARCHIVE_PATH=protoc-gen-validate
bin/protoc-gen-validate:
	$(call install/github/release/go/build,$@)
	@mkdir -p $(GOPATH)/src/include/validate
	@cp -R ./$(shell printf $(GITHUB_PATH) $(call version,$(GITHUB_VERSION)))/validate/* \
		$(GOPATH)/src/include/validate

	@ rm -rf ./$(shell printf $(GITHUB_PATH) $(call version,$(GITHUB_VERSION)))



# --- tparse -----------------------------------------------------------------------------
tparse: bin/tparse-$(TPARSE_VERSION)
	@ cd "bin"
	@ ln -sf "tparse-$(TPARSE_VERSION)" ./bin/$@

bin/tparse-$(TPARSE_VERSION):
	@ $(MAKE) bin/tparse

.PHONY: bin/tparse
bin/tparse: GITHUB_REPOSITORY=mfridman/tparse
bin/tparse: GITHUB_VERSION=v$(TPARSE_VERSION)
bin/tparse: GITHUB_ARCHIVE=tparse_%s_Darwin_x86_64.tar.gz
bin/tparse: ARCHIVE_PATH=tparse
bin/tparse:
	$(call install/github/release/tgz,$@)


# --- wire -------------------------------------------------------------------------------
wire: bin/wire-$(WIRE_VERSION)
	@ cd "bin"
	@ ln -sf wire-$(WIRE_VERSION) ./bin/$@

bin/wire-$(WIRE_VERSION):
	@ $(MAKE) bin/wire

.PHONY: bin/wire
bin/wire: GITHUB_REPOSITORY=google/wire
bin/wire: GITHUB_VERSION=v$(WIRE_VERSION)
bin/wire: GITHUB_PATH=cmd/wire
bin/wire: BINARY_NAME=wire
bin/wire:
	$(call install/github/release/go/get,$@)


# --- migrate ----------------------------------------------------------------------------
migrate: bin/migrate-$(MIGRATE_VERSION)
	@ cd "bin"
	@ ln -sf migrate-$(MIGRATE_VERSION) ./bin/$@

bin/migrate-$(MIGRATE_VERSION):
	@ $(MAKE) bin/migrate

.PHONY: bin/migrate
bin/migrate: GITHUB_REPOSITORY=golang-migrate/migrate
bin/migrate: GITHUB_ARCHIVE=migrate.darwin-amd64.tar.gz
bin/migrate: GITHUB_VERSION=v$(MIGRATE_VERSION)
bin/migrate: ARCHIVE_PATH=migrate.darwin-amd64
bin/migrate:
	$(call install/github/release/tgz,$@)


# --- tern -------------------------------------------------------------------------------
tern: bin/tern-$(TERN_VERSION)
	@ cd "bin"
	@ ln -sf tern-$(TERN_VERSION) ./bin/$@

bin/tern-$(TERN_VERSION):
	@ $(MAKE) bin/tern

.PHONY: bin/tern
bin/tern: GITHUB_REPOSITORY=jackc/tern
bin/tern: GITHUB_VERSION=v$(TERN_VERSION)
bin/tern: BINARY_NAME=tern
bin/tern:
	$(call install/github/release/go/get,$@)


# --- ali --------------------------------------------------------------------------------
ali: bin/ali-$(ALI_VERSION)
	@ cd "bin"
	@ ln -sf "ali-$(ALI_VERSION)" "bin/$@"

bin/ali-$(ALI_VERSION):
	@ $(MAKE) bin/ali

.PHONY: bin/ali
bin/ali: GITHUB_REPOSITORY=nakabonne/ali
bin/ali: GITHUB_VERSION=v$(ALI_VERSION)
bin/ali: GITHUB_ARCHIVE=ali_%s_darwin_amd64.tar.gz
bin/ali: ARCHIVE_PATH=ali
bin/ali:
	$(call install/github/release/tgz,$@)


# --- bin/velero -------------------------------------------------------------------------
velero: bin/velero-$(VELERO_VERSION)
	@ cd "bin"
	@ ln -sf velero-$(VALERO_VERSION) ./bin/$@

bin/velero-$(VELERO_VERSION):
	@ $(MAKE) bin/velero

.PHONY: bin/velero
bin/velero: GITHUB_REPOSITORY=vmware-tanzu/velero
bin/velero: GITHUB_VERSION=v1.5.3
bin/velero: GITHUB_ARCHIVE=velero-v%s-darwin-amd64.tar.gz
bin/velero: ARCHIVE_PATH=$(shell printf velero-%s-darwin-amd64/velero  $(GITHUB_VERSION))
bin/velero:
	$(call install/github/release/tgz,$@)


# --- bin/minikube -----------------------------------------------------------------------
minikube: bin/minikube-$(MINIKUBE_VERSION)
	@ cd "bin"
	@ ln -sf minikube-$(MINIKUBE_VERSION) ./bin/$@


bin/minikube-$(MINIKUBE_VERSION):
	@ $(MAKE) bin/minikube

.PHONY: bin/minikube
bin/minikube: GITHUB_REPOSITORY=kubernetes/minikube
bin/minikube: GITHUB_VERSION=v$(MINIKUBE_VERSION)
bin/minikube: GITHUB_ARCHIVE=minikube-darwin-amd64.tar.gz
bin/minikube: ARCHIVE_PATH=out/minikube-darwin-amd64
bin/minikube:
	$(call install/github/release/tgz,$@)


# --- bin/yq -----------------------------------------------------------------------------

YQ_VERSION=4.5.1
yq: install_yq
	echo "dont install it manually. just brew isntall yq@3"

# --- bin/helm ---------------------------------------------------------------------------
helm: bin/helm-$(HELM_VERSION)
	@ cd "bin"
	@ ln -sf helm-$(HELM_VERSION) ./bin/$@


bin/helm-$(HELM_VERSION):
	@ $(MAKE) bin/helm

.PHONY: bin/helm
bin/helm: VERSION=v$(HELM_VERSION)
bin/helm: ARCHIVE=$(shell printf https://get.helm.sh/helm-%s-darwin-amd64.tar.gz $(VERSION))
bin/helm: ARCHIVE_PATH=darwin-amd64/helm
bin/helm:
	$(call install/remote/release/tgz,$@)


# --- bin/kubectl ------------------------------------------------------------------------
kubectl: bin/kubectl-$(KUBECTL_VERSION)
	@ cd "bin"
	@ ln -sf kubectl-$(KUBECTL_VERSION) ./bin/$@

bin/kubectl-$(KUBECTL_VERSION):
	@ $(MAKE) bin/kubectl

.PHONY: bin/kubectl
bin/kubectl: VERSION=v$(KUBECTL_VERSION)
bin/kubectl: ARCHIVE=$(shell printf https://dl.k8s.io/%s/kubernetes-client-darwin-amd64.tar.gz $(VERSION))
bin/kubectl: ARCHIVE_PATH=kubernetes/client/bin/kubectl
bin/kubectl:
	$(call install/remote/release/tgz,$@)

# --- bin/octant -------------------------------------------------------------------------
hugo: bin/hugo-$(HUGO_VERSION)
	@ cd "bin"
	@ ln -sf hugo-$(HUGO_VERSION) ./bin/$@

bin/hugo-$(HUGO_VERSION):
	@ $(MAKE) bin/hugo

.PHONY: bin/hugo
bin/hugo: GITHUB_REPOSITORY=gohugoio/hugo
bin/hugo: GITHUB_VERSION=v$(HUGO_VERSION)
bin/hugo: GITHUB_ARCHIVE=$(shell printf hugo_extended_%s_macOS-64bit.tar.gz $(subst v,,$(GITHUB_VERSION)))
bin/hugo: ARCHIVE_PATH=$(shell printf hugo $(subst v,,$(GITHUB_VERSION)))
bin/hugo:
	$(call install/github/release/tgz,$@)

# --- bin/octant -------------------------------------------------------------------------
octant: bin/octant-$(OCTANT_VERSION)
	@ cd "bin"
	@ ln -sf octant-$(OCTANT_VERSION) ./bin/$@

bin/octant-$(OCTANT_VERSION):
	@ $(MAKE) bin/octant

.PHONY: bin/octant
bin/octant: GITHUB_REPOSITORY=vmware-tanzu/octant
bin/octant: GITHUB_VERSION=v$(OCTANT_VERSION)
bin/octant: GITHUB_ARCHIVE=$(shell printf octant_%s_macOS-64bit.tar.gz $(subst v,,$(GITHUB_VERSION)))
bin/octant: ARCHIVE_PATH=$(shell printf octant_%s_macOS-64bit/octant $(subst v,,$(GITHUB_VERSION)))
bin/octant:
	$(call install/github/release/tgz,$@)


# --- bin/task -------------------------------------------------------------------------
task: bin/task-$(TASK_VERSION)
	@ cd "bin"
	@ ln -sf task-$(TASK_VERSION) ./bin/$@

bin/task-$(TASK_VERSION):
	@ $(MAKE) bin/task

.PHONY: bin/task
bin/task: GITHUB_REPOSITORY=go-task/task
bin/task: GITHUB_VERSION=v$(TASK_VERSION)
bin/task: GITHUB_ARCHIVE=task_darwin_amd64.tar.gz
bin/task: ARCHIVE_PATH=task
bin/task:
	$(call install/github/release/tgz,$@)
