FROM docker.elastic.co/logstash/logstash:8.15.0

USER root

RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

RUN mkdir -p /usr/share/logstash/sincedb && \
    touch /usr/share/logstash/sincedb/sincedb_es.log && \
    chown -R logstash:logstash /usr/share/logstash/sincedb && \
    chmod 755 /usr/share/logstash/sincedb && \
    chmod 644 /usr/share/logstash/sincedb/sincedb_es.log


RUN mkdir -p /var/log/elasticsearch \
    && chown -R logstash:logstash /var/log/elasticsearch

RUN chown -R logstash:logstash /usr/share/logstash/pipeline /usr/share/logstash/config /usr/src/app

USER logstash
