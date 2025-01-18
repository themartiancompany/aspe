# SPDX-License-Identifier: AGPL-3.0-or-later

PREFIX ?= /usr/local
_PROJECT=aspe
BIN_DIR=$(DESTDIR)$(PREFIX)/bin
DATA_DIR=$(DESTDIR)$(PREFIX)/share
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/$(_PROJECT)

DOC_FILES=\
  $(wildcard *.rst) \
  $(wildcard *.md)
SCRIPT_FILES=$(wildcard $(_PROJECT)/*)

all:

check: shellcheck 

shellcheck:
	shellcheck -s bash $(FILES)

install: install-scripts install-doc

install:

	install \
	  -vDm755 \
	  "$(_PROJECT)/$(_PROJECT)" \
	  "$(BIN_DIR)/$(_PROJECT)"

install-doc:

	install \
	  -vDm644 \
	  $(DOC_FILES) \
	  -t \
	  $(DOC_DIR)


.PHONY: check install install-scripts install-doc shellcheck
