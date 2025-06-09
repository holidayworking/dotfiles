#!/bin/bash

set -euC

repository_names=$(aws ecr describe-repositories --query 'repositories[].repositoryName' --output text | tr '\t' '\n' | sort)

echo "Repository name,Image count,Last recorded pull time"
for repository_name in $repository_names; do
  image_count=$(aws ecr list-images \
    --repository-name "$repository_name" \
    --query 'imageIds' \
    --output json | jq 'length')

  last_recorded_pull_time=$(aws ecr describe-images \
    --repository-name "$repository_name" |
    jq -r '.imageDetails | map(select(.lastRecordedPullTime != null)) | sort_by(.lastRecordedPullTime) | reverse | .[0].lastRecordedPullTime')

  echo "$repository_name,$image_count,$last_recorded_pull_time"
done
