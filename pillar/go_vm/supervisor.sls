supervisor:
  program:
    goapp:
      command: /opt/goapp/bin/devops-recruitment -db.host="192.168.33.99"
      directory: /opt/goapp/src/devops-recruitment
      autostart: True
      autorestart: True