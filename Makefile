NAME := $(shell python setup.py --name)
VERSION := $(shell python setup.py --version)
DESCRIPTION := $(shell python setup.py --description)
LONG_DESCRIPTION := $(shell python setup.py --long-description)
LICENSE := $(shell python setup.py --license)
URL := $(shell python setup.py --url)
RELEASE := 1

clean:
	rm -rf build dist pony_homepage.egg-info
	find . -name "*.py[co]" -delete
	find . -name "*~" -delete
	rm -f $(NAME)-*.tar.gz

archive: clean
	tar -czf $(NAME)-$(VERSION).tar.gz .

rpm: archive
	mv $(NAME)-$(VERSION).tar.gz ~/rpmbuild/SOURCES
	cp contrib/pony-homepage.spec ~/rpmbuild/SPECS
	rpmbuild ~/rpmbuild/SPECS/pony_homepage.spec -bb\
		--define "_name $(NAME)"\
		--define "_version $(VERSION)"\
		--define "_release $(RELEASE)"\
		--define "_description $(DESCRIPTION)"\
		--define "_license $(LICENSE)"\
		--define "_url $(URL)"\
		--define '_long_description $(LONG_DESCRIPTION)'
