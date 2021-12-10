sudo snap install microk8s --classic --channel=1.23/stable
sudo ufw allow in on cni0 && sudo ufw allow out on cni0
sudo ufw default allow routed
sudo microk8s enable dns dashboard storage
sudo microk8s kubectl get all --all-namespaces
token=$(microk8s kubectl -n kube-system get secret | grep default-token | cut -d " " -f1)
sudo microk8s kubectl -n kube-system describe secret $token
sudo microk8s kubectl create deployment microbot --image=dontrebootme/microbot:v1
sudo microk8s kubectl scale deployment microbot --replicas=2
sudo microk8s kubectl expose deployment microbot --type=NodePort --port=80 --name=microbot-service
sudo microk8s kubectl get all --all-namespaces
#sudo snamp remove microk8s
