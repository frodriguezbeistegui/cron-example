FROM ubuntu
USER root
ADD crontab /etc/cron.d/hello-cron
ADD app /etc/app
RUN chmod 0644 /etc/cron.d/hello-cron

RUN chmod 0644 /etc/app

RUN touch /var/log/cron.log

RUN apt update
RUN apt install cron -y
RUN apt-get -y install curl gnupg
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash
RUN apt-get install -y nodejs

CMD cron && tail -f /var/log/cron.log
