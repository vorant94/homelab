### ansible command example

```bash
ansible-playbook -i inventory.ini playbooks/setup-host.yml
```

### Add cert on client

MacOS:

- Open Keychain Access
- Go to `System->Certificates` tab
- Go to `File->Import Items` in top bar
- Select `pi.lan.crt` from `ansible/ssl`
- Double-click on newly added item
- Expand `Trust` section
- Change `When using this certificate` to `Always Trust`
- Save the changes by closing the window (you'll be prompted for password)

iOS:

- Send `ca.pem` to iPhone via AirDrop or any other way
- Open `Settings` and select `Profile Downloaded`
- Click `Install`, enter PIN and approve installation
- Go to `Settings->General->About->Certificate Trust Settings` trust the certificate
