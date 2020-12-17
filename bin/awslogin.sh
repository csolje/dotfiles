#!/usr/bin/env bash
if [ $1 ]
then
  aws sso login --profile $1
  yawsso -p $1
else
  aws sso login
  yawsso --default
  $(yawsso -e)
fi
