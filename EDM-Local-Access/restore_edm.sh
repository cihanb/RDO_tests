#!/bin/sh

# The MIT License (MIT)
#
# Copyright (c) 2019 RMS
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
# Script Name: restore_edm.sh
# Author: Cihan Biyikoglu - github:(cihanb)

#read settings
source ../settings_copy.sh

# STEP 1
# Start the docker container
docker rm -f sql1
# docker rmi -f $sql_container_tag
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=$sa_password" -p 1433:1433 --name sql1  -d $sql_container_tag


# STEP 2
# Copy backup file
unzip -o ./EDM_Test_Orig.bak.zip
docker exec -it sql1 mkdir /var/opt/mssql/backup
docker cp ./EDM_Test_Orig.bak sql1:/var/opt/mssql/backup
rm -f ./EDM_Test_Orig.bak
# output should indicate 2 files
# RMS_EDM_YYTest D:\AttachedDatabases\RMS_EDM_YYTest.mdf
# RMS_EDM_YYTest_log D:\AttachedDatabases\RMS_EDM_YYTest_log.LDF

# STEP 3
#Wait for sql startup 
sleep 5s
#restore edm db
docker exec -it sql1 /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$sa_password" -Q 'RESTORE DATABASE db1 FROM DISK = "/var/opt/mssql/backup/EDM_Test_Orig.bak" with REPLACE, MOVE "RMS_EDM_YYTest" to "/var/opt/mssql/RMS_EDM_YYTest.mdf", MOVE "RMS_EDM_YYTest_log" to "/var/opt/mssql/RMS_EDM_YYTest.ldf"'
