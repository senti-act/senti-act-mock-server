#!/bin/bash

if [[ "$1" == "master" ]]; then
	echo
	echo Deploying Senti mock-server $1 ...
	rsync -r --quiet $2/ deploy@rey.webhouse.net:/srv/nodejs/senti/act/mock-server/production
	echo
	echo Restarting Senti mock-server service: $1 ...
	ssh deploy@rey.webhouse.net 'sudo /srv/nodejs/senti/act/mock-server/production/scripts/service-restart.sh master'
	echo
	echo Deployment to Senti mock-server $1 and restart done!
	exit 0
fi

if [[ "$1" == "dev" ]]; then
	echo
	echo Deploying Senti mock-server $1 ...
	rsync -r --quiet $2/ deploy@rey.webhouse.net:/srv/nodejs/senti/act/mock-server/development
	echo
	echo Restarting Senti mock-server service: $1 ...
	ssh deploy@rey.webhouse.net 'sudo /srv/nodejs/senti/act/mock-server/development/scripts/service-restart.sh dev'
	echo
	echo Deployment to Senti mock-server $1 and restart done!
	exit 0
fi