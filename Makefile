
all: build push
.PHONY: all

build: build-app build-mon
.PHONY: build

build-app: build-post build-comment build-ui
.PHONY: build-app

build-mon: build-prometheus build-mongodb-exporter build-cloudprober build-alertmanager build-telegraf
.PHONY: build-mon

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

build-alertmanager:
			@cd $(PWD)/monitoring/alertmanager/ && docker build -t $(USER_NAME)/alertmanager .

build-telegraf:
			@cd $(PWD)/monitoring/telegraf/ && docker build -t $(USER_NAME)/telegraf .

# You must login to Docker Hub before push (docker login)
push: push-app push-mon
.PHONY: push

push-app: push-post push-comment push-ui
.PHONY: push-app

push-mon: push-prometheus push-mongodb-exporter push-cloudprober push-alertmanager push-telegraf
.PHONY: push-mon

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

push-alertmanager:
			docker push $(USER_NAME)/alertmanager

push-telegraf:
			docker push $(USER_NAME)/telegraf
