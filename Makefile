
.DEFAULT_GOAL := all

# Directories
builddir  = build
srcdir    = source
sbomdir   = $(builddir)/sbom

# Binaries
PYTHON ?= python3

CYCLONEDX_PY  = $(PYTHON) -m cyclonedx_py
PIP           = $(PYTHON) -m pip
SPHINXOPTS    ?=
SPHINXBUILD   = $(PYTHON) -m sphinx


# REAL TARGETS #
################

$(sbomdir) :
	@mkdir -p $(sbomdir)


$(sbomdir)/host-python.sbom.cdx.json : $(sbomdir)
	$(PIP) freeze --all | $(CYCLONEDX_PY) requirements - >$@


# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
% : Makefile
	$(SPHINXBUILD) -M $@ "$(srcdir)" "$(builddir)" $(SPHINXOPTS) $(O)


# PHONY TARGETS #
#################
.PHONY : Makefile

# Build all supported output formats.
all : latexpdf sbom
.PHONY : all


clean :
	@rm -Rf $(builddir)
.PHONY : clean


help :
	@$(SPHINXBUILD) -M help "$(srcdir)" "$(builddir)" $(SPHINXOPTS) $(O)
.PHONY : help


sbom : $(sbomdir)/host-python.sbom.cdx.json
.PHONY : sbom
