FROM python:3.6-stretch

ENV DEBIAN_FRONTEND noninteractive

# pillow https://pillow.readthedocs.io/en/3.0.x/installation.html#external-libraries
# wkhtmltopdf xfonts-75dpi/xfonts-base/CJK support
RUN apt-get update && \ 
    apt-get install -y apt-utils \
                    wget \
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
                    xfonts-75dpi \
                    xfonts-base \
                    fonts-arphic-ukai \
                    fonts-arphic-uming \
                    fonts-ipafont-mincho \
                    fonts-ipafont-gothic \
                    fonts-unfonts-core \
                    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# install wkhtmltopdf 
RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb && \
    dpkg -i wkhtmltox_0.12.5-1.stretch_amd64.deb && \
    rm -rf ./wkhtmltox_0.12.5-1.stretch_amd64.deb


# install pipenv
RUN pip --no-cache-dir install pipenv awscli