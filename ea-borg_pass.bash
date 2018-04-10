#!/bin/bash

# Determine logged in user
loggedInUser=$(/usr/bin/python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");')

KEYCHAIN=$(security find-generic-password -a $loggedInUser -s borg-passphrase -w)

if [[ -n ${KEYCHAIN} ]]; then
    RESULT="${KEYCHAIN}"
else
    RESULT="Not Found in keychain."
fi

echo "<result>${RESULT}</result>"
