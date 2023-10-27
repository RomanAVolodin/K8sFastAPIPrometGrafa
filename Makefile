mini-ingress:
	minikube addons enable ingress && minikube addons enable ingress-dns

mini-start:
	minikube start

build:
	(eval $(minikube docker-env) && docker build -t rozarioagro/k8s-api:latest .)

apply-all:
	kubectl apply -f k8s/.

make-secrets:
	kubectl create secret generic api-prod-env --from-env-file .env.k8s

get-logs:
	kubectl logs -f deployment/backend-deployment

make-alias:
	alias k8yc="kubectl --kubeconfig=$HOME/.kube/config-yc"


all: mini-start mini-ingress build apply-all

tunnel:
	minikube tunnel


