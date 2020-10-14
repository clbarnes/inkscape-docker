LATEST = Dockerfile
SOURCE = Dockerfile.source

default: latest

latest:
	docker build -f $(LATEST) .

source:
	docker build -f $(SOURCE) .

both: latest source
