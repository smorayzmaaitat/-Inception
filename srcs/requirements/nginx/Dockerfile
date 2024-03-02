FROM debian:11.7

RUN apt-get update && \
    apt-get install -y nginx openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/private.key -out /etc/nginx/cert.crt -subj '/CN=rix'

COPY conf/*.conf /etc/nginx/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

