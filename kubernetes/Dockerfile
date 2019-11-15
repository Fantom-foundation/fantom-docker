FROM alpine as geth
RUN apk add --no-cache ca-certificates
RUN mkdir /shared
COPY getip.sh /bin/getip.sh
ADD https://gethstore.blob.core.windows.net/builds/geth-alltools-linux-amd64-1.9.7-a718daa6.tar.gz .

EXPOSE 8545 8546 8547 30303 30303/udp
ENTRYPOINT [ "/bin/sh", "-c", "/geth --bootnodes=`cat /shared/enode-url` --rpcaddr 0.0.0.0"]


FROM geth as bootnode
EXPOSE 8545 8546 8547 30303 30303/udp 30301
ENTRYPOINT [ "/bin/sh", "-c", "/bootnode --genkey=boot.key && echo 'enode://' > /shared/enode-url && /bootnode --nodekey=boot.key --writeaddress >> /shared/enode-address && echo '@' >> /shared/enode-url && getip.sh >> /shared/enode-url && echo ':30301' >> /shared/enode-url && /bootnode --nodekey=boot.key" ]


FROM geth as miner
EXPOSE 8545 8546 8547 30303 30303/udp
ENTRYPOINT [ "/bin/sh", "-c", "/geth --bootnodes=`cat /shared/enode-url` --mine --miner.threads=1 --etherbase=0x000000000000000000000000000000000000000" ]
