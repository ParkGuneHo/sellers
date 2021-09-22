from docker.io/tomcat:8.5

#ROOT 계정으로 설정한다. 
USER root

#JENNIFER SERVER IP를 환경변수로 설정한다. 
#ENV JENNIFER_SERVER_IP=192.168.100.104
#ENV JENN_SERVER_IP=192.168.100.104

#COPY ./certs/output.cert ./
#COPY ./certs/InstallCert.java ./
#SSL Certs 파일을 import 한다. 
#RUN keytool -importcert -noprompt -keystore /usr/local/openjdk-8/jre/lib/security/cacerts -storepass changeit -file ./output.cert -alias keycloak-thesellers.apps.test.cloudia-1

#JENNIFER AGENT가 설치된 디렉토리를 만든다. 
RUN mkdir /usr/local/jennifer5

#the sellers 소스파일을 복사한다. 
#COPY ROOT.war /usr/local/tomcat/webapps
RUN mkdir /usr/local/tomcat/ROOT
COPY ROOT /usr/local/tomcat/webapps/ROOT

#JENNIFER5 설치파일을 압축 푼다. 
#COPY ./jennifer5/jennifer-agent-java-5.5.1.2.zip /usr/local/jennifer5
#RUN cd /usr/local/jennifer5 && \
      /usr/local/openjdk-8/bin/jar -xvf jennifer-agent-java-5.5.1.2.zip 
#COPY ./jennifer5/thesellers.conf /usr/local/jennifer5/agent.java/conf
#COPY ./jennifer5/catalina.sh /usr/local/tomcat/bin/

#폴더 권한을 바꿔준다.
#RUN chmod -R 777 /usr/local/tomcat /usr/local/jennifer5
