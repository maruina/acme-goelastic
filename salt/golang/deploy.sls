{% from 'golang/map.jinja' import golang with context %}

Ensure Goapp is installed:
  cmd.script:
    - name: install_goapp.sh
    - source: salt://golang/files/install_goapp.sh
    - user: root
    - group: root