#!/bin/bash
# 2013-08-16 18:05:04.299 BST,,,8354,"",520e5bc0.20a2,1,"",2013-08-16 18:05:04 BST,,0,LOG,00000,"connection received: host=192.168.0.10 port=47672",,,,,,,,,""
#2013-08-16 18:05:04.300 BST,"vasilis","monkey",8354,"192.168.0.10:47672",520e5bc0.20a2,2,"authentication",
#2013-08-16 18:05:04 BST,2/3019,0,LOG,00000,"connection authorized: user=vasilis data

#
# Arguments
#
server_db=$1
ocip=$2
times=$3
cdate="2013-08-16"
#
#Variables
#

for a in `seq 1 $3`
	do
		cip=`echo $ocip".$((RANDOM%=255))"`;
		datetime=`date -d "$((RANDOM%1+2013))-$((RANDOM%1+8))-$((RANDOM%28+1)) $((RANDOM%23+1)):$((RANDOM%59+1)):$((RANDOM%59+1))" '+%Y-%m-%d %H:%M:%S'`;
		echo "$datetime.300 BST,\"app_user\",\"$server_db\",8354,\"$cip:47672\",520e5bc0.20a2,2,\"authentication\",$datetime BST,2/3019,0,LOG,00000,\"connection authorized: user=app_user database=$server_db\",,,,,,,,,\"\""
done