# back-app

## Criar helm

```bash
helm create back-app
```

## Instalar

Teste

```bash
helm install --namespace adsantos --create-namespace back-app ./back-app --dry-run --debug
```

Pra valer

```bash
helm install --namespace adsantos --create-namespace back-app ./back-app

Release "back-app" has been upgraded. Happy Helming!
NAME: back-app
LAST DEPLOYED: Mon Sep  7 00:14:22 2020
NAMESPACE: adsantos
STATUS: deployed
REVISION: 2
NOTES:
1. Get the application URL by running these commands:
     NOTE: It may take a few minutes for the LoadBalancer IP to be available.
           You can watch the status of by running 'kubectl get --namespace adsantos svc -w back-app'
  export SERVICE_IP=$(kubectl get svc --namespace adsantos back-app --template "{{ range (index .status.loadBalancer.ingress 0) }}{{.}}{{ end }}")     
  echo http://$SERVICE_IP:80
```

### Atualizar

```bash
helm upgrade --namespace adsantos back-app ./back-app
```

### Excluir

```bash
helm delete --namespace adsantos back-app
```

Verificando

```bash
kubectl get all -n adsantos

NAME                            READY   STATUS    RESTARTS   AGE
pod/back-app-64d4d4b788-kkc98   1/1     Running   0          13m

NAME               TYPE           CLUSTER-IP    EXTERNAL-IP    PORT(S)        AGE
service/back-app   LoadBalancer   10.0.161.44   13.89.140.64   80:32282/TCP   17m

NAME                       READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/back-app   1/1     1            1           17m

NAME                                  DESIRED   CURRENT   READY   AGE
replicaset.apps/back-app-64d4d4b788   1         1         1       13m
```

```bash
kubectl logs -f pod/back-app-64d4d4b788-kkc98 -n adsantos # funciona até reiniciar o pod

kubectl logs -f -l app.kubernetes.io/name=back-app -n adsantos # funciona sempre
```

### Executando o serviço

```bash
export SERVICE_IP=$(kubectl get svc --namespace adsantos back-app --template "{{ range (index .status.loadBalancer.ingress 0) }}{{.}}{{ end }}")

echo http://$SERVICE_IP:80

http://13.89.140.64/get-cert?p=Gabriel%20Tiberio
```