VERSION = $(shell sed -nr "s/^\s+\"version\": \"(.+)\",$$/\1/p" manifest.json)
WEBEXT = ./node_modules/web-ext/bin/web-ext
WEBEXT_IGNORE_LIST=Makefile "web-ext-artifacts*" "package*.json"

all: build

build:
	$(WEBEXT) build --ignore-files $(WEBEXT_IGNORE_LIST)

sign:
	$(WEBEXT) sign --api-key=$$AMO_JWT_ISSUER --api-secret=$$AMO_JWT_SECRET	\
		--channel=unlisted --ignore-files $(WEBEXT_IGNORE_LIST)
