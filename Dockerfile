FROM python:3.6-slim-stretch

ENV DEBIAN_FRONTEND noninteractive

# pillow https://pillow.readthedocs.io/en/3.0.x/installation.html#external-libraries
# wkhtmltopdf fontconfig/xfonts-75dpi/xfonts-base/CJK support
# curl for healthcheck
RUN apt-get update && \ 
    apt-get install -y --no-install-recommends \
                    apt-utils \
                    curl \
                    libtiff5-dev \
                    zlib1g-dev \
                    libjpeg62-turbo-dev \  
                    zlib1g-dev \ 
                    libfreetype6-dev \ 
                    liblcms2-dev \
                    libwebp-dev \
                    tcl8.6-dev \ 
                    tk8.6-dev \ 
                    python-tk \
                    fontconfig \
                    xfonts-75dpi \
                    xfonts-base \
                    fonts-arphic-ukai \
                    fonts-arphic-uming \
                    fonts-ipafont-mincho \
                    fonts-ipafont-gothic \
                    fonts-unfonts-core \
                    && \
    rm -rf /var/lib/apt/lists/*

# install wkhtmltopdf 
RUN curl -sLO https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb && \
    dpkg -i wkhtmltox_0.12.5-1.stretch_amd64.deb && \
    rm -rf ./wkhtmltox_0.12.5-1.stretch_amd64.deb

# install pipenv awscli
RUN pip --no-cache-dir install -U pipenv awscli
