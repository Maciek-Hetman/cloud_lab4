# syntax=docker/dockerfile:1

# Zmiana z Alpine na Ubuntu
FROM ubuntu:latest
LABEL org.opencontainers.image.authors="s101572@pollub.edu.pl"

# Aktualizacje, czyszczenie apt i domyslnej strony apache w jednej komendzie żeby nie tworzyć zbyt wielu warstw
RUN apt-get update \
    && apt-get install -y --no-install-recommends apache2 \ 
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/www/html/*

# Kopiowanie strony
COPY index.html /var/www/html

EXPOSE 80

CMD [ "apachectl", "-D", "FOREGROUND" ]