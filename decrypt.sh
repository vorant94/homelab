sops decrypt pi/ssl/pi.lan.enc.key > pi/ssl/pi.lan.key
sops decrypt pi/ssl/pi.lan.enc.csr > pi/ssl/pi.lan.csr
sops decrypt pi/ssl/pi.lan.enc.crt > pi/ssl/pi.lan.crt
sops decrypt pi/ssl/ca.enc.key > pi/ssl/ca.key
sops decrypt pi/ssl/ca.enc.srl > pi/ssl/ca.srl
sops decrypt pi/ssl/ca.enc.pem > pi/ssl/ca.pem

sops decrypt pi/docker/firefly/enc.env > pi/docker/firefly/.env
sops decrypt pi/docker/heimdall/enc.env > pi/docker/heimdall/.env
sops decrypt pi/docker/jellyfin/enc.env > pi/docker/jellyfin/.env
sops decrypt pi/docker/pihole/enc.env > pi/docker/pihole/.env
sops decrypt pi/docker/postgres/enc.env > pi/docker/postgres/.env
sops decrypt pi/docker/vaultwarden/enc.env > pi/docker/vaultwarden/.env
