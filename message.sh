#!/bin/bash
/Applications/Utilities/terminal-notifier.app/Contents/MacOS/terminal-notifier \
  -message "from script $(basename $0)" \
  -title test
