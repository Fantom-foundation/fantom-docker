TAG         := $$(git log -1 --pretty=%h)
IMG_GETH    := geth:${TAG}
LATEST_GETH := geth:latest
IMG_BOOT    := bootnode:${TAG}
LATEST_BOOT := bootnode:latest
IMG_MINE    := miner:${TAG}
LATEST_MINE := miner:latest

GETH_IMG := geth.img
BOOT_IMG := boot.img
MINE_IMG := mine.img

.PHONY: build push login images

build:
	@echo ${IMG_GETH}
	@docker build -t ${IMG_GETH} -f ./Dockerfile.geth .
	@docker tag ${IMG_GETH} ${LATEST_GETH}
	@docker build -t ${IMG_BOOT} -f ./Dockerfile.bootnode .
	@docker tag ${IMG_BOOT} ${LATEST_BOOT}
	@docker build -t ${IMG_MINE} -f ./Dockerfile.miner .
	@docker tag ${IMG_MINE} ${LATEST_MINE}

images: build
	@docker image save -o ${GETH_IMG} geth:latest 
	@docker image save -o ${BOOT_IMG} bootnode:latest 
	@docker image save -o ${MINE_IMG} miner:latest 

push:
	@docker push fantom/geth
	@docker push fantom/bootnode
	@docker push fantom/miner

login:
	@docker log -u ${DOCKER_USER} -p ${DOCKER_PASS}
