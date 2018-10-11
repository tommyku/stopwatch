SERVER ?= USER@SERVER
DEPLOY_DIR ?= ~/DEPLOY_DIR

start:
	cd ./src && python -m SimpleHTTPServer 8080

bump: ./bin/bump
	/usr/bin/env node ./bin/bump

deploy: bump
	rsync -avz -e ssh src/ $(SERVER):$(DEPLOY_DIR)
