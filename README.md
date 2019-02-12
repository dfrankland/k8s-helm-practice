# k8s-helm-practice

## Building the Docker image

```bash
docker build -t k8s-helm-practice .
```

*   `k8s-helm-practice` can be replaced with whatever you would like to tag your
    image as.

## Running the Docker image

```bash
docker run -e PORT=3000 -p 3000:3000 -it k8s-helm-practice
```

*   `PORT` can be any port you would like to run the server on within the
    container

*   `-p` is used to expose and connect a port from the container to your host
    machine. This should be set to the same value as `PORT`

*   `k8s-helm-practice` can be replaced with whatever you would like to tag your
    image as.
