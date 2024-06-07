#!/usr/bin/env bash

# prepare destinations
mkdir -p /b_apps/pve3-docker
chmod -R a+w /b_apps/

# add configuration - mapped folders
LXC_DOCKER_RUN=/opt/docker-portainer-${CTID}.sh
cat <<EOF >>$LXC_DOCKER_RUN
#!/usr/bin/env bash
docker stop portainer
docker rm portainer
docker run -d \
    -p 8000:8000 \
    -p 9443:9443 \
    --name=portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ee:latest
EOF
chmod a+x $LXC_DOCKER_RUN

./opt/docker-portainer-${CTID}.sh
