# GO-EXAMPLE

This repo just for simple code using Golang, sent current date to http://numbersapi.com, then show the output in your broser.

## Prerequisite(s)

To smoothly interact with this repository please install following application in your local device:

- Linux only (`apt install build-essential`)
- Docker (tested on v18.09.2)
- [pre-commit](https://pre-commit.com/) (tested on v1.17.0)
- Text editor (Vim, Visual Studio Code, Intellij Idea, etc.)
- Golang (tested on go1.13.1 darwin/amd64)
- Helm (tested on v2.14.3)
- Already have a cluster on GKE

## How to use this repository

### Clone this repository to your local device

First thing first, make sure that all prerequisite(s) installed in your device, then clone this repository (make sure you have access to it)
```$bash
~ git clone git@github.com:fourirakbar/go-example.git
```

### Setup pre-commit for the first time

```$bash
~ cd go-example
~ make setup
```

### Run your app

You can directly run this repo using **make dev** . But if you want to make your own name, run with **make dev APP_NAME=YOUR_NAME**

```$bash
➜ go-example git:(master) ✗ make dev
NAME:   go-app
LAST DEPLOYED: Fri Jun 12 21:28:49 2020
NAMESPACE: default
STATUS: DEPLOYED

RESOURCES:
==> v1/HorizontalPodAutoscaler
NAME           REFERENCE                 TARGETS        MINPODS  MAXPODS  REPLICAS  AGE
go-app-go-k8s  Deployment/go-app-go-k8s  <unknown>/80%  2        10       0         0s

==> v1/Pod(related)
NAME                            READY  STATUS             RESTARTS  AGE
go-app-go-k8s-77f68d6c85-xxbl6  0/1    ContainerCreating  0         0s

==> v1/Service
NAME           TYPE          CLUSTER-IP     EXTERNAL-IP  PORT(S)         AGE
go-app-go-k8s  LoadBalancer  xx.xx.xxx.xxx  <pending>    3000:30849/TCP  0s

==> v1beta1/Deployment
NAME           READY  UP-TO-DATE  AVAILABLE  AGE
go-app-go-k8s  0/1    1           0          0s
```

Then to access in your browser, see your EXTERNAL IP in services. And open [YOUR_IP]:3000
```$bash
➜ go-example git:(master) ✗ k get svc
NAME                                     TYPE           CLUSTER-IP      EXTERNAL-IP     PORT(S)                      AGE
go-app-go-k8s                            LoadBalancer   xx.xx.xxx.xxx   xx.xx.xxx.xx    3000:30849/TCP               69s
```

To delete it, run **make destroy**, and if you use your own name, plase run **make destroy APP_NAME=YOUR_NAME**
```$bash
➜ go-example git:(master) ✗ make destroy
release "go-app" deleted
```

### Reference(s)

1. [Kubernetes](https://kubernetes.io/)
2. [Golang](https://golang.org/)
3. [Docker](https://docs.docker.com/)
4. [Helm](https://helm.sh/)
5. [Horizontal Pod Autoscaler](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/)
