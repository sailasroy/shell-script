#!/bin/bash

NAMES= $@
INSTANCE_TYPE=""
IMAGE_ID=ami-03265a0778a880afb
SECURITY_GROUP_ID=sg-021d144635db8f0b8
DOMAIN_NAME=sailasdevops.online
HOSTED_ZONE_ID=Z02662462B6M0IFT9U3J6
for i in $@
do
  if [[ $i == "mongodb" || $i == "mysql" ]]
  then
    INSTANCE_TYPE='t3.medium'
  else
    INSTANCE_TYPE='t2.micro'
  fi
  echo "creating $i instance"
  

       IP_ADDRESS=$(aws ec2 run-instances --image-id $IMAGE_ID --instance-type $INSTANCE_TYPE --security-group-ids $SECURITY_GROUP_ID --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" | jq -r '.Instances[0].PrivateIpAddress')
        echo "created instance $i : $IP_ADDRESS"

        aws route53 change-resource-record-sets --hosted-zone-id $HOSTED_ZONE_ID  --change-batch '
         {
            "Comment": "CREATE/DELETE/UPSERT a record ",
            "Changes": [{
            "Action": "CREATE",
                        "ResourceRecordSet": {
                                    "Name": "'$i.$DOMAIN_NAME'",
                                    "Type": "A",
                                    "TTL": 300,
                                 "ResourceRecords": [{ "Value": "'$IP_ADDRESS'"}]
}}]
}
'
####    #     aws route53 change-resource-record-sets --hosted-zone-id Z098285010FMU6PDV8O9P --change-batch '
    # {
    #         "Changes": [{
    #         "Action": "CREATE",
    #                     "ResourceRecordSet": {
    #                         "Name": "'$i.$DOMAIN_NAME'",
    #                         "Type": "A",
    #                         "TTL": 300,
    #                         "ResourceRecords": [{ "Value": "'$IP_ADDRESS'"}]
    #                     }}]
    # }
    # '

        ##"ResourceType=instance,Tags=[{Key=Name,Value=$i}]" | jq -r '.Instance[0].PrivateIpAddress'

       ##IP_ADDRESS=$(aws ec2 run-instances --image-id $IMAGE_ID --instance-type $INSTANCE_TYPE --security-group-ids $SECURITY_GROUP_ID --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" | jq -r '.Instances[0].PrivateIpAddress')

done