#!/usr/bin/env bash

# install ssh keys (/ssh -> ~/.ssh)
cp -R /ssh /root/.ssh
chmod -R 500 /root/.ssh

# set keep-alive
echo "ServerAliveInterval 3600" >> /etc/ssh/ssh_config

# entrypoint
exec ssh $@
