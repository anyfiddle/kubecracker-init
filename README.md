# Kubecracker Init Container

This repository builds the container image to prepare the rootfs image for a Firecracker VM in Kubecracker. This container will run as a init container followed by Firecracker in Docker container.

## Environment Varibales

- `IMAGE_PATH` : Path to download the image to. Defaults to /disk/image.ext4
- `IMAGE_DOWNLOAD_URL` : URL to fetch the Image from. Defaults to https://storage.googleapis.com/anyfiddle-find/rootfs/ubuntu-image-latest.ext4
- `IMAGE_SIZE` : Size to resize the image. This will be the disk size of the VM. Defaults to 1G
