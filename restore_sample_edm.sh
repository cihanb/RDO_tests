#!/bin/sh

# STEP 1
# Start the docker container
docker rm -f sql1
docker rmi -f mcr.microsoft.com/mssql/server:2019-CTP3.0-ubuntu
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=SA12#45678" -p 1433:1433 --name sql1  -d mcr.microsoft.com/mssql/server:2019-CTP3.0-ubuntu


# STEP 2
# Copy backup file
unzip ./EDM_Test_Orig.bak.zip
docker exec -it sql1 mkdir /var/opt/mssql/backup
docker cp ./EDM_Test_Orig.bak sql1:/var/opt/mssql/backup
rm -f ./EDM_Test_Orig.bak
# output should indicate 2 files
# RMS_EDM_YYTest D:\AttachedDatabases\RMS_EDM_YYTest.mdf
# RMS_EDM_YYTest_log D:\AttachedDatabases\RMS_EDM_YYTest_log.LDF

# STEP 3
docker exec -it sql1 /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'SA12#45678' -Q 'RESTORE DATABASE db1 FROM DISK = "/var/opt/mssql/backup/EDM_Test_Orig.bak" with REPLACE, MOVE "RMS_EDM_YYTest" to "/var/opt/mssql/RMS_EDM_YYTest.mdf", MOVE "RMS_EDM_YYTest_log" to "/var/opt/mssql/RMS_EDM_YYTest.ldf"'
