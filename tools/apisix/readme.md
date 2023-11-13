

# Local runing

## install localhost Certificate 

Create a certificate: 

openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 -keyout localhost.key -out localhost.crt

Install on kubernetes: 

kubectl create secret tls tlssecret --cert=localhost.crt --key=localhost.key -n ingress-apisix