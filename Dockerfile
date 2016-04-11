FROM jwilder/nginx-proxy

#RUN mkdir /etc/nginx/conf.d
RUN echo 'proxy_cache_path /tmp/nginx-cache levels=1:2 keys_zone=nginx-cache:10m max_size=4g inactive=60m use_temp_path=off;' \
  > /etc/nginx/conf.d/cache.conf

RUN mkdir /etc/nginx/vhost.d
RUN echo 'proxy_cache nginx-cache;' \
  > /etc/nginx/vhost.d/default

RUN echo 'proxy_cache_revalidate on;' \
  > /etc/nginx/vhost.d/default_location

VOLUME /etc/nginx/conf.d
VOLUME /etc/nginx/vhost.d
