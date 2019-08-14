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

### Product
実行した場所に， `etc` ディレクトリが生成されます．


```:txt
./etc/
└── letsencrypt
    ├── accounts
    │   └── acme-v02.api.letsencrypt.org
    │       └── directory
    │           └── hogehogehoge
    │               ├── meta.json
    │               ├── private_key.json
    │               └── regr.json
    ├── archive
    │   └── var_mydomain.mydns.jp
    │       ├── cert1.pem
    │       ├── chain1.pem
    │       ├── fullchain1.pem
    │       └── privkey1.pem
    ├── csr
    │   └── 0000_csr-certbot.pem
    ├── keys
    │   └── 0000_key-certbot.pem
    ├── live
    │   ├── var_mydomain.mydns.jp
    │   │   ├── cert.pem -> ../../archive/var_mydomain.mydns.jp/cert1.pem
    │   │   ├── chain.pem -> ../../archive/var_mydomain.mydns.jp/chain1.pem
    │   │   ├── fullchain.pem -> ../../archive/var_mydomain.mydns.jp/fullchain1.pem
    │   │   ├── privkey.pem -> ../../archive/var_mydomain.mydns.jp/privkey1.pem
    │   │   └── README
    │   └── README
    ├── renewal
    │   └── var_mydomain.mydns.jp.conf
    └── renewal-hooks
        ├── deploy
        ├── post
        └── pre

16 directories, 16 files
```

## Document
[Nextcloud in Docker を自宅に構築 ~01_証明書章~ - Qiita](https://qiita.com/AkihisaYoshii4/items/3b18af3788c96b1f67f0)
