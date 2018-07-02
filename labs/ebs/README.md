# Amazon Elastic Block Store (Amazon EBS)

<p align="center"><img src="./images/logo.png"/></p>

The purpose of this AWS Immersion Day hands-on lab is to familiarize you with the Amazon Elastic Block Store (EBS) 
service. EBS is a block storage service that enables you to create volumes, and attach/detach them to Elastic Compute 
Cloud (EC2) instances. You can create EBS volumes with different volume types, such as: Provisioned IOPS (io1), General 
Purpose Solid State (gp2), Throughput Optimized HDD (st1), or Cold HDD (sc1), depending on the performance characteristics 
of your application. Once an EBS volume has been created, you can switch between different volume types, using the 
ModifyVolume API. Keep in mind that EBS volume modifications are limited to once every six (6) hours.

During this lab, you'll create an EBS volume, attach it to an EC2 instance, format and mount the volume, generate some 
ongoing disk activity, and then modify the volume attributes to increase its performance.

* [Prerequisites](#prerequisites)
* [Lab Steps](#lab-steps)
* [Create and attach EBS Volume](#create-and-attach-ebs-volume)
* [Run a Disk-heavy Workload](#run-a-disk-heavy-workload)
* [Modify EBS Volume Attributes](#modify-ebs-volume-attributes)
* [Cleanup](#cleanup)
* [Conclusion](#conclusion)

## Prerequisites

In order to fulfill this lab, you'll need an Amazon EC2 instance running Ubuntu Linux, and the SSH private key to connect 
to that EC2 instance.

## Lab Steps

- Create and attach EBS volume
- Run a disk-heavy workload
- Modify EBS volume attributes

## Create and attach EBS Volume

The first thing you'll do is create a new Elastic Block Store (EBS) volume. You'll simply specify the initial size for 
the volume, and assign it the default General Purpose SSD volume type. Next, you'll attach the new EBS volume to an EC2 
instance.

1. Open the AWS Management Console
1. Navigate to the Amazon EC2 service and click on Instances
1. Note the InstanceID and Availability Zone of your EC2 instance; you'll need this in a [moment]()
1. Under the Elastic Block Store heading, click Volumes
1. Click on the Create Volume button
1. Choose Volume Type: General Purpose SSD (gp2)
1. Size: 100 GB
1. Availability Zone: Use the Availability Zone noted in Step #3
1. Click the link containing the new EBS VolumeId
1. Right-click the new volume and click Attach Volume
1. Search for your InstanceID
1. Click the Attach button

At this point, your new EBS volume should be created and attached to your EC2 instance.

## Run a Disk-heavy Workload

Now that you've created an EBS volume, and attached it to an EC2 instance, you'll generate some ongoing disk activity. 
In the steps below, you'll log into your EC2 instance, create a filesystem on the EBS volume, mount the volume, and 
then initiate some disk activity.

1. Log into the EC2 instance via SSH:
    ```
    ssh -i ~/privatekey.pem ubuntu@ipaddress
    ```
1. Find the disk drive using the lsblk command
1. Create a filesystem on the disk, using the device name from step #2:
    ```
    sudo mkfs.ext4 /dev/xvdf
    ```
15. Mount the filesystem using the mount command:
    ```
    mkdir ~/ebstest; cd ~/ebstest; sudo mount /dev/xvdf ~/ebstest
    ```
16. Run this Bash command to generate disk activity:
    ```
    while [ true ]; do uuid=$(uuidgen); echo $uuid | sudo tee
    $uuid.json > /dev/null; done;
    ```

The Bash script will write some random JSON files to disk drive. Let the previous Bash command run while you move onto 
the next step.

## Modify EBS Volume Attributes

While the Bash script is still running on your EC2 instance, generating new data, you'll modify the attributes of the 
Elastic Block Store (EBS) volume, to scale it up to a different volume type and increase its IOPS.

1. Open the AWS Management Console
1. Navigate to the Amazon EC2 service
1. Under the Elastic Block Store heading, click Volumes
1. Right-click your volume and click Modify Volume
1. For Volume Type, choose Provisioned IOPS SSD (IO1)
1. For Iops, type 500
1. Click the Modify button, then Yes to confirm

Your volume will take some time to change its attributes to the newly
specified volume type and IOPS performance level. Notice that the disk
activity on your Linux EC2 instance continues to run while the EBS
volume is being modified.

## Cleanup

After completing this lab, make sure you clean up any resources that you created during execution of the lab steps.

1. Detach the EBS volume from the EC2 instance
1. Delete the EBS volume

## Conclusion

After completing this lab, you should be familiar with the essentials of the Amazon Elastic Block Store (EBS) service. 
You've learned how to create a new EBS volume and attach it to an EC2 instance. Next, you logged into your EC2 instance 
and partitioned and mounted the disk, and generated some mock disk activity. Finally, you used the AWS Management 
Console to reconfigure the EBS volume's attributes to change the volume type and increase its performance.

To learn more about Amazon Elastic Block Store, visit the 
[service documentation](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AmazonEBS.html).
