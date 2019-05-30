# docker-DirectEdit

MyDNS.JPのユーザがDNS-01方式でサーバ証明書を取得する[App](https://github.com/Hukanzen/docker-DirectEdit)をDocker上で動作させます．

## Usage
### Build 
```:bash
docker build -t doc_direct_edit .
```


### Run
```:bash
docker run --rm \
	-e YOURDOMAIN=$YOURDOMAIN \
	-e YOURMAILADDR=$YOURMAILADDR \
	-v $(pwd)/etc/letsencrypt:/etc/letsencrypt \
	doc_direct_edit


```
