#!/bin/sh

CI_COMMIT_SHORT_SHA=$(echo ${CIRCLE_SHA1:0:8})
tfenv install
cd tests
# for debugging, show that these files exist
ls -la "terraform-$CI_COMMIT_SHORT_SHA.tar.gz"
ls -la "terraform-$CI_COMMIT_SHORT_SHA.plan"

# uncache .terraform for the apply
tar xzf "terraform-$CI_COMMIT_SHORT_SHA.tar.gz"

terraform destroy --auto-approve
