FROM ubuntu:16.04
MAINTAINER Alex

RUN apt-get update \
	&& apt-get install -y wget \ 
	&& rm -rf /var/lib/apt/lists/*
RUN cd /

# Update the APT cache
RUN sed -i.bak 's/main$/main universe/' /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# Install and setup project dependencies
RUN apt-get install -y curl wget

#prepare for Java download
RUN apt-get install -y python-software-properties
RUN apt-get install -y software-properties-common

#grab oracle java (auto accept licence)
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java8-installer

# Downloading TOMCAT
RUN wget http://apache.stu.edu.tw/tomcat/tomcat-7/v7.0.88/bin/apache-tomcat-7.0.88.tar.gz
RUN tar zxvf apache-tomcat-7.0.88.tar.gz


RUN rm -rf /var/lib/apt/lists/*

# ENV JAVA_HOME=/jdk1.8.0_171
# ENV PATH=$PATH:/jdk1.8.0_171/bin
CMD ["/apache-tomcat-7.0.88/bin/catalina.sh", "run"]
