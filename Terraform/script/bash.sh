#!/bin/bash

#install dependency for the amazon linux 2 

sudo yum update -y
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker
sudo yum install -y amazon-efs-utils
sudo yum install -y git

# export the tokens for the html file

export TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`
export META_INST_ID=`curl http://169.254.169.254/latest/meta-data/instance-id -H "X-aws-ec2-metadata-token: $TOKEN"`
export META_INST_PRIVATE_IP=`curl http://169.254.169.254/latest/meta-data/local-ipv4 -H "X-aws-ec2-metadata-token: $TOKEN"`
export META_INST_AZ=`curl http://169.254.169.254/latest/meta-data/placement/availability-zone -H "X-aws-ec2-metadata-token: $TOKEN"`

# goto the user 
cd /home/ec2-user

# create the index.html

echo "<!DOCTYPE html>" >> index.html
echo "<html lang="en">" >> index.html
echo "<head>" >> index.html
echo "    <meta charset="UTF-8">" >> index.html
echo "    <meta name="viewport" content="width=device-width, initial-scale=1.0">" >> index.html
echo "    <style>" >> index.html
echo "        @import url('https://fonts.googleapis.com/css?family=Open+Sans&display=swap');" >> index.html
echo "        html {" >> index.html
echo "            position: relative;" >> index.html
echo "            overflow-x: hidden !important;" >> index.html
echo "        }" >> index.html
echo "        * {" >> index.html
echo "            box-sizing: border-box;" >> index.html
echo "        }" >> index.html
echo "        body {" >> index.html
echo "            font-family: 'Open Sans', sans-serif;" >> index.html
echo "            color: #324e63;background-color: #9c83ff;" >> index.html
echo "        }" >> index.html
echo "        .wrapper {" >> index.html
echo "            width: 100%;" >> index.html
echo "            width: 100%;" >> index.html
echo "            height: auto;" >> index.html
echo "            min-height: 90vh;" >> index.html
echo "            padding: 50px 20px;" >> index.html
echo "            padding-top: 100px;" >> index.html
echo "            display: flex;" >> index.html
echo "        }" >> index.html
echo "        .instance-card {" >> index.html
echo "            width: 100%;" >> index.html
echo "            min-height: 380px;" >> index.html
echo "            margin: auto;" >> index.html
echo "            box-shadow: 12px 12px 2px 1px rgba(13, 28, 39, 0.4);" >> index.html
echo "            background: #fff;" >> index.html
echo "            border-radius: 15px;" >> index.html
echo "            border-width: 1px;" >> index.html
echo "            max-width: 500px;" >> index.html
echo "            position: relative;" >> index.html
echo "            border: thin groove #9c83ff;" >> index.html
echo "        }" >> index.html
echo "        .instance-card__cnt {" >> index.html
echo "            margin-top: 35px;" >> index.html
echo "            text-align: center;" >> index.html
echo "            padding: 0 20px;" >> index.html
echo "            padding-bottom: 40px;" >> index.html
echo "            transition: all .3s;" >> index.html
echo "        }" >> index.html
echo "        .instance-card__name {" >> index.html
echo "            font-weight: 700;" >> index.html
echo "            font-size: 24px;" >> index.html
echo "            color: #6944ff;" >> index.html
echo "            margin-bottom: 15px;" >> index.html
echo "        }" >> index.html
echo "        .instance-card-inf__item {" >> index.html
echo "            padding: 10px 35px;" >> index.html
echo "            min-width: 150px;" >> index.html
echo "        }" >> index.html
echo "        .instance-card-inf__title {" >> index.html
echo "            font-weight: 700;" >> index.html
echo "            font-size: 27px;" >> index.html
echo "            color: #324e63;" >> index.html
echo "        }" >> index.html
echo "        .instance-card-inf__txt {" >> index.html
echo "            font-weight: 500;" >> index.html
echo "            margin-top: 7px;" >> index.html
echo "        }" >> index.html
echo "    </style>" >> index.html
echo "    <title>Amazon EC2 Status</title>" >> index.html
echo "</head>" >> index.html
echo "<body>" >> index.html
echo "    <div class="wrapper">" >> index.html
echo "        <div class="instance-card">" >> index.html
echo "            <div class="instance-card__cnt">" >> index.html
echo "                <div class="instance-card__name">Your EC2 Instance is running!</div>" >> index.html
echo "                <div class="instance-card-inf">" >> index.html
echo "                    <div class="instance-card-inf__item">" >> index.html
echo "                        <div class="instance-card-inf__txt">INSTANCE ID</div>" >> index.html
echo "                        <div class="instance-card-inf__title">" $META_INST_ID "</div>" >> index.html
echo "                    </div>" >> index.html
echo "                    <div class="instance-card-inf__item">" >> index.html
echo "                        <div class="instance-card-inf__txt">AVAILABILITY ZONE</div>" >> index.html
echo "                        <div class="instance-card-inf__title">" $META_INST_AZ "</div>" >> index.html
echo "                    </div>" >> index.html
echo "                    <div class="instance-card-inf__item">" >> index.html
echo "                        <div class="instance-card-inf__txt">PRIVATE IP ADDRESS</div>" >> index.html
echo "                        <div class="instance-card-inf__title">" $META_INST_PRIVATE_IP "</div>" >> index.html
echo "                    </div>" >> index.html
echo "                </div>" >> index.html
echo "            </div>" >> index.html
echo "        </div>" >> index.html
echo "</body>" >> index.html
echo "</html>" >> index.html


# create a system requirement log file
echo "*****-------------------------------------------------------*****" >> ec2.log
echo "*****------------------------LOG FILE-----------------------*****" >> ec2.log
echo "*****-------------------------------------------------------*****" >> ec2.log
echo " instance id : " $META_INST_ID >> ec2.log
echo " availability zone :" $META_INST_AZ >> ec2.log
echo " private ip :" $META_INST_PRIVATE_IP >> ec2.log
echo "*****-------------------------------------------------------*****" >> ec2.log
echo " disk storage : [" >> ec2.log
df -h >> ec2.log
echo "                ]" >> ec2.log
echo "*****-------------------------------------------------------*****" >> ec2.log


# create folder and mount the efs
mkdir efs
echo "IP-ADDRESS DNS-NAME" | sudo tee -a /etc/hosts    # <efs-ip-address> <efs-dns-name> | sudo tee -a /etc/hosts
sudo mount -t efs -o tls EFS-ID:/ efs
# create seperate directory for the instances and moving the file to it
cd efs
sudo mkdir -p $META_INST_ID/html
sudo mkdir -p $META_INST_ID/log
cd ..
sudo mv index.html efs/$META_INST_ID/html
sudo mv ec2.log efs/$META_INST_ID/log


# now mount the efs directory to the nginx docker container
sudo docker run --name website -v /home/ec2-user/efs/$META_INST_ID/html/:/usr/share/nginx/html/ -d -p 80:80 nginx:latest
