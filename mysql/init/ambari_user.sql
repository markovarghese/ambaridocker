CREATE USER 'ambari'@'%' IDENTIFIED BY 'bigdata';
GRANT ALL PRIVILEGES ON *.* TO 'ambari'@'%';
CREATE USER 'ambari'@'localhost' IDENTIFIED BY 'bigdata';
GRANT ALL PRIVILEGES ON *.* TO 'ambari'@'localhost';
CREATE USER 'ambari'@'ambariserver' IDENTIFIED BY 'bigdata';
GRANT ALL PRIVILEGES ON *.* TO 'ambari'@'ambariserver';
FLUSH PRIVILEGES;