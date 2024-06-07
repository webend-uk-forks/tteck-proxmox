#!/usr/bin/env bash
echo "Add custom keys"
touch /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID/LziN55YNs0IfQXr7uksDxhBvy12nJpA92EL6j+1/n webend-console-homelab-211-macbookair" >> /root/.ssh/authorized_keys
