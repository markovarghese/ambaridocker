# use ubuntu as parent image
FROM ubuntu:18.04

# set timezone
RUN ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime

# copy mysql J connector
COPY mysql-connector-java_8.0.18-1ubuntu18.04_all.deb /tmp

# Install updates, ntp, wget
RUN apt update && \
      apt install -y ntp && \
        apt install -y wget && \
            apt install -y gnupg2 && \
              apt install /tmp/mysql-connector-java_8.0.18-1ubuntu18.04_all.deb

RUN wget -O /etc/apt/sources.list.d/ambari.list http://public-repo-1.hortonworks.com/ambari/ubuntu18/2.x/updates/2.7.4.0/ambari.list

RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com B9733A7A07513CAD

RUN apt-get update

RUN apt-get install -y ambari-server

RUN ambari-server setup -s

RUN ambari-server setup --jdbc-db=mysql --jdbc-driver=/usr/share/java/mysql-connector-java-8.0.18.jar --enable-lzo-under-gpl-license

# copy ambari server properties that has mariadb config etc.
# COPY conf/ambari.properties /etc/ambari-server/conf/ambari.properties
# COPY conf/ambari.properties /etc/ambari-server/conf/password.dat

# CMD /bin/bash
CMD ambari-server start && \
  service ntp start && \
  tail -F /dev/null