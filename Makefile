# Generated by Assemblage for mirage-profile 0.1.

# Run `make help' to get the list of targets.

.PHONY: all clean lib bin test doc distclean js help lib-mirage-profile

# 
# Main project configuration
# 

BUILDIR     ?= _build
DUMPAST     ?= ocaml-dumpast
JS_OF_OCAML ?= js_of_ocaml
LIBDIR      ?= $(LIBDIR)
LN          ?= ln -sf
MKDIR       ?= mkdir -p
OCAMLMKLIB  ?= ocamlmklib
ROOTDIR     = $(shell pwd)
ifeq ($(HAS_NATIVE_TOOLCHAIN:true=),)
OCAMLC      ?= ocamlc.opt
OCAMLDEP    ?= ocamldep.opt
OCAMLDOC    ?= ocamldoc.opt
OCAMLOPT    ?= ocamlopt.opt
else
OCAMLC      ?= ocamlc
OCAMLDEP    ?= ocamldep
OCAMLDOC    ?= ocamldoc
OCAMLOPT    ?= ocamlopt
endif

HAS_ANNOT            ?= true
HAS_BYTE             ?= true
HAS_DEBUG            ?= true
HAS_DOC              ?= false
HAS_JS               ?= false
HAS_LWT_TRACING      ?= true
HAS_NATIVE           ?= true
HAS_NATIVE_DYNLINK   ?= true
HAS_NATIVE_TOOLCHAIN ?= true
HAS_TEST             ?= false
HAS_WARN_ERROR       ?= false

# 
# Global variables
# 

all            := lib
compile-byte   := 
compile-native := 
link-byte      := 
link-native    := 
ifeq ($(HAS_WARN_ERROR:true=),)
compile-byte   += -warn-error A-44-4-48 -w A-44-4-48
endif
ifeq ($(HAS_DEBUG:true=),)
compile-byte   += -g
compile-native += -g
link-byte      += -g
link-native    += -g
endif
ifeq ($(HAS_ANNOT:true=),)
compile-byte   += -bin-annot
endif

# 
# Component configuration.
# 
# Each component has variables associated to the different phases of the build.
# <NAME>.<PHASE> controls the compilation options for the component <NAME>,
# during the phase <PHASE>.
# 

lib := lib-mirage-profile

# Library: mirage-profile
lib-mirage-profile := 
ifeq ($(HAS_BYTE:true=),)
lib-mirage-profile += $(BUILDIR)/lib-mirage-profile/mirage-profile.cma
endif
ifeq ($(HAS_NATIVE:true=),)
lib-mirage-profile +=  \
    $(BUILDIR)/lib-mirage-profile/mirage-profile.a \
    $(BUILDIR)/lib-mirage-profile/mirage-profile.cmxa
endif
ifeq ($(HAS_NATIVE:true=)$(HAS_NATIVE_DYNLINK:true=),)
lib-mirage-profile += $(BUILDIR)/lib-mirage-profile/mirage-profile.cmxs
endif
lib-mirage-profile.archive-byte ?=  \
    $(archive-byte) \
    -a \
    $(BUILDIR)/lib-mirage-profile/profile.cmo
lib-mirage-profile.archive-native ?=  \
    $(archive-native) \
    -a \
    $(BUILDIR)/lib-mirage-profile/profile.cmx
lib-mirage-profile.archive-shared ?=  \
    $(archive-shared) \
    -shared \
    -linkall \
    $(BUILDIR)/lib-mirage-profile/profile.cmx
lib-mirage-profile.compile-byte ?=  \
    $(compile-byte) \
    -I $(BUILDIR)/lib-mirage-profile
lib-mirage-profile.compile-native ?=  \
    $(compile-native) \
    -I $(BUILDIR)/lib-mirage-profile
lib-mirage-profile.dep ?=  \
    $(dep) \
    -I $(BUILDIR)/lib-mirage-profile
lib-mirage-profile.pp-byte ?= $(pp-byte)
lib-mirage-profile.pp-native ?= $(pp-native)

bin := 

js := 

test := 

doc := 

