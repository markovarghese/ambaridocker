create database hive;
 grant all privileges on hive.* to 'hive'@'localhost' identified by 'simple123';
 grant all privileges on hive.* to 'hive'@'%' identified by 'simple123';

 create database ranger;
 grant all privileges on ranger.* to 'ranger'@'localhost' identified by 'simple123';
 grant all privileges on ranger.* to 'ranger'@'%' identified by 'simple123';

 create database rangerkms;
 grant all privileges on rangerkms.* to rangerkms@'localhost' identified by 'simple123';
 grant all privileges on rangerkms.* to rangerkms@'%' identified by 'simple123';

 create database oozie;
 grant all privileges on oozie.* to 'oozie'@'localhost' identified by 'simple123';
 grant all privileges on oozie.* to 'oozie'@'%' identified by 'simple123';

 create database superset DEFAULT CHARACTER SET utf8;;
 grant all privileges on superset.* to 'superset'@'localhost' identified by 'simple123';
 grant all privileges on superset.* to 'superset'@'%' identified by 'simple123';

 create database druid DEFAULT CHARACTER SET utf8;;
 grant all privileges on druid.* to 'druid'@'localhost' identified by 'simple123';
 grant all privileges on druid.* to 'druid'@'%' identified by 'simple123';