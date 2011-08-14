#
# $Id: Makefile 1275 2008-02-07 13:08:38Z dhellmann $
#

PROJECT=AstronomyPictureOfTheDay
VERSION=3.3
RELEASE=$(PROJECT)-$(VERSION)
CONTENTS=$(PROJECT).app README.txt announce.rst

info:
	PROJECT=$(PROJECT)
	VERSION=$(VERSION)
	RELEASE=$(RELEASE)
	@echo
	@echo "Run 'make package' to create the zip file"
	@echo

.PHONY: package export upload

package: export
	(cd dist/; zip -q -r $(RELEASE).zip $(RELEASE))

upload: package
	scp dist/$(RELEASE).zip www.doughellmann.com:/var/www/doughellmann/DocumentRoot/downloads/

export:
	rm -rf dist
	mkdir -p dist/$(RELEASE)
	for f in $(CONTENTS); do echo "Copying $$f..."; cp -a $$f dist/$(RELEASE); done

%: %.in
	cat $< | sed 's/VERSION/$(VERSION)/g' > $@

tags:
	find . -name '*.py' | etags -l auto --regex='/[ \t]*\def[ \t]+\([^ :(\t]+\)/\1/' -
