FROM anapsix/alpine-java:latest

MAINTAINER "Ahmed Rabie"

RUN apk add --no-cache tini

COPY ./target/demo-0.0.1-SNAPSHOT.jar app.jar
COPY   scripts/checkenv.sh    /opt/checkenv.sh
RUN  chmod +x /opt/checkenv.sh
RUN  rm -rf /var/cache/apk/*

ENV APP_NAME=testapp

RUN touch crontab.tmp \
    && echo '0 * * * * /opt/checkenv.sh' >> crontab.tmp \
    && crontab crontab.tmp \
    && rm -rf crontab.tmp


RUN  crond -b -l 0 -L /var/log/cron.log

EXPOSE 80

CMD ["java" ,"-jar","app.jar"]