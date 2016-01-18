#!/bin/bash
#
# This script sends a message to `USER_NAME`
# The first argument to this script will be sent as the message
# It is necessary that the telegram-cli tool (https://github.com/vysheng/tg) is installed and configured
#
# Edit the `USER_NAME` variable to contain the username from which the message should be read. 
#   Attention: whitespaces in the username have to be substituted with underscores
# Edit the `TELEGRAM` variable to point to your telegram-cli client and the key

USER_NAME='M_C'
MESSAGE=$1
TELEGRAM='/Users/mexx/code/tg/bin/telegram-cli -k ~/code/tg/server.pub'
# Due to a bug in the telegram-cli it is necessary to request the contact list once and then perform the actual command
(sleep 1; echo "contact_list"; sleep 1; echo "msg $USER_NAME $MESSAGE") | eval "$TELEGRAM" 
