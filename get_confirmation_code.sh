#!/bin/bash
#
# This script searches for the newest message from `Telegram` and extracts the confirmation code.
# It is necessary that the telegram-cli tool (https://github.com/vysheng/tg) is installed and configured
#
# Edit the `TELEGRAM` variable to point to your telegram-cli client and the key

TELEGRAM='/Users/mexx/code/tg/bin/telegram-cli -k ~/code/tg/server.pub'
echo -e "search Telegram code\nsearch Telegram code\n" | eval "$TELEGRAM" | egrep "Your login code: ([0-9]*)" | tail -n 1 | cut -c69-
