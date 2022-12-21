FROM r-base:4.2.2

RUN apt-get update && \
apt-get install -y r-cran-devtools openjdk-11-jdk r-cran-gdtools

RUN R CMD javareconf

RUN Rscript -e "c('rJava','SqlRender','DatabaseConnector','remotes')"
RUN Rscript -e "remotes::install_github('OHDSI/DataQualityDashboard')"
RUN Rscript -e "remotes::install_github('OHDSI/Achilles')"
RUN Rscript -e "remotes::install_github('OHDSI/ROhdsiWebApi')"
RUN Rscript -e "remotes::install_github('EHDEN/CdmInspection')"
RUN Rscript -e "remotes::install_github('EHDEN/CatalogueExport')"