all :
	# nothing

TARBALL = par-tutorial.tar.gz

$(TARBALL):
	git archive --format tar master . | gzip >$@

upload : $(TARBALL)
	scp $(TARBALL) community:public_html
	(cd doc; make upload)
