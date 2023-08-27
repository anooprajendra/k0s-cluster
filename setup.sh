#!/usr/bin/env bash
# set -x

vagrant up --no-provision

for i in {0..3}; do
	vagrant provision k0s-node${i}
done

k0sfe_ip=$(vagrant ssh-config k0s-node0 | awk '/^  HostName/{print $2;}')

echo "K0S-Node0 IP Address is ${k0sfe_ip}"

