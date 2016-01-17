#!/bin/bash

TELEGRAM='/Users/mexx/code/tg/bin/telegram-cli -k ~/code/tg/server.pub'
echo -e "search Telegram code\nsearch Telegram code\n" | eval "$TELEGRAM" | egrep "Your login code: ([0-9]*)" | tail -n 1 | cut -c69-
