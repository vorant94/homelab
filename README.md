### rsshub feed url example
```
http://rsshub/telegram/channelcroaking_sparrow
```

### enter postgres
```bash
docker exec -it postgres psql -U postgres
```

### restart nginx
```bash
docker exec -it <nginx-container> nginx -s reload
```

### regenerate ssl certificate commands example
```bash
openssl genrsa -des3 -out ca.key 2048

openssl req -x509 -new -nodes -key ca.key -sha256 -days 1825 -out ca.pem

openssl genrsa -out nginx/private/pi.lan.key 2048

openssl req -new -key nginx/private/pi.lan.key -out pi.lan.csr

openssl x509 -req -in pi.lan.csr -CA ca.pem -CAkey ca.key -CAcreateserial -out nginx/certs/pi.lan.crt -days 825 -sha256 -extfile pi.lan.ext
```
