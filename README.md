# antonritter85_microservices
antonritter85 microservices repository

## Homework-19 Monitoring-2

#### В процессе сделано:

- разделены файлы Docker Compose:
  - docker-compose.yml - для приложений;
  - docker- compose-monitoring.yml - для описание инфраструктуры мониторинга;
- добавление cAdvisor и его интеграция с Prothemeus для мониторинга за состоянием Docker контейнеров;
- добавление Grafana для визуализации метрик Prometheus;
- импорт и создание дашбордов в Grafana;
- добавление Alertmanager и его интеграция с Prothemeus для первичной обратки алертов и отправки оповещений в Slack;
- (Задание со *) в Makefile добавлены билд и пуш новых сервисов;
- (Задание со *) добавлен сбор метрик с помощью Docker-демона: количество метрик значительно меньше, чем у cAdvisor;
- (Задание со *) добавлен сбор метрик Docker-демона с помощью Telegraf: имеется обширное количество метрик сравнимо с cAdvisor;
- (Задание со *) добавлен алерт на 95 перцентиль времени ответа UI;
- настроена интеграция Alertmanager с e-mail (запушен config.yml.example в директорию monitoring/alertmanager).


## Homework-18 Monitoring-1

#### В процессе сделано:

- подготовлено окружение и запущен Prometheus из готового образа с DockerHub;
- знакомство с веб-интерфейсом Prometheus и остановка контейнера;
- изменение структуры репозитория;
- работа с образами:
  - создание и сборка собственного образа Prometheus;
  - сборка образов микросервисов с помощью скриптов (docker_build.sh);
  - добавление Prometheus в docker-compose файл;
  - запуск контейнеров;
