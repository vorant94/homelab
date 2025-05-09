# Generate SSL

Take `SSL_PEM_PASS_PHRASE` from [secrets.yaml](../nixos/shared/secrets.yaml)

## Generate KEY

```zsh
  openssl genrsa \
    -passout pass:<SSL_PEM_PASS_PHRASE> \
    -des3 \
    -out ca.key \
    2048
```

## Generate PEM

```zsh
  openssl req \
    -x509 \
    -new \
    -nodes \
    -key ca.key \
    -sha256 \
    -days 1825 \
    -passin pass:<SSL_PEM_PASS_PHRASE> \
    -subj "/C=IL/ST=Israel/L=Modiin/O=homelab/OU=pi/CN=vorant94/emailAddress=vorant94@pm.me" \
    -out ca.pem
```

## Generate pi.lan KEY

```zsh
  openssl genrsa \
    -out pi.lan.key \
    2048
```

## Generate pi.lan CSR

```zsh
  openssl req \
    -new \
    -key pi.lan.key \
    -subj "/C=IL/ST=Israel/L=Modiin/O=homelab/OU=pi/CN=vorant94/emailAddress=vorant94@pm.me" \
    -out pi.lan.csr
```

## Generate SRL and pi.lan CRT

```zsh
  openssl x509 \
    -req \
    -in pi.lan.csr \
    -CA ca.pem \
    -CAkey ca.key \
    -CAcreateserial \
    -passin pass:<SSL_PEM_PASS_PHRASE> \
    -out pi.lan.crt \
    -days 825 \
    -sha256 \
    -extfile pi.lan.ext
```
