# k8s-helm-practice

This repo was primarily created following the steps outlined by Bitnami's
article ["How to Create Your First Helm Chart"][bitnami article]. Check the
commit history for how the steps were followed.

[bitnami article]: https://docs.bitnami.com/kubernetes/how-to/create-your-first-helm-chart/

## Prerequisites

### Docker

*   **MacOS / Windows**: Install Docker for Mac / Windows.

*   **Others**: Install Docker.

### Kubernetes

*   **MacOS / Windows**: Use Docker for Mac / Windows and enable Kubernetes in
    the settings.

*   **Others**: Install Kubernetes.

### Helm

*   **MacOS**:

    ```bash
    brew install kubernetes-helm
    ```

*   **Others**:

    ```bash
    curl -sL https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash -
    ```

> Do not forget to run `helm init` after installing Helm.

## Using Docker

### Building the Docker image

```bash
docker build -t k8s-helm-practice .
```

*   `k8s-helm-practice` can be replaced with whatever you would like to tag your
    image as.

### Running the Docker image

```bash
docker run -e PORT=3000 -p 3000:3000 -it k8s-helm-practice
```

*   `PORT` can be any port you would like to run the server on within the
    container

*   `-p` is used to expose and connect a port from the container to your host
    machine. This should be set to the same value as `PORT`

*   `k8s-helm-practice` can be replaced with whatever you would like to tag your
    image as.

## Using Helm and Kubernetes

### Configuration

*   To change the port you can configure the `service.port` value in
    `node-server/values.yaml`.

*   To configure the Docker image name, change `image.repository` in
    `node-server/values.yaml`.

### Running

The Docker image will need to be built using the tag specified as
`image.repository` in `node-server/values.yaml` before proceeding. See above for
how to build the Docker image.

*   To run, connect to the service on the port specified, locally:

    ```bash
    helm install --name example ./node-server --set service.type=NodePort | tail -4 | bash -
    ```

    This will start the service on the local cluster using Helm, take the'
    commands from the `NOTES` section using `tail`, and run the commands to
    get the local URL to hit the service started.

    > You may need to replace the IP in the URL with `localhost`.

*   To stop and remove the application:

    ```bash
    helm del --purge example
    ```

In the above commands `example` can be replaced with whatever you would like to
name your service.
