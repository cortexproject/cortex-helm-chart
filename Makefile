.PHONY: README.md
README.md:
	docker run --rm --volume "$(shell pwd):/helm-docs" -u $(shell id -u) jnorwood/helm-docs:v1.11.0

.PHONY: bump-version
bump-version:
	./tools/bump-version.sh $(VERSION)
