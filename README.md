# borg-scripts

these scripts make a lot of assumptions:

1. Your server is configured for SSH key access
2. Your backups are stored in the home directory of the connecting user
  * It also assumes the backups directory/repo is called 'backups'
3. You are using a Mac as the client
  * I don't believe the host matters to these scripts.

This is an attempt at automating the initialization, creation, and execution of borg backups to a remote server with per-user repos and encryption. This also takes into account that the password/keys are backed up in the encrypted backup and are lost if the host is lost and the user doesn't know the password, which in this case, they won't since it's created for them randomly. The passgen script will sideload a root read-only file with the password that you can then escrow. I wrote it to be picked up by a Jamf Pro Extension Attribute for use in my environment.

Currently, I'm still testing everything, but running them manually works. 

* borg_passgen is ran as root (casper policy or whatever. haven't figured out how I want it executed yet) 
  * it assumes the correct person is logged in, and stores the password in their keychain.
* borg_init needs to be ran as the USER.
  * this needs to pull things out of the user's keychain. easiest way is if that user is running the script.
* borg_backup should be launched by a launchd process and should be ran as the user.
