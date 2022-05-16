FROM adhocore/phpfpm:8.0

RUN \
  # install
  apk add -U --no-cache \
    mysql \
    nginx \
    supervisor \
  # cleanup
  && rm -rf /var/cache/apk/* /tmp/* /var/tmp/* /usr/share/doc/* /usr/share/man/*

# nginx config
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf


# resource
COPY ./index.php /var/www/html/index.php

# supervisor config
COPY \
  mysql/mysql.ini \
  nginx/nginx.ini \
  php/php-fpm.ini \
    /etc/supervisor.d/

# entrypoint
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

WORKDIR /data
VOLUME /data


# ports
EXPOSE 3306 80

# commands
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["supervisord", "-n", "-j", "/supervisord.pid"]
