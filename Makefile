#
# $Id: Makefile 404 2006-12-26 12:46:39Z dhellmann $
#

#
# 0. (tag work directory)
# 1. gmake dist REV=rX_Y
# 2. gmake ftp_install REV=rX_Y
# 3. (create new release, add file)
#

SVNHOME=$(shell svn info | grep "^URL" | cut -f2- -d:)
PROJECT=AstronomyPictureOfTheDay
VERSION=$(shell basename $(SVNHOME))
RELEASE=$(PROJECT)-$(VERSION)

CONTENTS=AstronomyPictureOfTheDay.workflow

info:
	SVNHOME=$(SVNHOME)
	PROJECT=$(PROJECT)
	VERSION=$(VERSION)
	RELEASE=$(RELEASE)

package:
	mkdir -p dist
	rm -rf dist/$(VERSION)
	(cd dist; svn export $(SVNHOME))
	(cd dist/$(VERSION); zip -r ../$(RELEASE).zip $(CONTENTS))

%: %.in
	cat $< | sed 's/VERSION/$(VERSION)/g' > $@

tags:
	find . -name '*.py' | etags -l auto --regex='/[ \t]*\def[ \t]+\([^ :(\t]+\)/\1/' -
