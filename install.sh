#!/bin/bash

sudo service cron start
(crontab -l; echo "* * * * * $HOME/quai/check-stratum.sh > /dev/null 2>&1") | crontab -
(crontab -l; echo "* * * * * $HOME/quai/check-quai.sh > /dev/null 2>&1") | crontab -
