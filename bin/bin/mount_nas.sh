#!/usr/bin/env bash
sudo mount -t cifs //10.1.1.4/Backup /home/chrs/nas/Backup -o username=$nasusername,password=$nasuserpassword,workgroup=workgroup,uid=chrs,gid=chrs
sudo mount -t cifs //10.1.1.4/Pictures /home/chrs/nas/Pictures -o username=$nasusername,password=$nasuserpassword,workgroup=workgroup,uid=chrs,gid=chrs
sudo mount -t cifs //10.1.1.4/Movies /home/chrs/nas/Movies -o username=$nasusername,password=$nasuserpassword,workgroup=workgroup,uid=chrs,gid=chrs
sudo mount -t cifs //10.1.1.4/Music /home/chrs/nas/Music -o username=$nasusername,password=$nasuserpassword,workgroup=workgroup,uid=chrs,gid=chrs
#sudo mount -t smb2 //10.1.1.4/Movies /home/chrs/nas/Movies -o username=cso,password=S.0D6z1,workgroup=workgroup,uid=chrs,gid=chrs
#sudo mount -t smb2 //10.1.1.4/Backup /home/chrs/nas/Backup -o username=cso,password=S.0D6z1,workgroup=workgroup,uid=chrs,gid=chrs
#sudo mount -t smb2 //10.1.1.4/Music /home/chrs/nas/Music -o username=cso,password=S.0D6z1,workgroup=workgroup,uid=chrs,gid=chrs
#sudo mount -t smb2 //10.1.1.4/Pictures /home/chrs/nas/Pictures -o username=cso,password=S.0D6z1,workgroup=workgroup,uid=chrs,gid=chrs
