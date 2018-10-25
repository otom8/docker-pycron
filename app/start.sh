#!/bin/sh

service rsyslog start
service cron restart
if [ -e /work/my_requirements.txt ]
then
    pip install -r /work/my_requirements.txt
fi
python /app/run.py
crontab /etc/cron.d/pycron
trap : TERM INT
tail -f /dev/null & wait
