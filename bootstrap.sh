#!/usr/bin/env bash
set -e

# ---------- set a CRAN mirror for non-interactive installs ----------
CRAN="https://cran.rstudio.com"        # pick any mirror you like
R_REPOS="options(repos = c(CRAN = '$CRAN'))"

# ---------- 1. make sure renv exists ----------
Rscript -e "$R_REPOS; if (!requireNamespace('renv', quietly = TRUE)) install.packages('renv')"

# ---------- 2. initialise / activate renv & install core pkgs ----------
Rscript - <<RSCRIPT
  $R_REPOS                                # set mirror again inside this session

  if (!file.exists('renv/activate.R')) {
    renv::init(bare = TRUE)
  } else {
    renv::activate('.')
  }

  renv::install(c('github::ljmotley/motleytools', 'targets', 'tidyverse'))
  renv::snapshot()
RSCRIPT

echo "Bootstrap complete ✓  (renv + core packages locked)"
