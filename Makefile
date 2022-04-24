export BIN    := $(PWD)/bin
export PATH   := $(BIN):$(PATH)
export SHELL  := bash
export OSTYPE := $(shell uname -s)

# Include functionality
version = $(or $(word 2,$(subst v, ,$1)),$(word 1,$(subst v, ,$1)))

include scripts/Makefile/Makefile

# ========= Install Tools ============================================================== #
# ACT_VERSION:=0.2.24
# install_tools: act

AIR_VERSION:=1.27.3
install_tools: air

# EVANS_VERSION:=0.9.2
# install_tools: evans

# DOCKER_SQUASH_VERSION:=0.2.0
# install_tools: docker-squash

# GOTESTSUM_VERSION:=1.6.4
# install_tools: gotestsum

# GRPCURL_VERSION:=1.8.0
# install_tools: grpcurl

# # GOSEC_VERSION:=2.6.1
# # install_tools: gosec

# MOCKERY_VERSION:=2.5.1
# install_tools: mockery

# PROTOC_VERSION:=3.18.0
# install_tools: protoc

# PROTOC_GEN_GO_VERSION:=1.27.1
# install_tools: protoc-gen-go

# PROTOC_GET_GO_GRPC_VERSION:=1.1.0
# install_tools: protoc-gen-go-grpc

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

# TPARSE_VERSION:=0.8.3
# install_tools: tparse

# WIRE_VERSION:=0.5.0
# install_tools: wire

# MIGRATE_VERSION:=4.14.1
# install_tools: migrate

# TERN_VERSION:=0.12.3
# install_tools: tern

# ALI_VERSION:=0.5.4
# install_tools: ali

# HUGO_VERSION:=0.86.1
# install_tools: hugo

# VELERO_VERSION:=1.5.3
# install_tools: velero


# TASK_VERSION:=3.2.2
# install_tools: task

install: install_tools



# --- act --------------------------------------------------------------------------------



# --- air --------------------------------------------------------------------------------
air: bin/air-$(AIR_VERSION)
	@ ln -sf air-$(AIR_VERSION) ./bin/$@

bin/air-$(AIR_VERSION):
	@ $(MAKE) bin/air

.PHONY: bin/air
bin/air: GITHUB_REPOSITORY=cosmtrek/air
bin/air: GITHUB_VERSION=v$(AIR_VERSION)
bin/air: GITHUB_ARCHIVE=air_%s_darwin_arm64.tar.gz
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
