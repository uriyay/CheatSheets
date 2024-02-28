# Kubernetes
## What is it
Running a bunch of servers (each one on a pod, you can call it a sub-container) all at once


## Minikube
Installing Minikube on Windows will be resulted in a one big container of minikube, which runs the pods.

[Install](https://minikube.sigs.k8s.io/docs/start/)

Then run:
```
minikube start
```

Now you've got a minikube running on your PC.

## Kubectl

Kubectl is a tool to control kubernetes.

Basic commands:

List all pods and their status - `kubectl get pods -A`

Apply config, which is usually used whenever you need to install a big server with a lot of pods - `kubectl apply <url>`


## How to sniff a pod

You can use [ksniff](https://github.com/eldadru/ksniff).

Which basically uploads a tcpdump binary, runs it on the pod and sends the packets in stdin to wireshark.

Installation guide:

1. Install [Krew for windows](https://krew.sigs.k8s.io/docs/user-guide/setup/install/#windows)

2. Run the following command in an admin command line (alternativly, you can re-clone the krew repo as a regular user and allow symlinks for a regular user)

   ```
   kubectl krew install sniff
   ```

3. Run ksniff by:

  ```
  kubectl sniff -p -n namespace pod_name
  ```

  I found out that the `-p` (privileged flag) is required for some reason, otherwise it didn't work for me.
  
  You can get the namespace and the pod_name from `kubectl get pods -A`
