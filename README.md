# back-app

## run

```bash
cd back-app/app

flask run  --port 5002
```

```bash
cd back-app
docker build -t kdop/back-app:0.0.6 .

docker push kdop/back-app:0.0.6
```

```bash
docker run -p 5000:5000 kdop/back-app:0.0.6
```

## Testing

<http://127.0.0.1:5000/health>

## Helm

```bash
helm upgrade --install --namespace adsantos --create-namespace back-app back-app
```
