# ----- Global variables ---------------------------------------
R          := R --vanilla
DATADIR   ?= $(RESEARCH_DATA)
export DATADIR

# ----- Setup / bootstrap --------------------------------------
bootstrap:
	./bootstrap.sh          # <— calls the script above

# ----- Run analysis -------------------------------------------
analysis: _targets.R
	$(R) -e "targets::tar_make()"

.PHONY: bootstrap analysis clean
