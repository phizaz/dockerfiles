#!/usr/bin/env bash

# install ssh keys (/ssh -> ~/.ssh)
cp -R /ssh /root/.ssh
chmod -R 500 /root/.ssh

# entrypoint
exec ssh $@