# Compilation unit: profile
unit-profile-lib-mirage-profile.compile-byte ?=  \
    $(lib-mirage-profile.compile-byte) \
    $(shell ocamlfind query -r -predicates byte -format "-I %d" -r sexplib \
            lwt)
unit-profile-lib-mirage-profile.compile-native ?=  \
    $(lib-mirage-profile.compile-native) \
    $(shell ocamlfind query -r -predicates native -format "-I %d" -r sexplib \
            lwt)
unit-profile-lib-mirage-profile.dep ?= $(lib-mirage-profile.dep)
unit-profile-lib-mirage-profile.pp-byte ?=  \
    $(lib-mirage-profile.pp-byte) \
    $(shell ocamlfind query -r -predicates byte -format "-I %d" -r sexplib.syntax) \
    $(shell ocamlfind query -r -predicates byte -format "%d/%a" -r sexplib.syntax) \
    $(shell ocamlfind query -r -predicates syntax,preprocessor -format "-I %d %a" -r sexplib.syntax)
unit-profile-lib-mirage-profile.pp-native ?=  \
    $(lib-mirage-profile.pp-native) \
    $(shell ocamlfind query -r -predicates byte -format "-I %d" -r sexplib.syntax) \
    $(shell ocamlfind query -r -predicates byte -format "%d/%a" -r sexplib.syntax) \
    $(shell ocamlfind query -r -predicates syntax,preprocessor -format "-I %d %a" -r sexplib.syntax)


all:: 
	@echo '[04mall[m [1;34m=>[m ${all}'
	@$(MAKE) $(all)
	@if [ "x${HAS_JS}" = "x1" ]; then $(MAKE) js; fi
	@if [ "x${HAS_TEST}" = "x1" ]; then $(MAKE) test; fi
	@if [ "x${HAS_DOC}" = "x1" ]; then $(MAKE) doc; fi
	@if [ "x${HAS_FULL_DOC}" = "x1" ]; then $(MAKE) full-doc; fi
	@echo '[32m==>[m Done!'

