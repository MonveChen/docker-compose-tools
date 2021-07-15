## Usage



### 1.Create Account

```bash
docker-compose run --rm  openvpn easyrsa build-client-full <account-name>
```



### 2.Export .ovpn File

```bash
docker-compose run --rm openvpn ovpn_getclient <account-name> > <account-name>.ovpn
```

