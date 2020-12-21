
<p align="center">
  <img src="https://img.s3wfg.com/web/img/images_uploaded/8/c/dominion_logo_620x350.jpg" />
</p>

# Jitsi Meet on Amazon Elastic Container Service

![](docs/jitsi-docker.png)

[Jitsi](https://jitsi.org/) is a set of Open Source projects that allows you to easily build and deploy secure videoconferencing solutions.

[Jitsi Meet](https://jitsi.org/jitsi-meet/) is a fully encrypted, 100% Open Source video conferencing solution that you can use all day, every day, for free — with no account needed.

This repository contains the necessary tools to run a Jitsi Meet stack on [Docker](https://www.docker.com) using [Docker Compose](https://docs.docker.com/compose/), as well as the instructions needed to deployment the stack in [Amazon Elastic Container Services](https://aws.amazon.com/ecs/)

## Getting Started

### Prerequisites

You have got to install the following tools: 
- [ecs-cli](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ECS_CLI_installation.html)
- [docker](https://docs.docker.com/get-docker)
- [docker-compose](https://docs.docker.com/compose/install)

Whether you use a IAM service account or IAM user it has to have the following permissions/roles:
- AmazonECS_FullAccess
- ElasticLoadBalancingFullAccess

### Setting up Elastic Container Service

[Generate a Access Key](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html#Using_CreateAccessKey) in the AWS Console and [set up](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ECS_CLI_Configuration.html) the ecs-cli to use it.

The following environment variables will be set in the shell:

| Name | Description | Example |
| --- | --- | --- |
| PROFILE_NAME | Specifies the profile name to use | aws |
| AWS_ACCESS_KEY_ID | Specifies the AWS access key to use | AKIAXKO5CYVQ3XXXXXXX |
| AWS_SECRET_ACCESS_KEY | Specifies the AWS secret key to use | KHvshFRp8SstYaou936ZtQD0IaaZXXXXXXXXXXXX |
| ECS_CLUSTER | Specifies the ECS cluster name to use | jitsi-cluster |
| AWS_REGION | Specifies the AWS region to use | eu-west-3 |
| AWS_KEYPAIR | Specifies the name of an existing key pair to enable SSH access to the EC2 instances | jitsi-keypair | 
| AWS_INSTANCE_TYPE | Specifies the EC2 instance type for your container instances | m5.xlarge |
| ECS_CLUSTER_SIZE | Specifies the number of instances to launch and register to the cluster | 2 |


Configure ECS Credentials
```bash
export PROFILE_NAME=<replace>
export AWS_ACCESS_KEY_ID=<replace>
export AWS_SECRET_ACCESS_KEY=<replace>
ecs-cli configure profile --profile-name $PROFILE_NAME --access-key $AWS_ACCESS_KEY_ID --secret-key $AWS_SECRET_ACCESS_KEY
```
 
Configure ECS cluster
```bash
export ECS_CLUSTER=<replace>
export AWS_REGION=<replace>
ecs-cli configure --cluster $ECS_CLUSTER --default-launch-type EC2 --region $AWS_REGION --config-name $ECS_CLUSTER
```

Create ECS cluster
```bash
export AWS_KEYPAIR=<replace>
export AWS_INSTANCE_TYPE=<replace>
export ECS_CLUSTER_SIZE=<replace>
ecs-cli up --keypair $AWS_KEYPAIR --capability-iam --size $ECS_CLUSTER_SIZE --instance-type $AWS_INSTANCE_TYPE --launch-type EC2
```

#### ECS Task Definitions

```bash
ecs-cli compose --file docker-compose.yml create
```
## TODO
- Container Links
- Create ECS Service
- Update Security Group
- Add SSL Certificate
- Configure Load Balancer