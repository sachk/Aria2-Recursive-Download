#!/bin/bash
x=0
readarray proxies < proxies.txt
readarray links < links.txt

for ((i=0; i<${#links[*]}; i++));
do
	echo aria2 -x$1 -j$1 -s$1 --all-proxy=${proxies[x]} ${links[i]} >> coms.txt
	if [[ $x == $(( ${#proxies[*]} - 1 )) ]]
	then 
		x=0
	else
		let "x++"
	fi

done
