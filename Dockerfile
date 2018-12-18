FROM centos

RUN yum install -y java

VOLUME /tmp

# Copy built jar to img
ADD /target/spring-boot-web-0.0.1-SNAPSHOT.jar myapp.jar

# Force file to show updated
RUN sh -c 'touch /myapp.jar'

ENTRYPOINT [ "java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/myapp.jar" ]