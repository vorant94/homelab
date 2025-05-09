sops encrypt ssl/pi.lan.key > ssl/pi.lan.enc.key
sops encrypt ssl/pi.lan.csr > ssl/pi.lan.enc.csr
sops encrypt ssl/pi.lan.crt > ssl/pi.lan.enc.crt
sops encrypt ssl/ca.key > ssl/ca.enc.key
sops encrypt ssl/ca.srl > ssl/ca.enc.srl
sops encrypt ssl/ca.pem > ssl/ca.enc.pem

sops encrypt docker/firefly/.env > docker/firefly/enc.env
sops encrypt docker/heimdall/.env > docker/heimdall/enc.env
sops encrypt docker/jellyfin/.env > docker/jellyfin/enc.env
sops encrypt docker/pihole/.env > docker/pihole/enc.env
sops encrypt docker/postgres/.env > docker/postgres/enc.env
sops encrypt docker/vaultwarden/.env > docker/vaultwarden/enc.env
