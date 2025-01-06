# Use the Rocker Project's shiny image as the base
FROM rocker/shiny:latest

# Install necessary system libraries
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
    libxml2-dev \
    libcairo2-dev \
    libsqlite3-dev \
    libmariadbd-dev \
    libpq-dev \
    libssh2-1-dev \
    unixodbc-dev \
    libcurl4-openssl-dev \
    libssl-dev && \
    apt-get clean

# Install R packages required for your app
RUN R -e "install.packages(c('shiny', 'bslib', 'plotly', 'ggplot2', 'MASS', 'shinydashboard', 'tidyverse', 'DT', 'tidymodels', 'ggridges', 'tidytext'), repos='https://cran.rstudio.com/')"

# Create a directory for the Shiny app
RUN mkdir -p /src/shiny-server/app

# Copy your Shiny app files to the container
COPY ./R /src/shiny-server/app

# Expose the port for the Shiny app
EXPOSE 3838

# Set the default command to run the Shiny app
CMD ["R", "-e", "shiny::runApp('/srv/shiny-server/app', host='0.0.0.0', port=3838)"]
