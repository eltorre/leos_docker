FROM maven:3.5.4-jdk-8


# Dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
		unzip \
		wget \
 	&& rm -rf /var/lib/apt/lists/*
 	
WORKDIR /

RUN mkdir /leos && cd /leos && \
	wget https://joinup.ec.europa.eu/sites/default/files/distribution/access_url/2017-11/bb5bbee0-fe78-438b-8510-e712acd92cc9/LEOS-Pilot_1.0.0.zip && \
	unzip LEOS-Pilot_1.0.0.zip && \
	mv LEOS-Pilot_1.0.0/* . && \
	rm LEOS-Pilot_1.0.0.zip

RUN	cd /leos/tools/cmis/chemistry-opencmis-server-inmemory && \
	mvn clean install
	
RUN cd /leos/tools/user-repo && \
	mvn clean install
	
RUN	cd /leos && \
	mvn clean install
	
# Copy the docker-entrypoint.sh file 
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
	
#Entrypoint with no parameters
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["", ""]

EXPOSE 8080
