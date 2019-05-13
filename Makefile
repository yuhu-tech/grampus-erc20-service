setup:
	docker build -f docker/Dockerfile -t grampus-erc20-service .
	@echo "build done"


PORT=8081
run:
	docker run -d -p ${PORT}:${PORT} -v ${PWD}/logs:/logs \
	-e ENDPOINT=http://192.168.1.25:8545 \
	-e FROMADDR=0x5ea4e1b7b750e3f5a3bee6913fa469455a590b75 \
    -e PORT=${PORT} \
	--name erc20-service \
	grampus-erc20-service:latest
	@echo "run done"

.PHONY: down
down:
	docker stop erc20-service
	docker rm erc20-service
	@echo "down done"

.PHONY: clean
clean:
	docker rmi grampus-erc20-service:latest
	@echo "clean done"
