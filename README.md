 ## Windows Server 
 #### OpenSSH Server Installed
 ##### powershell (adminstrator)
### check if installed 

Get-WindowsCapability -Online | Where-Object Name -like 'OpenSSH*'


Name : OpenSSH.Client~~~~0.0.1.0

State : NotPresent

Name : OpenSSH.Server~~~~0.0.1.0

State : NotPresent

Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0

Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0


## start ssh server 
Start-Service sshd

##### start automatically 
Set-Service -Name sshd -StartupType 'Automatic'

 
 
#  Linux 
### install sshfs 
sudo apt install sshfs 

#### mount remote server
sudo sshfs -o allow_other username@x.x.x.x:/G:  /mnt/test

### backup shell script 
run backup shell script which backs up to the mounted drive /mnt/test == x.x.x.x/G:/backupfolder:


 
