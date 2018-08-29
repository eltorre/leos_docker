FROM maven:3.5.4-jdk-8


# Dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
		unzip \
		wget \
 	&& rm -rf /var/lib/apt/lists/*
 	
WORKDIR /

RUN mkdir /leos && cd /leos && \
	wget https://joinup.ec.europa.eu/sites/default/files/distribution/access_url/2018-08/3cb1e8a1-2dab-4455-a0f6-69f990e9af42/LEOS-Pilot_2.0.0.zip && \
	unzip LEOS-Pilot_2.0.0.zip && \
	rm LEOS-Pilot_2.0.0.zip

RUN	cd /leos/tools/cmis/chemistry-opencmis-server-inmemory && \
	mvn clean install
	
RUN cd /leos/tools/user-repo && \
	mvn clean install
	
RUN cd /leos/modules/annotate && \
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
