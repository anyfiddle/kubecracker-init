#!/bin/sh

: ${IMAGE_PATH="/disk/image.ext4"}
: ${IMAGE_DOWNLOAD_URL="https://storage.googleapis.com/anyfiddle-find/rootfs/ubuntu-image-latest.ext4"}
: ${IMAGE_SIZE="1G"}

IMAGE_FOLDER=$(dirname $IMAGE_PATH)

echo "IMAGE_FOLDER=$IMAGE_FOLDER"
echo "IMAGE_PATH=$IMAGE_PATH"
echo "IMAGE_DOWNLOAD_URL=$IMAGE_DOWNLOAD_URL"
echo "IMAGE_SIZE=$IMAGE_SIZE"

echo "Ensuring image folder $IMAGE_FOLDER"
mkdir -p $IMAGE_FOLDER

if [ ! -f $IMAGE_PATH ]; then
    echo "RootFS image not found : $IMAGE_PATH"
    echo "Downloading $IMAGE_DOWNLOAD_URL"

    wget $IMAGE_DOWNLOAD_URL -O $IMAGE_PATH

    echo "Resizing Image to $IMAGE_DOWNLOAD_URL"
    e2fsck -y -f ${IMAGE_PATH}
    resize2fs $IMAGE_PATH $IMAGE_SIZE
fi