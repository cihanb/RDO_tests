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
# Script Name: edm_import_to_riskmodeler.sh
# Author: Cihan Biyikoglu - github:(cihanb)

#read settings
source ../settings_copy.sh

# STEP 1
# inflate EDM backup file
unzip -o ../EDM-Local-Access/EDM_Test_Orig.bak.zip

# STEP 2
# upload EDM to riskmodeler

java -jar $cli_upload_tool_path/com.rms.core.upload.cli.jar "$rm_username" "$rm_password" ./EDM_Test_Orig.bak $edm_name

# STEP 3
# cleanup 
# rm -f ./EDM_Test_Orig.bak