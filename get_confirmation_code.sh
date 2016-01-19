#!/bin/bash
#
# This script searches for the newest message from `Telegram` and extracts the confirmation code.
# It is necessary that the telegram-cli tool (https://github.com/vysheng/tg) is installed and configured
#
# Edit the `TELEGRAM_PATH` variable to point to your telegram-cli client and the key
TELEGRAM_PATH='~/code/tg'

TELEGRAM="$TELEGRAM_PATH/bin/telegram-cli -k $TELEGRAM_PATH/server.pub"
echo -e "search Telegram code\nsearch Telegram code\n" | eval "$TELEGRAM" | egrep "Your login code: ([0-9]*)" | tail -n 1 | sed 's/.*code: //'
