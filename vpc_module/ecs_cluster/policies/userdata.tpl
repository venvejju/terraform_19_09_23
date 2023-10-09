#!/bin/bash
echo ECS_CLUSTER=cluster-initial >> /etc/ecs/ecs.config
yum install aws-cli -y
aws s3 cp s3://ecs-config-vejju/ecs.config /etc/ecs/ecs.config