- мониторинг состояния сервисов в Prometheus;
- работа с Prometheus Exporters: добавление Node exporter в конфигурацию;
- созданные образы запушены в DockerHub*
- (Задание со *) добавление MongoDB exporter в Prometheus (создан собственный образ, использован [percona/mongodb_exporter](https://github.com/percona/mongodb_exporter));
- (Задание со *) добавление cloudprober в Prometheus (добавлен конфигурационный файл в официальный образ);
- (Задание со *) создан Makefile:
  - для билда всех или любого образа;
  - для пуша в DockerHub всех или любого образа.

### Ссылка на DockerHub c образами:

- https://hub.docker.com/u/antonritter85/

## Homework-17 Gitlab-CI-2

#### В процессе сделано:

- создание нового проекта GitLab и включение для него, созданного в предыдущем ДЗ GitLab Runner;
- описание окружений в pipeline: dev, stage production;
- настройка окружений stage и production: "ручной" запуск из UI, выкатывание только тэгированных коммитов;
- добавлено описание динамических окружений в pipeline;
- (Задание со *) создание сервера для окружения при пуше новой ветки, с возможностью удалить его "вручную" из UI.

#### Задание со *

Для реализации были использованы Terraform workspaces. Данные доступа к GCE хранятся в переменной проекта GOOGLE_CREDENTIALS (CI / CD Settings > Variables).

## Homework-16 Gitlab-CI-1

#### В процессе сделано:

- выполнена omnibus-инсталляция GitLab в Docker контейнере;
- выполнены первичные настройки GitLab;
- созданы группа проектов и проект: репозиторий antonritter85_microservices запушен в проект;
- описан CI/CD pipeline для проекта;
- создан и запущен GitLab Runner в Docker контейнере;
- Runner зарегестрирован в интерактивном режиме: после регистрации автоматически стартовал pipeline;
- pipeline изменен: добавлено тестирование приложения reddit;
- (Задание со *) создан Ansible плейбук (gitlab-runner-run-register.yml) для развертывания и регистрации Docker контейнера с GitLab Runner;
- (Задание со *) добавлена интеграция GitLab (в том числе и pipeline Slack): https://devops-team-otus.slack.com/messages/CB5HC9J5U

#### Задание со *

Пример запуска и регистрации Docker контейнера с GitLab Runner:

```
ansible-playbook gitlab-runner-run-register.yml --extra-vars="runner_name=gitlab-runner-1"
```

В переменной runner-name задается имя контейнера (оно же идет в runner description), токен зашифрован с помощью Ansible Vault.

## Homework-15 Docker-4

#### В процессе сделано:

- разобрана работа c сетью в Docker с драйверами none, host;
- разобрана работа c сетью в Docker с драйвером bridge:
  - запуск контейнеров приложения reddit в одной bridge-сети;
  - запуск контейнеров приложения reddit в двух bridge-сетях;
- сборка образов и запуск приложения с помощью docker-compose:
  - в одной bridge-сети;
  - в двух bridge-сетях;
  - выполнена параметризация параметров и запись их в файл .env;
  - (Задание со *) создан файл docker-compose.override.yml, который позволяет:
    - изменять код каждого из приложений, не выполняя сборку образа;
    - запускать puma для ruby приложений в debug режиме с двумя воркерами (флаги --debug и -w 2).

#### Вопрос (слайд 36):

Узнайте как образуется базовое имя проекта. Можно ли его задать? Если можно то как? \
*Базовое имя наследуется от имени директории, в которой находится файл проекта Docker Compose.
Его можно задать через переменную окружения COMPOSE_PROJECT_NAME или использовать ключ -p в команде docker-compose.*

## Homework-14 Docker-3

#### В процессе сделано:

- скачан исходный код микросервисных приложений: post-py, comment,ui;
- созданы Dockerfile для каждого из приложений;
- скачан образ mongo c Docker Hub, собраны образы для каждого из микросервисных приложений;
- создана сеть для контейнеров reddit;
- запущены контейнеры в сети reddit с соответствующими сетевыми алиасами;
- (Задание со *, слайд 16) запущены контейнеры в сети reddit с новыми сетевыми алиасами, переопределив переменные окружение в командах docker run;
- уменьшен размер образа ui (использован базовый образ ubuntu:16.04);
- (Задание со *, слайд 16) уменьшен размер образа ui (использованы базовые образы alpine:3.5 и ruby:2.2-alpine);
- работа с volume:
  - создан volume reddit_db;
  - перезапущены контейнеры, reddit_db подключен к контейнеру mongo;
  - написан новый пост в приложении;
  - контейенры остановлены;
  - контейнеры перезапущены снова, reddit_db подключен к контейнеру mongo;
  - убедились, что пост на месте.

#### Вопрос (слайд 12)

Обратите внимание! Сборка ui началась не с первого шага. Подумайте - почему? \
*Ответ: потому что были использованы кэши от предыдущей сборки (comment).*

#### Задание со * (слайд 16):

Запускаем контейнеры с новыми сетевыми алиасами, переопределив переменные окружение в командах docker run, и убеждаемся, что сервисы работают:

```
docker run -d --network=reddit --network-alias=new_post_db --network-alias=new_comment_db mongo:latest
docker run -d -e "POST_DATABASE_HOST=new_post_db" --network=reddit --network-alias=new_post antonritter85/post:1.0
docker run -d -e "COMMENT_DATABASE_HOST=new_comment_db" --network=reddit --network-alias=new_comment antonritter85/comment:1.0
docker run -d -e "POST_SERVICE_HOST=new_post" -e "COMMENT_SERVICE_HOST=new_comment" --network=reddit -p 9292:9292 antonritter85/ui:1.0
```

#### Задание со * (слайд 20):

```
➜ docker images
REPOSITORY              TAG                 IMAGE ID            CREATED             SIZE
antonritter85/ui        3.0                 48d0d69d75f3        16 minutes ago      235MB
antonritter85/ui        4.0                 d687fd0c9093        45 minutes ago      302MB
antonritter85/ui        2.0                 0a34203ccbfd        About an hour ago   460MB
antonritter85/ui        1.0                 34cc5f28ec88        About an hour ago   777MB
```

antonritter85/ui:3.0 - в качестве базового образа использован alpine:3.5 (описан в  ui/Dockerfile) \
antonritter85/ui:4.0 - в качестве базового образа использован ruby:2.2-alpine (описан в  ui/Dockerfile.4)


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
