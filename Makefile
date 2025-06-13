
.DEFAULT_GOAL := all

# Directories
builddir  = build
srcdir    = source

# Binaries
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build


# PHONY TARGETS #
#################

.PHONY : all help clean Makefile


# Build all supported output formats.
all : latexpdf


clean :
	@rm -Rf $(builddir)


help :
	@$(SPHINXBUILD) -M help "$(srcdir)" "$(builddir)" $(SPHINXOPTS) $(O)



# REAL TARGETS #
################

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
% : Makefile
	$(SPHINXBUILD) -M $@ "$(srcdir)" "$(builddir)" $(SPHINXOPTS) $(O)
