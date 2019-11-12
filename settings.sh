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
# Script Name: settings.sh
# Author: Cihan Biyikoglu - github:(cihanb)

##sql settings
sql_container_tag="mcr.microsoft.com/mssql/server:2019-CTP3.0-ubuntu"
sa_password="sa_password"

#riskmodeler settings
rm_username="your_username"
rm_password="your_password"

#cli_upload_tool settings
cli_upload_tool_path="/path/to/cli-upload-tool"
edm_name="edm_name_in_riskmodeler"

#print colors
info_color="\033[1;32m"
warning_color="\033[0;33m"
error_color="\033[0;31m"
no_color="\033[0m"