clean:: 
	rm -f *~ **/*~
	rm -rf $(BUILDIR)

distclean:: clean
	rm -f Makefile mirage-profile.install META .merlin

install:: all
	@opam-installer --prefix $(shell opam config var prefix) mirage-profile.install

help: 
	@echo 'Use [04mVERBOSE=true[m to show the full commands.'
	@echo 'The following targets are available (use "make [04m<target>[m"):'
	@echo
	@echo ' - [04mall[m -- build all the active targets.'
	@echo ' - [04mlib-mirage-profile[m -- build the library mirage-profile.'
	@echo ' - [04mdoc[m -- build the documentation.'
	@echo ' - [04mtest[m -- build and run the test.'
	@echo ' - [04mjs[m -- build the js_of_ocaml targets.'
	@echo ' - [04mclean[m -- clean the build artefacts.'
	@echo ' - [04mdistclean[m -- clean the project to prepare the release.'
	@echo
	@echo
	@echo 'Current configuration (use "make [04mVAR=BOOL[m" to modify):'
	@echo
	@echo ' - [04mHAS_ANNOT=$(HAS_ANNOT)[m -- Build OCaml binary annotations files.'
	@echo ' - [04mHAS_BYTE=$(HAS_BYTE)[m -- Byte code OCaml compilation is available.'
	@echo ' - [04mHAS_DEBUG=$(HAS_DEBUG)[m -- Build with debugging support.'
	@echo ' - [04mHAS_DOC=$(HAS_DOC)[m -- Build the documentation.'
	@echo ' - [04mHAS_JS=$(HAS_JS)[m -- JavaScript code OCaml compilation with js_of_ocaml is available.'
	@echo ' - [04mHAS_LWT_TRACING=$(HAS_LWT_TRACING)[m -- Use Lwt tracing support. If false, we just compile dummy stubs.'
	@echo ' - [04mHAS_NATIVE=$(HAS_NATIVE)[m -- Native code OCaml compilation is available.'
	@echo ' - [04mHAS_NATIVE_DYNLINK=$(HAS_NATIVE_DYNLINK)[m -- Native code OCaml dynamic linking is available.'
	@echo ' - [04mHAS_NATIVE_TOOLCHAIN=$(HAS_NATIVE_TOOLCHAIN)[m -- The native compiled OCaml toolchain is available (.opt tools).'
	@echo ' - [04mHAS_TEST=$(HAS_TEST)[m -- Build the tests.'
	@echo ' - [04mHAS_WARN_ERROR=$(HAS_WARN_ERROR)[m -- Build with warnings as errors.'
	@echo

lib: $(lib)
	@

lib-mirage-profile: $(lib-mirage-profile)
	@

$(BUILDIR)/lib-mirage-profile/: 
	@if test -n "$$VERBOSE"; \
        then echo '$(MKDIR) $(BUILDIR)/lib-mirage-profile'; \
        else echo 'lib-mirage-profile        [32m<=[m [01mprepare[m lib-mirage-profile'; fi
	@$(MKDIR) $(BUILDIR)/lib-mirage-profile

$(BUILDIR)/lib-mirage-profile/mirage-profile.cma: $(BUILDIR)/lib-mirage-profile/profile.cmo \
    | $(BUILDIR)/lib-mirage-profile/
	@if test -n "$$VERBOSE"; \
        then echo '$(OCAMLC) $(lib-mirage-profile.archive-byte) -o $(BUILDIR)/lib-mirage-profile/mirage-profile.cma'; \
        else echo 'mirage-profile.cma        [32m<=[m [01marchive-byte[m lib-mirage-profile'; fi
	@$(OCAMLC) $(lib-mirage-profile.archive-byte) -o $(BUILDIR)/lib-mirage-profile/mirage-profile.cma

$(BUILDIR)/lib-mirage-profile/mirage-profile.cmxa $(BUILDIR)/lib-mirage-profile/mirage-profile.a: $(BUILDIR)/lib-mirage-profile/profile.cmx \
    | $(BUILDIR)/lib-mirage-profile/
	@if test -n "$$VERBOSE"; \
        then echo '$(OCAMLOPT) $(lib-mirage-profile.archive-native) -o $(BUILDIR)/lib-mirage-profile/mirage-profile.cmxa'; \
        else echo 'mirage-profile.cmxa mirage-profile.a [32m<=[m [01marchive-native[m lib-mirage-profile'; fi
	@$(OCAMLOPT) $(lib-mirage-profile.archive-native) -o $(BUILDIR)/lib-mirage-profile/mirage-profile.cmxa

$(BUILDIR)/lib-mirage-profile/mirage-profile.cmxs: $(BUILDIR)/lib-mirage-profile/profile.cmx \
    | $(BUILDIR)/lib-mirage-profile/
	@if test -n "$$VERBOSE"; \
        then echo '$(OCAMLOPT) $(lib-mirage-profile.archive-shared) -o $(BUILDIR)/lib-mirage-profile/mirage-profile.cmxs'; \
        else echo 'mirage-profile.cmxs       [32m<=[m [01marchive-shared[m lib-mirage-profile'; fi
	@$(OCAMLOPT) $(lib-mirage-profile.archive-shared) -o $(BUILDIR)/lib-mirage-profile/mirage-profile.cmxs

bin: $(bin)
	@

js: $(js)
	@

test: $(test)
	@

doc: $(doc)
	@

$(BUILDIR)/lib-mirage-profile/profile.mli: profile.mli \
    | $(BUILDIR)/lib-mirage-profile/
	@if test -n "$$VERBOSE"; \
        then echo '$(LN) $(ROOTDIR)/profile.mli $(BUILDIR)/lib-mirage-profile/profile.mli'; \
        else echo 'profile.mli               [32m<=[m [01mprepare[m unit-profile-lib-mirage-profile'; fi
	@$(LN) $(ROOTDIR)/profile.mli $(BUILDIR)/lib-mirage-profile/profile.mli

$(BUILDIR)/lib-mirage-profile/profile.cmli-byte: $(BUILDIR)/lib-mirage-profile/profile.mli
	@if test -n "$$VERBOSE"; \
        then echo '$(DUMPAST) camlp4o $(unit-profile-lib-mirage-profile.pp-byte) $(BUILDIR)/lib-mirage-profile/profile.mli > $(BUILDIR)/lib-mirage-profile/profile.cmli-byte'; \
        else echo 'profile.cmli-byte         [32m<=[m [01mpp-byte[m unit-profile-lib-mirage-profile'; fi
	@$(DUMPAST) camlp4o $(unit-profile-lib-mirage-profile.pp-byte) $(BUILDIR)/lib-mirage-profile/profile.mli > $(BUILDIR)/lib-mirage-profile/profile.cmli-byte

$(BUILDIR)/lib-mirage-profile/profile.cmli-native: $(BUILDIR)/lib-mirage-profile/profile.mli
	@if test -n "$$VERBOSE"; \
        then echo '$(DUMPAST) camlp4o $(unit-profile-lib-mirage-profile.pp-native) $(BUILDIR)/lib-mirage-profile/profile.mli > $(BUILDIR)/lib-mirage-profile/profile.cmli-native'; \
        else echo 'profile.cmli-native       [32m<=[m [01mpp-native[m unit-profile-lib-mirage-profile'; fi
	@$(DUMPAST) camlp4o $(unit-profile-lib-mirage-profile.pp-native) $(BUILDIR)/lib-mirage-profile/profile.mli > $(BUILDIR)/lib-mirage-profile/profile.cmli-native

$(BUILDIR)/lib-mirage-profile/profile.mli.d: $(BUILDIR)/lib-mirage-profile/profile.cmli-byte \
    |  \
    $(BUILDIR)/lib-mirage-profile/profile.ml \
    $(BUILDIR)/lib-mirage-profile/profile.mli
	@if test -n "$$VERBOSE"; \
        then echo '$(OCAMLDEP) $(unit-profile-lib-mirage-profile.dep) -intf $(BUILDIR)/lib-mirage-profile/profile.cmli-byte > $(BUILDIR)/lib-mirage-profile/profile.mli.d'; \
        else echo 'profile.mli.d             [32m<=[m [01mdep[m unit-profile-lib-mirage-profile'; fi
	@$(OCAMLDEP) $(unit-profile-lib-mirage-profile.dep) -intf $(BUILDIR)/lib-mirage-profile/profile.cmli-byte > $(BUILDIR)/lib-mirage-profile/profile.mli.d

$(BUILDIR)/lib-mirage-profile/profile.cmi:  \
    $(BUILDIR)/lib-mirage-profile/profile.cmli-byte \
    $(BUILDIR)/lib-mirage-profile/profile.mli.d
	@if test -n "$$VERBOSE"; \
        then echo '$(OCAMLC) -c $(unit-profile-lib-mirage-profile.compile-byte) -intf $(BUILDIR)/lib-mirage-profile/profile.cmli-byte'; \
        else echo 'profile.cmi               [32m<=[m [01mcompile-byte[m unit-profile-lib-mirage-profile'; fi
	@$(OCAMLC) -c $(unit-profile-lib-mirage-profile.compile-byte) -intf $(BUILDIR)/lib-mirage-profile/profile.cmli-byte

$(BUILDIR)/lib-mirage-profile/profile.ml: profile.ml \
    | $(BUILDIR)/lib-mirage-profile/
	@if test -n "$$VERBOSE"; \
        then echo '$(LN) $(ROOTDIR)/profile.ml $(BUILDIR)/lib-mirage-profile/profile.ml'; \
        else echo 'profile.ml                [32m<=[m [01mprepare[m unit-profile-lib-mirage-profile'; fi
	@$(LN) $(ROOTDIR)/profile.ml $(BUILDIR)/lib-mirage-profile/profile.ml

$(BUILDIR)/lib-mirage-profile/profile.cml-byte: $(BUILDIR)/lib-mirage-profile/profile.ml
	@if test -n "$$VERBOSE"; \
        then echo '$(DUMPAST) camlp4o $(unit-profile-lib-mirage-profile.pp-byte) $(BUILDIR)/lib-mirage-profile/profile.ml > $(BUILDIR)/lib-mirage-profile/profile.cml-byte'; \
        else echo 'profile.cml-byte          [32m<=[m [01mpp-byte[m unit-profile-lib-mirage-profile'; fi
	@$(DUMPAST) camlp4o $(unit-profile-lib-mirage-profile.pp-byte) $(BUILDIR)/lib-mirage-profile/profile.ml > $(BUILDIR)/lib-mirage-profile/profile.cml-byte

$(BUILDIR)/lib-mirage-profile/profile.cml-native: $(BUILDIR)/lib-mirage-profile/profile.ml
	@if test -n "$$VERBOSE"; \
        then echo '$(DUMPAST) camlp4o $(unit-profile-lib-mirage-profile.pp-native) $(BUILDIR)/lib-mirage-profile/profile.ml > $(BUILDIR)/lib-mirage-profile/profile.cml-native'; \
        else echo 'profile.cml-native        [32m<=[m [01mpp-native[m unit-profile-lib-mirage-profile'; fi
	@$(DUMPAST) camlp4o $(unit-profile-lib-mirage-profile.pp-native) $(BUILDIR)/lib-mirage-profile/profile.ml > $(BUILDIR)/lib-mirage-profile/profile.cml-native

$(BUILDIR)/lib-mirage-profile/profile.ml.d: $(BUILDIR)/lib-mirage-profile/profile.cml-byte \
    |  \
    $(BUILDIR)/lib-mirage-profile/profile.ml \
    $(BUILDIR)/lib-mirage-profile/profile.mli
	@if test -n "$$VERBOSE"; \
        then echo '$(OCAMLDEP) $(unit-profile-lib-mirage-profile.dep) -impl $(BUILDIR)/lib-mirage-profile/profile.cml-byte > $(BUILDIR)/lib-mirage-profile/profile.ml.d'; \
        else echo 'profile.ml.d              [32m<=[m [01mdep[m unit-profile-lib-mirage-profile'; fi
	@$(OCAMLDEP) $(unit-profile-lib-mirage-profile.dep) -impl $(BUILDIR)/lib-mirage-profile/profile.cml-byte > $(BUILDIR)/lib-mirage-profile/profile.ml.d

$(BUILDIR)/lib-mirage-profile/profile.cmo:  \
    $(BUILDIR)/lib-mirage-profile/profile.ml.d \
    $(BUILDIR)/lib-mirage-profile/profile.cml-byte \
    $(BUILDIR)/lib-mirage-profile/profile.cmi
	@if test -n "$$VERBOSE"; \
        then echo '$(OCAMLC) -c $(unit-profile-lib-mirage-profile.compile-byte) -impl $(BUILDIR)/lib-mirage-profile/profile.cml-byte'; \
        else echo 'profile.cmo               [32m<=[m [01mcompile-byte[m unit-profile-lib-mirage-profile'; fi
	@$(OCAMLC) -c $(unit-profile-lib-mirage-profile.compile-byte) -impl $(BUILDIR)/lib-mirage-profile/profile.cml-byte

$(BUILDIR)/lib-mirage-profile/profile.cmx:  \
    $(BUILDIR)/lib-mirage-profile/profile.ml.d \
    $(BUILDIR)/lib-mirage-profile/profile.cmi \
    $(BUILDIR)/lib-mirage-profile/profile.cml-native
	@if test -n "$$VERBOSE"; \
        then echo '$(OCAMLOPT) -c $(unit-profile-lib-mirage-profile.compile-native) -impl $(BUILDIR)/lib-mirage-profile/profile.cml-native'; \
        else echo 'profile.cmx               [32m<=[m [01mcompile-native[m unit-profile-lib-mirage-profile'; fi
	@$(OCAMLOPT) -c $(unit-profile-lib-mirage-profile.compile-native) -impl $(BUILDIR)/lib-mirage-profile/profile.cml-native

-include Makefile.assemble
ifneq ($(filter-out clean help distclean,$(MAKECMDGOALS)),)
-include  \
    $(BUILDIR)/lib-mirage-profile/profile.ml.d \
    $(BUILDIR)/lib-mirage-profile/profile.mli.d
endif
include 