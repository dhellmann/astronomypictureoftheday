#
# $Id: Makefile 410 2006-12-26 13:26:18Z dhellmann $
#

SVNHOME=$(shell svn info | grep "^URL" | cut -f2- -d:)
PROJECT=AstronomyPictureOfTheDay
VERSION=$(shell basename $(SVNHOME))
RELEASE=$(PROJECT)-$(VERSION)

info:
	SVNHOME=$(SVNHOME)
	PROJECT=$(PROJECT)
	VERSION=$(VERSION)
	RELEASE=$(RELEASE)

package: dist export
	(rm -f dist/$(RELEASE).zip)
	(cd dist/; zip -r $(RELEASE).zip $(RELEASE))

dist:
	mkdir -p dist

#
# Dump a version that does not include .svn directories
# or my username.
#
export:
	rm -rf dist/$(RELEASE)
	(cd dist; svn export $(SVNHOME) $(RELEASE); rm -f $(RELEASE)/Makefile)
	chmod +x dist/$(RELEASE)/personalize.command
	mv dist/$(RELEASE)/$(PROJECT).workflow/Contents/document.wflow dist/$(RELEASE)/$(PROJECT).workflow/Contents/document.wflow.in
	cat dist/$(RELEASE)/$(PROJECT).workflow/Contents/document.wflow.in | sed 's/dhellmann/USER/g' > dist/$(RELEASE)/$(PROJECT).workflow/Contents/document.wflow
	rm -f dist/$(RELEASE)/$(PROJECT).workflow/Contents/document.wflow.in

%: %.in
	cat $< | sed 's/VERSION/$(VERSION)/g' > $@

tags:
	find . -name '*.py' | etags -l auto --regex='/[ \t]*\def[ \t]+\([^ :(\t]+\)/\1/' -
