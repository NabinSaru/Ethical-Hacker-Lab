#!/bin/bash

# Retrieve the associated image names belonging to the santos omar
image_prefix="santosomar/"
images=$(docker images --format '{{.Repository}}' | grep "^$image_prefix")
echo "$images found"

# Find all containers belonging to the santosomar name group

# Retrieve all images from the omar santos repo
# image_ids=$(docker images -q "santosomar\/*")

# Start each container
for image in $images; do
	container=$(docker ps -a -q --filter "ancestor=$image" --format '{{.ID}}')
	if [ -z "$container" ]; then
		echo "No container found for the $image. Starting a new instance..."
	else
		docker start $container
		echo "Starting container $container_id..."
	fi
done

