base:
  'elastic*':
    - java.install
    - elasticsearch.install
    - elasticsearch.config
    - elasticsearch.service
  'go*':
    - golang.install
    - golang.deploy
    - supervisor.install
    - supervisor.config
    - supervisor.service