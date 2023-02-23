# [C2.7. Практикум](https://lms.skillfactory.ru/courses/course-v1:SkillFactory+DEVOPS-3.0+2021/courseware/e74c0a6b77f2436d9a308575e12d6e51/bfa1e57e5a6e4fe1acb1694cfde942e4/8?activate_block_id=block-v1%3ASkillFactory%2BDEVOPS-3.0%2B2021%2Btype%40vertical%2Bblock%40510d3b6a4c56463a839cff42daef060c)

### Задание C2.7
- [x] Разверните Prometheus Stack через docker-compose, в котором будет:
    - [x] Prometheus;
    - [x] Grafana;
    - [x] Node Exporter;
    - [x] Blackbox Exporter;
    - [x] AlertManager.
- [ ] Соберите метрики с https://lms.skillfactory.ru через Blackbox, соберите метрики с вашего сервера через Node Exporter.
- [ ] Создайте dashboard в Grafana, в котором будут отображены следующие метрики:
    - [ ] На вашем сервере (или локальной машине):
        - [ ] время работы (Uptime);
        - [ ] нагрузка на процессор (CPU) в %;
        - [ ] использование памяти (RAM) в %;
        - [ ] использование диска в %.
    - [ ] На lms.skillfactory.ru:
        - [ ] возвращаемый статус-код;
        - [ ] задержка ответа сайта;
        - [ ] срок действия сертификата.
- [ ] Добавьте алерты в AlertManager на следующие события:
    - [ ] изменился статус-код сайта lms.skillfactory.ru;
    - [ ] задержка превышает 5 секунд lms.skillfactory.ru;
    - [ ] сервер перезагрузился (через метрику Uptime).
    - [ ] В Телеграм алерты можно не отправлять. Если есть желание, в качестве дополнительного задания можно кидать их себе на почту.
>Оформите решение в виде скриншотов дашборда, скриншотов интерфейса AlertManager и конфигов используемых сервисов.

- [ ] Проверено, оценка n/n

___

* prometheus install: <https://prometheus.io/docs/prometheus/latest/installation/>
* prometheus docker: <https://hub.docker.com/r/prom/prometheus>
* diff docker expose and ports: <https://www.baeldung.com/ops/docker-compose-expose-vs-ports>
* docker env vars: <https://docs.docker.com/compose/environment-variables/set-environment-variables/>
* alertmanager telegram conf example: <https://velenux.wordpress.com/2022/09/12/how-to-configure-prometheus-alertmanager-to-send-alerts-to-telegram/>
* alertmanager conf docs: <https://prometheus.io/docs/alerting/latest/configuration/>
* traefik ssl: <https://traefik.io/blog/traefik-2-tls-101-23b4fbee81f1/>
* gpg ver: <https://codex.so/gpg-verification>
* git gpg: <https://stackoverflow.com/questions/36810467/git-commit-signing-failed-secret-key-not-available>
* gpg export: <https://unix.stackexchange.com/questions/481939/how-to-export-a-gpg-private-key-and-public-key-to-a-file>
* git verify:  [link](https://git-scm.com/book/ru/v2/%D0%98%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BC%D0%B5%D0%BD%D1%82%D1%8B-Git-%D0%9F%D0%BE%D0%B4%D0%BF%D0%B8%D1%81%D1%8C) 
* traefik example: <https://docs.ibracorp.io/traefik/master/docker-compose>
* traefik example two: <https://gmasil.de/docker/configure-traefik>
* treafik prometheus monitoring: <https://medium.com/@ugenef/application-monitoring-with-traefik-prometheus-grafana-and-docker-compose-for-beginners-2fe25d1b60a8>
