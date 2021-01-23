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
last_cases_status_hash="f9121deed5eead4672c17c0d07107d7c"
uscis_case_id="LIN1822851191"

curl -s --retry 5 --retry-delay 15 -X POST -d "appReceiptNum=$uscis_case_id"  https://egov.uscis.gov/casestatus/mycasestatus.do | grep $uscis_case_id | grep $uscis_case_id > $tmp_file

last_update_date=$(grep On $tmp_file | cut -d"," -f 1 | cut -d">" -f 2 | awk '{ print $2 $3}')

current_case_status_hash=$(/usr/local/bin/md5sum $tmp_file | cut -d" " -f1)

if [[ ${current_case_status_hash} == "${last_cases_status_hash}" ]]; then
    echo "G| color=green"
    echo "---"
    echo "Last case update: $last_update_date"
elif [[ ${current_case_status_hash} == "d41d8cd98f00b204e9800998ecf8427e" ]]; then
    # when site is not reachable the m5sum hash value is d41d8cd98f00b204e9800998ecf8427e
    echo "G!| color=red"
    echo "---"
    echo "$last_update_date SITE NOT REACHABLE"
    /usr/bin/say --rate 230 "Immigration site not reachable"
else
    echo "G| color=red"
    echo "---"
    echo "Last case update: $last_update_date"
    /usr/bin/say --rate 230 "Immigration status, updated"
fi
