# borg-scripts

these scripts make a lot of assumptions:

1. Your server is configured for SSH key access
2. Your backups are stored in the home directory of the connecting user
  * It also assumes the backups directory/repo is called 'backups'
3. You are using a Mac as the client
  * I don't believe the host matters to these scripts.

This is an attempt at automating the initialization, creation, and execution of borg backups to a remote server with per-user repos and encryption. This also takes into account that the password/keys are backed up in the encrypted backup and are lost if the host is lost and the user doesn't know the password, which in this case, they won't since it's created for them randomly. The passgen script will sideload a root read-only file with the password that you can then escrow. I wrote it to be picked up by a Jamf Pro Extension Attribute for use in my environment.
