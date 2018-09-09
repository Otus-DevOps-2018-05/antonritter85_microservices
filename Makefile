
all: build push
.PHONY: all

build: build-post build-comment build-ui build-prometheus build-mongodb-exporter build-cloudprober
.PHONY: build

build-post:
			@cd $(PWD)/src/post-py/ && bash docker_build.sh

build-comment:
			@cd $(PWD)/src/comment/ && bash docker_build.sh

build-ui:
			@cd $(PWD)/src/ui/ && bash docker_build.sh

build-prometheus:
			@cd $(PWD)/monitoring/prometheus/ && docker build -t $(USER_NAME)/prometheus .

build-mongodb-exporter:
			@cd $(PWD)/monitoring/mongodb_exporter/ && docker build -t $(USER_NAME)/mongodb_exporter .

build-cloudprober:
			@cd $(PWD)/monitoring/cloudprober/ && docker build -t $(USER_NAME)/cloudprober .


# You must login to Docker Hub before push (docker login)
push: push-post push-comment push-ui push-prometheus push-mongodb-exporter push-cloudprober
.PHONY: push

push-post:
			docker push $(USER_NAME)/post

push-comment:
			docker push $(USER_NAME)/comment
push-ui:
			docker push $(USER_NAME)/ui

push-prometheus:
			docker push $(USER_NAME)/prometheus

push-mongodb-exporter:
			docker push $(USER_NAME)/mongodb_exporter

push-cloudprober:
			docker push $(USER_NAME)/cloudprober
