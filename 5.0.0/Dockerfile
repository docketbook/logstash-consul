FROM docketbook/elk-base:5.0.0

COPY helper.sh /usr/local/bin/helper.sh
COPY containerpilot.json /etc/containerpilot.json

#Install Logstash
RUN curl -O https://artifacts.elastic.co/downloads/logstash/logstash-5.0.0.tar.gz && \
	tar -zxvf logstash-5.0.0.tar.gz && \
	rm logstash-5.0.0.tar.gz && \
	mv logstash-5.0.0 /usr/logstash && \
	chmod +x /usr/local/bin/helper.sh

COPY logstash.conf.ctmpl /usr/logstash/logstash.conf.ctmpl

ENV CONTAINERPILOT=file:///etc/containerpilot.json

ENTRYPOINT ["/usr/local/bin/containerpilot", "/usr/logstash/bin/logstash", "-f", "/usr/logstash/logstash.conf"]

