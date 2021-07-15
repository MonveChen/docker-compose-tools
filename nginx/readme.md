## Usage



### 1.Test obtain or renew

```bash
certbot certonly  -d *.dibiaozuitu.com --manual --preferred-challenges dns --dry-run --manual-auth-hook "sh /root/certbot-letencrypt-wildcardcertificates-alydns-au/au.sh python aly add" --manual-cleanup-hook "sh /root/certbot-letencrypt-wildcardcertificates-alydns-au/au.sh python aly clean"
```



### 2.Obtain or renew(just no --dry-run)

```bash
certbot certonly  -d *.dibiaozuitu.com --manual --preferred-challenges dns --manual-auth-hook "sh /root/certbot-letencrypt-wildcardcertificates-alydns-au/au.sh python aly add" --manual-cleanup-hook "sh /root/certbot-letencrypt-wildcardcertificates-alydns-au/au.sh python aly clean"
```



### 3.Auto renew(update)

```bash
0 1 */1 * * certbot renew --manual --preferred-challenges dns --deploy-hook "nginx -s reload" --manual-auth-hook "sh /root/certbot-letencrypt-wildcardcertificates-alydns/au.sh python aly add" --manual-cleanup-hook "sh /root/certbot-letencrypt-wildcardcertificates-alydns-au/au.sh python aly clean" >> /var/log/nginx/letencrypt-auto-renew.log 2>&1 &
```

