

## Installers
define testname
	@echo $(1)
endef

define github_url
	https://github.com/$(GITHUB)/releases/download/v$(VERSION)/$(ARCHIVE)
endef

define install/github/release/tgz
	curl -Ls \
		$(shell printf "https://github.com/%s/releases/download/%s/%s" \
			$(GITHUB_REPOSITORY) \
			$(GITHUB_VERSION) \
			$(shell printf $(GITHUB_ARCHIVE)  $(subst v,,$(GITHUB_VERSION))) \
		) | tar -zOxf - $(ARCHIVE_PATH) > \
			./$(1)-$(call version,$(GITHUB_VERSION))

	@ chmod +x ./$(1)-$(call version,$(GITHUB_VERSION))
endef

define install/remote/release/tgz

	@ curl -Ls $(ARCHIVE) | tar -zOxf - $(ARCHIVE_PATH) > \
			./$(1)-$(call version,$(VERSION))

	@ chmod +x ./$(1)-$(call version,$(VERSION))

endef

define install/github/release/protoc
	@ curl -Ls \
		$(shell printf "https://github.com/%s/releases/download/%s/%s" \
			$(GITHUB_REPOSITORY) \
			$(GITHUB_VERSION) \
			$(shell printf $(GITHUB_ARCHIVE)  $(subst v,,$(GITHUB_VERSION))) \
		) > $(shell printf $(GITHUB_ARCHIVE)  $(subst v,,$(GITHUB_VERSION)))
	@ unzip -p $(shell printf $(GITHUB_ARCHIVE)  $(subst v,,$(GITHUB_VERSION))) $(1) > \
		./$(1)-$(call version,$(GITHUB_VERSION))

	@ chmod +x ./$@-$(call version,$(GITHUB_VERSION))
endef

# todo: better way to install bins and symlink them later.
define install/github/release/go/get

	@ \
	GOBIN=$(BIN) \
		go get $(shell printf "github.com/%s/%s" \
			$(GITHUB_REPOSITORY) \
			$(GITHUB_PATH) )

	@ mv ./$(1) ./$(1)-$(call version,$(GITHUB_VERSION))
endef

# todo: better way to install bins and symlink them later.
define install/github/release/go/get/ver

	echo $(shell printf "github.com/%s/v%s/%s" \
			$(GITHUB_REPOSITORY) \
			$(GO_PACKAGE_VERSION) \
			$(GITHUB_PATH) ); \
	@ \
	GOBIN=$(BIN) \
	GO111MODULE=on \
		go get $(shell printf "github.com/%s/v%s/%s" \
			$(GITHUB_REPOSITORY) \
			$(GO_PACKAGE_VERSION) \
			$(GITHUB_PATH) )

	@ mv ./$(1) ./$(1)-$(call version,$(GITHUB_VERSION))
endef

# note: go build from tagged source at githab that is not release.
define install/github/release/go/build


	@curl -Ls \
		$(shell printf "https://github.com/%s/archive/%s" \
			$(GITHUB_REPOSITORY) \
			$(shell printf $(GITHUB_ARCHIVE)  $(subst v,,$(GITHUB_VERSION))) \
		) | tar -zxf -
	@cd $(shell printf $(GITHUB_PATH) $(call version,$(GITHUB_VERSION))) && \
		go build -o ../$(1)-$(call version,$(GITHUB_VERSION)) . && cd ..
endef

define install/github/release/go/build/protoc-validate
	$(call install/github/release/go/build,$(1))
endef
