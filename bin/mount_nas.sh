#!/usr/bin/env bash
#sudo mount -t cifs //10.1.1.4/Backup /home/chrs/nas/Backup -o username=<username>,password=<password>,workgroup=workgroup,uid=chrs,gid=chrs
#sudo mount -t cifs //10.1.1.4/Pictures /home/chrs/nas/Pictures -o username=<username>,password=<password>,workgroup=workgroup,uid=chrs,gid=chrs
#sudo mount -t cifs //10.1.1.4/Movies /home/chrs/nas/Movies -o username=<username>,password=<password>,workgroup=workgroup,uid=chrs,gid=chrs
#sudo mount -t cifs //10.1.1.4/Music /home/chrs/nas/Music -o username=<username>,password=<password>,workgroup=workgroup,uid=chrs,gid=chrs
sudo mount -t smb2 //10.1.1.4/Movies /home/chrs/nas/Movies -o username=<username>,password=<password>,workgroup=workgroup,uid=chrs,gid=chrs
sudo mount -t smb2 //10.1.1.4/Backup /home/chrs/nas/Backup -o username=<username>,password=<password>,workgroup=workgroup,uid=chrs,gid=chrs
sudo mount -t smb2 //10.1.1.4/Music /home/chrs/nas/Music -o username=<username>,password=<password>,workgroup=workgroup,uid=chrs,gid=chrs
sudo mount -t smb2 //10.1.1.4/Pictures /home/chrs/nas/Pictures -o username=<username>,password=<password>,workgroup=workgroup,uid=chrs,gid=chrs
