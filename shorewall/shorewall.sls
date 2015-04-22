#!jinja|yaml

{% from "shorewall/defaults.yaml" import rawmap with context %}
{% set datamap = salt['grains.filter_by'](rawmap, merge=salt['pillar.get']('shorewall:lookup')) %}

shorewall:
  pkg:
    - installed
    - pkgs: {{ datamap.shorewall.pkgs }}
  service:
    - running
    - name: {{ datamap.shorewall.service.name }}
    - enable: {{ datamap.shorewall.service.enable|default(True) }}
    - watch:
      - file: {{ datamap.shorewall.config.dir }}/*
    - require:
      - pkg: shorewall

{% for f in datamap.shorewall.config.manage|default([]) %}
{% set c = datamap.shorewall.config[f] %}
{{ c.path }}:
  file:
    - {{ c.ensure|default('managed') }}
    - source: {{ c.template_path|default('salt://shorewall/files/shorewall/' ~ f) }}
    - template: {{ c.template_renderer|default('jinja') }}
    - mode: {{ c.mode|default('640') }}
    - user: {{ c.user|default('root') }}
    - group: {{ c.group|default('root') }}
{% endfor %}

