build:
	docker login -u $(DOCKER_USER) -p $(DOCKER_PASSWORD)

	docker buildx create --name builder || true
	docker buildx use builder
	docker buildx build \
		-t yumafuu/mysqldef:$(TAG) \
		--platform linux/amd64,linux/arm64 \
		--push .
