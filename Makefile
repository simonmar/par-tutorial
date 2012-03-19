all :
	# nothing

# NB. also modify \newcommand{\version} in doc/cefp.tex
VERSION = 1.2

TARBALL = par-tutorial-$(VERSION).tar.gz
ZIPBALL = par-tutorial-$(VERSION).zip

$(TARBALL):
	git archive --format tar master . | gzip >$@

$(ZIPBALL):
	git archive --format zip master . -o $@

.PHONY: tar
tar : $(TARBALL)
.PHONY: zip
zip : $(ZIPBALL)

upload : $(TARBALL) $(ZIPBALL)
	scp $(TARBALL) community:public_html
	(cd doc; make upload)
