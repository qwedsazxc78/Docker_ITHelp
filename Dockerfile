FROM ubuntu:lastest
MAINTAINER Alex

RUN apt-get update \
	&& apt-get install -y wget \ 
	&& rm -rf /var/lib/apt/lists/*



RUN cd /

ADD jdk-8u171-linux-x64.tar.gz /

RUN wget http://apache.stu.edu.tw/tomcat/tomcat-7/v7.0.88/bin/apache-tomcat-7.0.88.tar.gz
RUN tar zxvf apache-tomcat-7.0.88.tar.gz


ENV JAVA_HOME=/jdk1.8.0_171
ENV PATH=$PATH:/jdk1.8.0_171/bin
CMD ["/apache-tomcat-7.0.88/bin/catalina.sh", "run"]
