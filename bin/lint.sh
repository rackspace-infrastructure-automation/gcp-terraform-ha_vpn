#!/bin/sh
set -xe
tfenv install
cd tests
terraform fmt -check=true -write=false -diff=true -list=true -recursive