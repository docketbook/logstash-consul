# logstash-consul - Self-Registering Logstash Container

## Available Tags

* ```2.3.2```,```latest``` (2.3.2/Dockerfile)

## Description
This image contains an officially packaged version of Logstash installed into Alpine Linux. A basic configuration has been applied to Logstash to enable a basic input pipeline on TCP/UDP port 5000 set to the ```json``` codec. The output pipeline sends to the Elasticsearch host defined in the environment variable and also prints to stdout.

The output pipeline is set to use the index ```logstash-${ENVIRONMENT}-%{+YYYY.MM.dd}```. If no environment is specified, it will default to ```none```

This image also has ContainerPilot installed which with perform basic health/availablity checks on Logstash and register it with Consul. 

## Environment Variables
This image can utilise the following variables

* ```ELASTICSEARCH_HOST``` the hostname of the Elasticsearch host to use in the output pipeline. Since the sniffinf property is set to true, Logstash will use this host to discover other hosts.
* ```ENVIRONMENT``` the environment to use in the index name. An example would be ```development```
* ```CONSUL_ADDRESS``` sets the address of the Consul instance to register against. This should be in the form of ```hostname:8500``` such as ```discovery.provider.com:8500```. 

## Important Ports

* ```tcp/5000```, ```udp/5000``` the port on which Logstash will be listening for incoming logs