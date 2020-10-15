FROM php:7.4-cli

RUN apt-get update && apt-get -y install zip unzip nodejs npm

RUN curl -sS https://getcomposer.org/installer | php -- \
--install-dir=/usr/bin --filename=composer && chmod +x /usr/bin/composer

RUN npm install --save-dev stylelint stylelint-config-standard

COPY "entrypoint.sh" "/entrypoint.sh"
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]