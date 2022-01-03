#!/bin/bash
if [ $# -eq 0 ]; then
    echo "No arguments provided : Please provide k8s version same as what was selected for master setup"
    exit 1
fi
sudo yum install -y kubelet-$1 kubeadm-$1 kubectl-$1
sudo systemctl enable kubelet && sudo systemctl start kubelet
