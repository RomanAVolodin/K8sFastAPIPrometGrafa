# K8sFastAPIPrometGrafa

### В ветке minikube находится версия для minikube

```shell
minikube start 
```

```shell
eval $(minikube docker-env)

docker build -t k8s-api:latest . 
```

```shell
kubectl apply -f k8s 
```

Затем в /etc/hosts добавляем 

```
127.0.0.1       small-api.local 
```

И выполняем `minikube tunnel`


### Managed k8s

В ветке main находится версия для Managed Kubernetes

```shell
docker build -t <ваш_логин_в_hub.docker.com>/k8s-api:latest .  
```

```shell
docker push <ваш_логин_в_hub.docker.com>/k8s-api:latest
```

```shell
yc managed-kubernetes cluster get-credentials <имя_или_идентификатор_кластера> --external
```

```shell
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx && \
helm repo update && \
helm install ingress-nginx ingress-nginx/ingress-nginx
```

```shell
kubectl apply -f k8s
```

