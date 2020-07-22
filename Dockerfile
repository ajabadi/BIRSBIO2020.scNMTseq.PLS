FROM bioconductor/bioconductor_docker:devel

WORKDIR /home/rstudio

COPY --chown=rstudio:rstudio . /home/rstudio/

RUN Rscript -e "Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS=TRUE); options(repos = c(CRAN = 'https://cran.r-project.org')); BiocManager::repositories(); remotes::install_deps(dependencies = TRUE, build_vignettes = FALSE, upgrade = 'never', repos = BiocManager::repositories()); devtools::install('.', dependencies=FALSE, build_vignettes=TRUE, upgrade = 'never')"
