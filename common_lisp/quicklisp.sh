#!/bin/sh -eu
cd -- "$(dirname -- "$0")"
! [ -f quicklisp.lisp ] &&
	curl -O https://beta.quicklisp.org/quicklisp.lisp
! [ -d quicklisp ] &&
	sbcl --no-userinit --load quicklisp.lisp --eval '(quicklisp-quickstart:install :path "quicklisp")' --quit
