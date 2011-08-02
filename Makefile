#
# $Id: Makefile 1275 2008-02-07 13:08:38Z dhellmann $
#

SVNHOME=$(shell svn info | grep "^URL" | cut -f2- -d: | sed 's/^ //')
PROJECT=AstronomyPictureOfTheDay
VERSION=$(shell basename $(SVNHOME))
RELEASE=$(PROJECT)-$(VERSION)

info:
	SVNHOME=$(SVNHOME)
	PROJECT=$(PROJECT)
	VERSION=$(VERSION)
	RELEASE=$(RELEASE)
	@echo
	@echo "Run 'make package' to create the zip file"
	@echo

package: dist export
	(rm -f dist/$(RELEASE).zip)
	(cd dist/; zip -r $(RELEASE).zip $(RELEASE))
	mv dist/*.zip ~/Desktop/

dist:
	mkdir -p dist

#
# Dump a version that does not include .svn directories
#
export:
	rm -rf dist/$(RELEASE)
	(cd dist; svn export $(SVNHOME) $(RELEASE); rm -f $(RELEASE)/Makefile)

%: %.in
	cat $< | sed 's/VERSION/$(VERSION)/g' > $@

tags:
	find . -name '*.py' | etags -l auto --regex='/[ \t]*\def[ \t]+\([^ :(\t]+\)/\1/' -
