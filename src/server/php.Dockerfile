FROM php:8.2-apache
RUN apt-get update && apt-get install -y cron vim iputils-ping dos2unix
RUN docker-php-ext-install mysqli
ADD ./crontab /etc/cron.d/crontab
RUN dos2unix /etc/cron.d/crontab
RUN chmod 0644 /etc/cron.d/crontab
RUN crontab /etc/cron.d/crontab
RUN cron

EXPOSE 80
