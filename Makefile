build:
	docker login -u $(DOCKER_USER) -p $(DOCKER_PASSWORD)
	docker build -t yumafuu/mysqldef-arm64:latest mysqldef-arm64
	docker build -t yumafuu/mysqldef-amd64:latest mysqldef-amd64
	docker push yumafuu/mysqldef-arm64:latest
	docker push yumafuu/mysqldef-amd64:latest
	docker manifest create -a yumafuu/mysqldef:latest \
    yumafuu/mysqldef-amd64:latest \
    yumafuu/mysqldef-arm64:latest
	docker manifest push yumafuu/mysqldef:latest
