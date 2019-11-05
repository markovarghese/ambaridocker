# ambaridocker

tldr; this isn't fully working yet.

## Northstar
- Run Ambari cluster on Docker, so that Apache Atlas, Apache Ranger etc can be tested locally easily. 
- Ambari cluster is installed in Docker with minimal deviation from the installation documentation of Ambari as provided by Cloudera, ref https://docs.cloudera.com/HDPDocuments/Ambari-2.7.4.0/bk_ambari-installation/content/ch_Getting_Ready.html
- Minimise/consolidate the number of databases needed to support Ambari and the platforms it  sspins up, like Hive, Ranger, etc. 

## What this repo does today
- Uses docker compose to spin up
    - 1 Ambari server `ambariserver`
        - has PostgreSQL server intalled on it with default user/password `ambari`/`bigdata`
    - 3 Ambari agents `ambariagent[1-3]`
    - 1 MariaDB server `mariadbserver`
        - has users and empty databases to support
            - Ambari 
                - we're not using it now - we will replace the PostgreSQL server with this in the future
            -  Druid
            - Hive
            - Oozie
            - Ranger
            - Ranger KMS
        - all passwords are `simple123`
- You need to
    - bring up the environment, using `docker compose up -d`
    - wait for ~5 minutes to allow time for the MySQL startup script to create the users and schema
    - Open http://localhost:8080 and run the Ambari wizard to install Apache Kafkaa, Ranger, etc.
        -  During the install, choose MariaDB/MySQL as the database for Apache Hive, Ranger, etc. Provide `mariadbserver` as the hostname for the existing MySQL cluster.
    - Once you are done/stuck, bring down the environment using `docker compose down`

> Note: There is an open bug that prevents Apache Yarn from starting, once the Ambari wizard is done
