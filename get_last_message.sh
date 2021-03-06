#!/bin/bash
#
# This script searches for the newest message from `USER_NAME` and returns it
# It is necessary that the telegram-cli tool (https://github.com/vysheng/tg) is installed and configured
#
# Edit the `USER_NAME` variable to contain the username from which the message should be read. 
#   Attention: whitespaces in the username have to be substituted with underscores
# Edit the `TELEGRAM_PATH` variable to point to your telegram-cli client and the key
USER_NAME='M_C'
TELEGRAM_PATH='~/code/tg'

TELEGRAM="$TELEGRAM_PATH/bin/telegram-cli -k $TELEGRAM_PATH/server.pub"
# Due to a bug in the telegram-cli it is necessary to request the contact list once and then perform the actual command
(sleep 1; echo "contact_list"; sleep 1; echo "history $USER_NAME 1") | eval "$TELEGRAM" | egrep "\[[0-9]*:[0-9]*\]" | tail -n 1 | sed 's/.*» //'
