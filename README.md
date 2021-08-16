# back-app

## run

```bash
cd back-app/app

flask run  --port 5002
```

```bash
cd back-app
docker build -t kdop/back-app:0.0.3 .

docker push kdop/back-app:0.0.3
```

```bash
docker run -p 5002:5002 kdop/back-app:0.0.3
```

## Testing

<http://127.0.0.1:5002/health>

## Helm

```bash
helm upgrade --install --namespace adsantos --create-namespace back-app back-app
```