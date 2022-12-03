# .ssh-config-manager

## A Utility with below features
- add ssh connect
- list ssh connection
- update ssh connection
- delete ssh connection

### Add a connection
- otssh -a -n [Host] -h [Hostname] -u [User} -p [Port] -i [PathToKeyFile]

### List all ssh connection
* To list all the name of all connection added using utility
  - otssh ls
* to ist the name of all connection with details added using utility
  - otssh ls -d
  
### Update ssh connection 
* This updates the settings for connection mentioned after name
  - otssh -u -n [old host] -h [new host] -u [new user] -p [port]
  
### Delete ssh connection
* This Deletes the mentioned connection
  - otssh rm [host]
