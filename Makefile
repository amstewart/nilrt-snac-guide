
.DEFAULT_GOAL := all

# Directories
builddir  = build
srcdir    = source

# Binaries
PYTHON ?= python3

SPHINXOPTS    ?=
SPHINXBUILD   ?= $(PYTHON) -m sphinx


# REAL TARGETS #
################

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
% : Makefile
	$(SPHINXBUILD) -M $@ "$(srcdir)" "$(builddir)" $(SPHINXOPTS) $(O)


# PHONY TARGETS #
#################
.PHONY : Makefile

# Build all supported output formats.
all : latexpdf
.PHONY : all


clean :
	@rm -Rf $(builddir)
.PHONY : clean


help :
	@$(SPHINXBUILD) -M help "$(srcdir)" "$(builddir)" $(SPHINXOPTS) $(O)
.PHONY : help
