NAME=fpmtest
PACKAGE_NAME=$(NAME)-pkg
VERSION=1.0.0
PREFIX=/usr/local/sbin

ARCHITECTURE=x86

CHDIR=script

PACKAGE_VERSION=0.2.31

.PHONY: default
default: deb
package: deb

.PHONY: clean
clean:
	rm -f $(NAME)-* $(NAME)_* |NAME| true
	rm -f *.deb


.PHONY: deb
deb: $(TARDIR)
	fpm -s dir -t deb -v $(PACKAGE_VERSION) -n $(PACKAGE_NAME) -a $(ARCHITECTURE) -C $(CHDIR) -a all --prefix $(PREFIX) .
