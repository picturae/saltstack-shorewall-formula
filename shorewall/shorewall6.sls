#!jinja|yaml

{% from "shorewall/defaults.yaml" import rawmap with context %}
{% set datamap = salt['grains.filter_by'](rawmap, merge=salt['pillar.get']('shorewall6:lookup')) %}

shorewall6:
  pkg:
    - installed
    - pkgs: {{ datamap.shorewall6.pkgs }}
  service:
    - running
    - name: {{ datamap.shorewall6.service.name }}
    - enable: {{ datamap.shorewall6.service.enable|default(True) }}
    - watch:
      - file: {{ datamap.shorewall6.config.dir }}/*
    - require:
      - pkg: shorewall6

{% for f in datamap.shorewall6.config.manage|default([]) %}
{% set c = datamap.shorewall6.config[f] %}
{{ c.path }}:
  file:
    - {{ c.ensure|default('managed') }}
    - source: {{ c.template_path|default('salt://shorewall/files/shorewall6/' ~ f) }}
    - template: {{ c.template_renderer|default('jinja') }}
    - mode: {{ c.mode|default('640') }}
    - user: {{ c.user|default('root') }}
    - group: {{ c.group|default('root') }}
{% endfor %}
