FROM debian:11.7

RUN apt update
RUN apt upgrade -y
RUN apt install curl -y
RUN apt install mariadb-client -y
RUN apt install php-mysql -y
RUN apt install php-fpm -y


COPY ./conf/*.sh .

RUN chmod 777 /*.sh
EXPOSE 9000

CMD ["./create_wordpress.sh"]
