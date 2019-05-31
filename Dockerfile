#FROM certbot/certbot
FROM debian:stable

WORKDIR /DirectEdit/

#RUN apk update && apk add wget unzip && apk del
RUN apt-get -y update && \
    apt-get -y install wget unzip certbot php php7.0-mbstring && \
    apt-get -y autoremove && apt-get -y clean
RUN wget 'https://github.com/disco-v8/DirectEdit/archive/master.zip' -O DirectEdit-master.zip && unzip ./DirectEdit-master.zip

WORKDIR /DirectEdit/DirectEdit-master
RUN chmod 700 ./*.php && chmod 600 ./*.conf
COPY txtedit.conf .

#RUn cat *.*

RUN mkdir -p /etc/letsencrypt/live/hukanzen.mydns.jp
RUN ls -l

CMD certbot certonly --manual \
        --preferred-challenges=dns \
        --manual-auth-hook /DirectEdit/DirectEdit-master/txtregist.php \
        --manual-cleanup-hook /DirectEdit/DirectEdit-master/txtdelete.php \
        -d $YOURDOMAIN -d *.$YOURDOMAIN \
        --server https://acme-v02.api.letsencrypt.org/directory \
        --agree-tos -m $YOURMAILADDR \
        --manual-public-ip-logging-ok
       # --dry-run \
