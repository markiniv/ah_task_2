#!/bin/bash

if [ "$2" == "domain" ]; then
	if [ ! -d "$1" ]; then
    	mkdir $1
	fi
	part_0=${3#h*//}		
	part_1=${part_0#w*.}
	part_2=${part_1%.*}
	site='https://www.whois.com/whois/'${part_1}
	final=${part_2#w*.}'_'${3##*.}
	echo $site
	curl -o $1/$final.html $site
elif [ "$2" == "file" ]; then
	if [ ! -d "$1" ]; then
		mkdir $1
	fi
	for domain in `cat $3`; do
		part_0=${domain#h*//}
		part_1=${part_0#w*.}
		part_2=${part_1%.*}
		site='https://www.whois.com/whois/'${part_1}
		final=${part_2#w*.}'_'${domain##*.}'.html'
		echo $site
		curl -o $1/$final $site
	done
fi