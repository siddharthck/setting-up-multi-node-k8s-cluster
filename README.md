# setting-up-multi-node-k8s-cluster
1 master node :: t2.xlarge :: Cent OS :: Linux/UNIX

2 worker ndes :: same as master

Steps for Setup :

Create 2 or more machines using centos or any linux with 8GB memory. [One master and other worker. In case you want to create two workers then increase the machine count.] The machines will have three file in /root directory : 
clone this repo with : 
git clone https://github.com/siddharthck/setting-up-multi-node-k8s-cluster.git

Master_setup.sh : required for master node setup

Worker_setup.sh : required for worker node setup

Flannel.yaml : required for setting up network in k8s cluster (used inside master setup)

Login to Master machine and run master_setup.sh file with k8s version as argument. Eg 
./master_setup.sh 1.20.6

Once done it will give some output, from which copy the token part which will help the worker to connect to the master node. 
Eg  : kubeadm join 10.55.3.233:6443 --token timj5x.abil80fd4um0al60 \ --discovery-token-ca-cert-hash sha256:828cc

Login to the worker machine and then run worker_setup.sh. Once done. Paste the token copied from the master node. This will help workers to connect to the master node.

Verify by firing following command on master node : 

Kubectl get nodes : This will list down the nodes in the cluster, make sure that your all worker nodes are listed in the output and are in ready state, worker nodes might take 2-3 minutes to get ready.

Note  :: On Master machines once you login :: you might have to run following command if you face any issues related to helm :: 

 $ export PATH=$PATH:/usr/local/bin/
And then check helm version
