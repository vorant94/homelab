sops encrypt pi/ssl/pi.lan.key > pi/ssl/pi.lan.enc.key
sops encrypt pi/ssl/pi.lan.csr > pi/ssl/pi.lan.enc.csr
sops encrypt pi/ssl/pi.lan.crt > pi/ssl/pi.lan.enc.crt
sops encrypt pi/ssl/ca.key > pi/ssl/ca.enc.key
sops encrypt pi/ssl/ca.srl > pi/ssl/ca.enc.srl
sops encrypt pi/ssl/ca.pem > pi/ssl/ca.enc.pem

sops encrypt pi/docker/firefly/.env > pi/docker/firefly/enc.env
sops encrypt pi/docker/heimdall/.env > pi/docker/heimdall/enc.env
sops encrypt pi/docker/jellyfin/.env > pi/docker/jellyfin/enc.env
sops encrypt pi/docker/pihole/.env > pi/docker/pihole/enc.env
sops encrypt pi/docker/postgres/.env > pi/docker/postgres/enc.env
sops encrypt pi/docker/vaultwarden/.env > pi/docker/vaultwarden/enc.env
