NAME := $(shell python setup.py --name)
VERSION := $(shell python setup.py --version)
DESCRIPTION := $(shell python setup.py --description)
LONG_DESCRIPTION := $(shell python setup.py --long-description)
LICENSE := $(shell python setup.py --license)
URL := $(shell python setup.py --url)
RELEASE := 1

clean:
	git clean -dfx

build_prepare:
	mkdir -p SOURCES
	git archive --format tar --output SOURCES/$(NAME)-$(VERSION).tar.gz HEAD:

srpm: build_prepare
	mock --buildsrpm \
		--resultdir=. \
		--spec=contrib/pony-homepage.spec \
		--sources=SOURCES \
		--define "_name $(NAME)"\
		--define "_version $(VERSION)"\
		--define "_release $(RELEASE)"\
		--define "_description $(DESCRIPTION)"\
		--define "_license $(LICENSE)"\
		--define "_url $(URL)"\
		--define '_long_description $(LONG_DESCRIPTION)'


rpm: srpm
	mock --rebuild *.src.rpm \
		--resultdir=. \
		--define "_name $(NAME)"\
		--define "_version $(VERSION)"\
		--define "_release $(RELEASE)"\
		--define "_description $(DESCRIPTION)"\
		--define "_license $(LICENSE)"\
		--define "_url $(URL)"\
		--define '_long_description $(LONG_DESCRIPTION)'
