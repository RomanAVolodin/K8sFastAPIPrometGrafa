mini-ingress:
	minikube addons enable ingress-dns ingress

build:
	(eval $(minikube docker-env) && docker build -t rozarioagro/k8s-api:latest .)

make-secrets:
	kubectl create secret generic api-prod-env --from-env-file .env.k8s

get-logs:
	kubectl logs -f deployment/backend-deployment

make-alias:
	alias k8yc="kubectl --kubeconfig=$HOME/.kube/config-yc"


