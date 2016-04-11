FROM jwilder/nginx-proxy

VOLUME ["/etc/nginx/conf.d"]
VOLUME ["/etc/nginx/vhost.d"]

RUN { \
      echo 'proxy_cache_path /tmp/nginx-cache levels=1:2 keys_zone=nginx-cache:10m max_size=4g inactive=60m use_temp_path=off;'; \
    } > /etc/nginx/conf.d/my_proxy.conf

RUN { \
      echo 'proxy_cache my_cache;'; \
    } > /etc/nginx/vhost.d/default_location
