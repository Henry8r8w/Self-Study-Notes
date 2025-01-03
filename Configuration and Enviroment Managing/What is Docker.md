
### Docker
[1]
#### Docker 101 for Data Scientist
The components
1. Dockerfile - Describes the steps needed to create an environment
2. Image - The result product of the execution of dockerfile; it contains the enviroment
3. Registry - Stores built images, so that others can use them
4. Container - At a specific moment, you can start a container from the image, which amounts to running a process in the built environment. This is drinking a pint from the batch of beer.

It is note-worthy that the container incoporate the process itself

Using R as example

| Development Session          | Production Run      |
|------------------------------|---------------------------|
| **Use Case**                 | Create an analysis in a controlled environment | Run a production model |
| **Runtime Entrypoint**       | RStudio                  | R                        |
| **Example Process**          | IDE Session              | `R -e 'shiny::runApp()'` |
| **Code & Environment**       | Changes are Saved        | Read Only                |


Docker images can inherit and build off of one another, allowing these six components to be layers together to form a complete image that inherits components from earlier base images

ex. Base OS(linux/window/mac os) -> System Dependency (libssl) -> R version 3.5.2 -> Packages (xgboost) -> Code (report.Rmd) -> Command (R -e rmarkdown::render)
- note: each layer is cached

#### Example base Operating System and System Dependency dockerfile

```
FROM ubuntu:xenial
# Install system dependencies for R
RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    apt-transport-https \
    build-essential \
    curl \
    gfortran \
    libatlas-base-dev \
    libbz2-dev \
    libcairo2 \
    libcurl4-openssl-dev \
    libicu-dev \
    liblzma-dev \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libpcre3-dev \
    libtcl8.6 \
    libtiff5 \
    libtk8.6 \
    libx11-6 \
    libxt6 \
    locales \
    tzdata \
    zlib1g-dev
    
# Install system dependencies for the tidyverse R packages
RUN apt-get install -y \
    make
    libcurl4-openssl-dev
    libssl-dev
    pandoc
    libxml2-dev
```

#### R
There are three ways that R can be added to Docker
1.Start from a base image that includes R
FROM rstudio/r-base:3.5-xenial
2.Include the commands to install R within an image.
#### download a version of R and build from source
```
# ubuntu dowload
ARG R_VERSION=3.5.2
RUN wget https://cdn.rstudio.com/r/ubuntu-1604/pkgs/r-${R_VERSION}_1_amd64.deb
RUN apt-get update && \
    apt-get install -y ./r-${R_VERSION}_1_amd64.deb
```
3. Install R using the system package manager, such as apt, yum, or zypper. 
```
# not the recommended approach
# be sure you request a specific version of R
RUN apt-get install -y \
  r-base=3.4.4-1ubuntu1
```

References
[1]“Docker – Solutions,” Solutions, 2024. https://solutions.posit.co/envs-pkgs/environments/docker/ 
‌
