#!/usr/bin/env bash
sudo mount -t cifs //10.0.0.4/Pictures /home/chrs/nas/Pictures -o username=cso,password='user password',workgroup=workgroup,uid=chrs,gid=chrs
sudo mount -t cifs //10.0.0.4/Pictures /home/chrs/nas/Pictures -o username=cso,password='user password',workgroup=workgroup,uid=chrs,gid=chrs
sudo mount -t cifs //10.0.0.4/Backup /home/chrs/nas/Backup -o username=cso,password='user password',workgroup=workgroup,uid=chrs,gid=chrs
#sudo mount -t smb3 //10.0.0.4/Movies /home/chrs/nas/Movies -o username=cso,password='user password',workgroup=workgroup,uid=chrs,gid=chrs
#sudo mount -t smb3 //10.0.0.4/Backup /home/chrs/nas/Backup -o username=cso,password='user password',workgroup=workgroup,uid=chrs,gid=chrs
#sudo mount -t smb3 //10.0.0.4/Movies /home/chrs/nas/Movies -o username=cso,password='user password',workgroup=workgroup,uid=chrs,gid=chrs
