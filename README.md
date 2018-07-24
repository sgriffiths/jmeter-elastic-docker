# jmeter-elastic-docker
Loadtesting using jmeter with results published to ElasticSearch

# From Cli:
docker build -t scottyg/jmeter-elastic .

docker run scottyg/jmeter-elastic jmeter -n -t usr/{jmeter.jmx file}

# Interactive mode:
docker run -i -t scottyg/jmeter-elastic
