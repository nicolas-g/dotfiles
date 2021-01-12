#!/bin/bash
# <bitbar.title>USCIS Case Status</bitbar.title>
# <bitbar.author>NG</bitbar.author>
# <bitbar.author.github>nicolas-g</bitbar.author.github>
# <bitbar.desc>Get's USCIS latest cases status hash
# <bitbar.version>0.1</bitbar.version>
# You first need to get the current case status update hash by running
# $ curl -s -X POST -d "appReceiptNum=$uscis_case_id"  https://egov.uscis.gov/casestatus/mycasestatus.do | grep $uscis_case_id | grep $uscis_case_id > $tmp_file
# $ /usr/local/bin/md5sum $tmp_file | cut -d" " -f1
# Once you get the result update the `last_cases_status_hash` variable so you have a value to compare
# and know when the latest case status hash is different in order to alert

tmp_file="/tmp/uscis_lin_hash.txt"
last_cases_status_hash="161ff8685665b31df1a3230e4b824ea4"
uscis_case_id="LIN1822851191"

curl -s --retry 5 --retry-delay 15 -X POST -d "appReceiptNum=$uscis_case_id"  https://egov.uscis.gov/casestatus/mycasestatus.do | grep $uscis_case_id | grep $uscis_case_id > $tmp_file

current_case_status_hash=$(/usr/local/bin/md5sum $tmp_file | cut -d" " -f1)

if [[ ${current_case_status_hash} == "${last_cases_status_hash}" ]]; then
    echo "NG| color=green"
    echo "---"
else
    echo "NG!| color=red"
    echo "---"
    #echo "Update"
    /usr/bin/say --rate 230 "Immigration status, updated"
fi
