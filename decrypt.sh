sops decrypt pi/ssl/pi.lan.enc.key > pi/ssl/pi.lan.key
sops decrypt pi/ssl/pi.lan.enc.csr > pi/ssl/pi.lan.csr
sops decrypt pi/ssl/pi.lan.enc.crt > pi/ssl/pi.lan.crt
sops decrypt pi/ssl/ca.enc.key > pi/ssl/ca.key
sops decrypt pi/ssl/ca.enc.srl > pi/ssl/ca.srl
sops decrypt pi/ssl/ca.enc.pem > pi/ssl/ca.pem

sops decrypt docker/firefly/enc.env > docker/firefly/.env
sops decrypt docker/heimdall/enc.env > docker/heimdall/.env
sops decrypt docker/jellyfin/enc.env > docker/jellyfin/.env
sops decrypt docker/pihole/enc.env > docker/pihole/.env
sops decrypt docker/postgres/enc.env > docker/postgres/.env
sops decrypt docker/vaultwarden/enc.env > docker/vaultwarden/.env
