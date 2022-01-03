#!/bin/bash
if [ $# -eq 0 ]; then
    echo "No arguments provided : Please provide k8s version to be installed eg : 1.20.6"
    exit 1
fi
sudo yum install -y kubelet-$1 kubeadm-$1 kubectl-$1
sudo systemctl enable kubelet && sudo systemctl start kubelet
sudo kubeadm init --pod-network-cidr=10.244.0.0/16 | awk '/kubeadm join/,""'
sudo mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf /root/.kube/config > /dev/null
sudo chown $(id -u):$(id -g) $HOME/.kube/config
sudo kubectl apply -f /root/flannel.yaml
