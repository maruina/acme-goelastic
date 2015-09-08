{% from 'golang/map.jinja' import golang with context %}

{% set golang_download_path = salt.pillar.get('golang:download_path', '/tmp') %}
{% set golang_install_path = salt.pillar.get('golang:install_path', '/usr/local/go') %}
{% set golang_url = {
    'x86_64': 'https://storage.googleapis.com/golang/go1.5.linux-amd64.tar.gz',
    'i686': 'https://storage.googleapis.com/golang/go1.5.linux-386.tar.gz',
}.get(grains.cpuarch) %}


Download golang installer:
  cmd.run:
    - name: wget {{ golang_url }} -O {{ golang_download_path }}/golang.tar.gz
    - unless: test -f {{ golang_install_path }}/bin/go


Ensure golang is installed:
  cmd.run:
    - name: tar -C /usr/local -xzf {{ golang_download_path }}/golang.tar.gz
    - unless: test -f {{ golang_install_path }}/bin/go


Ensure golang PATH is added to every profile:
  file.managed:
    - name: {{ golang.profile_dir }}/golang.sh
    - source: salt://golang/files/golang.sh
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - context:
      install_path: {{ golang_install_path }}
