FROM r-base:4.2.2

# for GitHub actions
# Get the GitHub personal access token from secrets and store in default variable 
# used by the remotes package (GITHUB_PAT). GitHub secrets must not begin with `GITHUB_`
# hence the secret is named `API_GITHUB_PAT`. 
ENV GITHUB_PAT=$API_GITHUB_PAT

RUN apt-get update && \
apt-get install -y r-cran-devtools openjdk-11-jdk r-cran-gdtools

RUN R CMD javareconf

RUN Rscript -e "install.packages(c('rJava','SqlRender','DatabaseConnector','remotes'))"
RUN Rscript -e "remotes::install_github('OHDSI/DataQualityDashboard')"
RUN Rscript -e "remotes::install_github('OHDSI/Achilles')"
RUN Rscript -e "remotes::install_github('OHDSI/ROhdsiWebApi')"
RUN Rscript -e "remotes::install_github('EHDEN/CdmInspection')"
RUN Rscript -e "remotes::install_github('EHDEN/CatalogueExport')"