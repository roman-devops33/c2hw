# [C2.7. Практикум](https://lms.skillfactory.ru/courses/course-v1:SkillFactory+DEVOPS-3.0+2021/courseware/e74c0a6b77f2436d9a308575e12d6e51/bfa1e57e5a6e4fe1acb1694cfde942e4/8?activate_block_id=block-v1%3ASkillFactory%2BDEVOPS-3.0%2B2021%2Btype%40vertical%2Bblock%40510d3b6a4c56463a839cff42daef060c)

### Задание C2.7
- [ ] Разверните Prometheus Stack через docker-compose, в котором будет:
    - [ ] Prometheus;
    - [ ] Grafana;
    - [ ] Node Exporter;
    - [ ] Blackbox Exporter;
    - [ ] AlertManager.
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
