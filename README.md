# docker-DirectEdit

MyDNS.JPのユーザがDNS-01方式でサーバ証明書を取得する[App](https://github.com/disco-v8/DirectEdit)をDocker上で動作させます．

## Usage
### Build 
```:sh
docker build -t doc_direct_edit .
```


### Run
```:sh
docker run --rm \
	-e YOURDOMAIN=$YOURDOMAIN \
	-e YOURMAILADDR=$YOURMAILADDR \
	-v $(pwd)/etc/letsencrypt:/etc/letsencrypt \
	doc_direct_edit
```
