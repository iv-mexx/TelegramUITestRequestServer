# Telegram UI-Test Request Server

This project was built to enable communication of Unit Testcases (especially on iOS) with the Telegram Backend.

The corresponding iOS Project with Testcases implemented [can be found here](https://github.com/iv-mexx/Telegram-UI-Tests)

## Setup

First, install the dependencies via `npm install`.
You will need the [Telegram CLI](https://github.com/vysheng/tg) installed and configured. (Make sure to use the `--recursive` option when cloning and on OSX you may need to follow [this comment](https://github.com/vysheng/tg/issues/811#issuecomment-157707009)).

```
brew update
brew upgrade
brew install libconfig readline lua python libevent jansson
export CFLAGS="-I/usr/local/include -I/usr/local/Cellar/readline/6.3.8/include"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export LDFLAGS="-L/usr/local/opt/openssl/lib -L/usr/local/lib -L/usr/local/Cellar/readline/6.3.8/lib"
./configure && make
```

Start up the Telegram CLI at least once and setup your account. You should use the same phone number that you will use in your testcases so that the confirmation code is sent to your CLI client when requested from the Testcase. 

Create a new contact with your own number (This can only be done in the CLI and is necessary for the testcases to work properly, the testcases will send messages to yourself, otherwise you would need a second CLI user).

* In the telegram CLI: `add_contact <phone> <first name> <last name>`

Finally, edit the [get_confirmation_code.sh](get_confirmation_code.sh), [get_last_message.sh](get_last_message.sh) and [send_message.sh](send_message.sh): 
* `TELEGRAM_PATH` has to point to the directory of your telegram installation (assuming you have cloned the repo and built it yourself)
* `USER_NAME` is the name of the user to which you want to send messages / read the last message from. Keep in mind that you have to substitute whitespaces between first- and last name with underscores

Finally, start up the server with `npm start`. You can now send HTTP requests to `0.0.0.0:3000`

## Routes Available

* `GET confirmationCode`, returns the latest confirmation code
* `GET lastMessage`, returns the last message received from `USER_NAME`
* `POST message`, sends a message to `USER_NAME`. The body of the request has to be a JSON object `{ message: <your_message> }`

The GET routes take some time to process and return, you may need to increase the timeout of your network calls for these.

## Troubleshooting

*  Telegram CLI prints `Assertion failed: (0), function print_media, file interface.c, line 3446.`
  You need to apply [this patch](https://github.com/vysheng/tg/pull/920/files) to telegram (unless this PR is already merged by this time)