#!/bin/bash

ssh-keyscan github.com > known_hosts

kubectl create secret generic -n flux-system ssh-creds \
    --from-file=$HOME/.ssh/id_rsa \
    --from-file=$HOME/.ssh/id_rsa.pub \
    --from-file=known_hosts

rm -rf known_hosts
