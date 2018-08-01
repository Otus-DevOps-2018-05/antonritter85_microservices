# antonritter85_microservices
antonritter85 microservices repository

## Homework-13 Docker-2

#### Задание со * (слайд 16):

Запускаем контейнеры с новыми сетевыми алиасами, переопределив переменные окружение в клмандах docker run, и убеждаемся, что сервисы работают:

```
docker run -d --network=reddit --network-alias=new_post_db --network-alias=new_comment_db mongo:latest
docker run -d -e "POST_DATABASE_HOST=new_post_db" --network=reddit --network-alias=new_post antonritter85/post:1.0
docker run -d -e "COMMENT_DATABASE_HOST=new_comment_db" --network=reddit --network-alias=new_comment antonritter85/comment:1.0
docker run -d -e "POST_SERVICE_HOST=new_post" -e "COMMENT_SERVICE_HOST=new_comment" --network=reddit -p 9292:9292 antonritter85/ui:1.0
```

## Homework-13 Docker-2

#### В процессе сделано:

- создан проект docker в GCP;
- создана виртуальная машина (docker-host) в GCP c использованием docker-machine;
- создание образа с приложением otus-reddit на docker-host:
  - создан и собран образ с приложением;
  - запущен контейнер на основе собранного образа и проверена работоспособность приложения;
  - созданный образ ([antonritter85/otus-reddit](https://hub.docker.com/r/antonritter85/otus-reddit)) загружен на Docker Hub;
- запущен локально и проверен контейнер, на основе образа из Docker Hub;
- (Задание со *) создан прототип инфраструктуры:
  - поднятие инстансов с помощью Terraform, их количество задается переменной number_of_instances;
  - реализованы плейбуки Ansible, с использованием динамического инвентори, для установки Docker и запуска приложения в контейенере из образа, загруженного из Docker Hub;
  - создан шаблон Packer, который делает образ с установленным Docker.

#### Задание со слайда 15:

```
docker run --rm -ti tehbilly/htop
```
В этом случае htop отображает только только PID 1 контейнера (собственно htop).

```
docker run --rm --pid host -ti tehbilly/htop
```
В этом случае htop отображает множество процессов хостовой системы.

## Homework-12 Docker-1

#### В процессе сделано:

- установлен Docker;
- работа с контейнерами и образами:
  - создание, запуск, остановка контейнеров;
  - подсоединение к терминалу запущенного контейнера;
  - запуск нового процесса внутри контейнера;
  - создание image из контейнера;
  - удаление images и контейнеров.
