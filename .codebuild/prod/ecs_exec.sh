#!/usr/bin/env bash

read -p 'please enter your AWS profile > ' AWS_PROFILE

CLUSTER=rails-prod
SERVICE=puma-prod
#SERVICE=active-job-prod
TASK=$(aws-vault exec $AWS_PROFILE -- aws ecs list-tasks --cluster $CLUSTER --service-name $SERVICE | jq -r .taskArns[0] | cut -d '/' -f 3)
CONTAINER=puma
#CONTAINER=active_job-prod

aws-vault exec $AWS_PROFILE -- aws ecs execute-command \
    --cluster $CLUSTER \
    --task $TASK \
    --container $CONTAINER \
    --interactive \
    --command "bash"
