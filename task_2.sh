#!/bin/bash

if [ "$2" == "domain" ]; then
	echo $3
	if [ ! -d "$1" ]; then
    	mkdir $1
	fi
	`whois $3 >> $1/github_com.html`
elif [ "$2" == "file" ]; then
	if [ ! -d "$1" ]; then
		mkdir $1
	fi
	for domain in `cat $3`; do
	   echo $domain
	   `whois $domain >> $1/github_com.html`
	done
fi