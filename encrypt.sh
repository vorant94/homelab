sops encrypt pi/ssl/pi.lan.key > pi/ssl/pi.lan.enc.key
sops encrypt pi/ssl/pi.lan.csr > pi/ssl/pi.lan.enc.csr
sops encrypt pi/ssl/pi.lan.crt > pi/ssl/pi.lan.enc.crt
sops encrypt pi/ssl/ca.key > pi/ssl/ca.enc.key
sops encrypt pi/ssl/ca.srl > pi/ssl/ca.enc.srl
sops encrypt pi/ssl/ca.pem > pi/ssl/ca.enc.pem

sops encrypt docker/firefly/.env > docker/firefly/enc.env
sops encrypt docker/heimdall/.env > docker/heimdall/enc.env
sops encrypt docker/jellyfin/.env > docker/jellyfin/enc.env
sops encrypt docker/pihole/.env > docker/pihole/enc.env
sops encrypt docker/postgres/.env > docker/postgres/enc.env
sops encrypt docker/vaultwarden/.env > docker/vaultwarden/enc.env
