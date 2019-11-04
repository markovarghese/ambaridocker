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

RUN apt-get install -y ambari-agent

RUN sed -i -e "s/hostname=localhost/hostname=ambariserver/"g /etc/ambari-agent/conf/ambari-agent.ini

# RUN ambari-server setup --jdbc-db=mysql --jdbc-driver=/usr/share/java/mysql-connector-java-8.0.18.jar --enable-lzo-under-gpl-license

# CMD /bin/bash
# CMD tail -f /dev/null
CMD ambari-agent start && \
  service ntp start && \
  tail -F /dev/null

#  tail -F /var/log/ambari-agent/ambari-agent.out