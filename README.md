# borg-scripts

These scripts make a lot of assumptions:

1. Your server is configured for SSH key access
2. Your user is able to SSH to that server without the need for any password.
3. Your backups are stored in the home directory of the connecting user
  * It also assumes the backups directory/repo is called 'backups'
4. You are using a Mac as the client
  * I don't believe the host matters to these scripts.

This is an attempt at automating the initialization, creation, and execution of borg backups to a remote server with per-user repos and encryption. This also takes into account that the password/keys are backed up in the encrypted backup and are lost if the client is lost and the user doesn't know the password, which in this case, they won't since it's created for them randomly. The passgen script will sideload a file with the password that you can then escrow. I wrote it to be picked up by a Jamf Pro Extension Attribute for use in my environment.

These scripts/methods have been working in production in my environment since Janurary 2018.

* borg_setup
  * This is a big one. It creates the user's LaunchAgents for passgen and init and hourly.
  * borg_passgen is called at load of it's LaunchAgent, which is destroyed after 30 seconds.
  * borg_init is called at load of it's LaunchAgent, which is destroyed after 30 seconds.
  * borg_hourly's LaunchAgent is created, then loaded. It is not destroyed.
  * This MUST be run either by hand (`bash borg_setup`) or uploaded to the JSS. It will not work correctly if ran as a 'process' via a policy.
* borg_passgen is ran once with a LaunchAgent from borg_setup 
  * it assumes the correct person is logged in, and stores the password in their keychain and in .borgpass.
  * it assumes the user on the client is also a user on the server (LDAP, AD, whatever.)
* borg_init is ran once with a LaunchAgent from borg_setup
  * this needs to pull things out of the user's keychain. easiest way is if that user is running the script.
* borg_backup is ran hourly with a user LaunchAgent
  * it keeps one daily backup for 7 days, one weekly for 4 weeks, and one monthly for 6 months.
  * It does not keep hourly for the day, it only keeps the most recent hourly.
