# antonritter85_microservices
antonritter85 microservices repository

## Homework-13 Docker-2

### Задание со слайда 15:

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
  - подсоедние к терминалу запущенного контейнера;
  - запуск нового процесса внутри контейнера;
  - создание image из контейнера;
  - удаление images и контейнеров.
