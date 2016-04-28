FROM docketbook/alpine-logstash:latest

COPY logstash_health.sh /usr/local/bin/logstash_health.sh

RUN wget -O containerpilot.tar.gz https://github.com/joyent/containerpilot/releases/download/2.1.0/containerpilot-2.1.0.tar.gz && \
  tar -xzf containerpilot.tar.gz -C /usr/local/bin && \
  rm -r containerpilot.tar.gz && \
  chmod +x /usr/local/bin/logstash_health.sh

COPY logstash-consul.json /etc/logstash-consul.json

ENV CONTAINERPILOT=file:///etc/logstash-consul.json

EXPOSE 5000

ENTRYPOINT [ "/usr/local/bin/containerpilot", "/logstash/bin/logstash", "-f", "/logstash/configurations/*", "--allow-env"]