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

{% if datamap.shorewall6.config.interfaces|default(True) %}
{{ datamap.shorewall6.config.interfaces.path }}:
  file:
    - managed
    - source: {{ datamap.shorewall6.config.interfaces.template_path|default('salt://shorewall/files/shorewall6/interfaces') }}
    - template: {{ datamap.shorewall6.config.interfaces.template_renderer|default('jinja') }}
    - mode: {{ datamap.shorewall6.config.interfaces.mode|default('640') }}
    - user: {{ datamap.shorewall6.config.interfaces.user|default('root') }}
    - group: {{ datamap.shorewall6.config.interfaces.group|default('root') }}
{% endif %}

{% if datamap.shorewall6.config.policy|default(True) %}
{{ datamap.shorewall6.config.policy.path }}:
  file:
    - managed
    - source: {{ datamap.shorewall6.config.policy.template_path|default('salt://shorewall/files/shorewall6/policy') }}
    - template: {{ datamap.shorewall6.config.policy.template_renderer|default('jinja') }}
    - mode: {{ datamap.shorewall6.config.policy.mode|default('640') }}
    - user: {{ datamap.shorewall6.config.policy.user|default('root') }}
    - group: {{ datamap.shorewall6.config.policy.group|default('root') }}
{% endif %}

{% if datamap.shorewall6.config.rules|default(True) %}
{{ datamap.shorewall6.config.rules.path }}:
  file:
    - managed
    - source: {{ datamap.shorewall6.config.rules.template_path|default('salt://shorewall/files/shorewall6/rules') }}
    - template: {{ datamap.shorewall6.config.rules.template_renderer|default('jinja') }}
    - mode: {{ datamap.shorewall6.config.rules.mode|default('640') }}
    - user: {{ datamap.shorewall6.config.rules.user|default('root') }}
    - group: {{ datamap.shorewall6.config.rules.group|default('root') }}
{% endif %}

{% if datamap.shorewall6.config.shorewall6_default.manage|default(True) %}
{{ datamap.shorewall6.config.shorewall6_default.path }}:
  file:
    - managed
    - source: {{ datamap.shorewall6.config.shorewall6_default.template_path|default('salt://shorewall/files/shorewall6/shorewall6') }}
    - template: {{ datamap.shorewall6.config.shorewall6_default.template_renderer|default('jinja') }}
    - mode: {{ datamap.shorewall6.config.shorewall6_default.mode|default('640') }}
    - user: {{ datamap.shorewall6.config.shorewall6_default.user|default('root') }}
    - group: {{ datamap.shorewall6.config.shorewall6_default.group|default('root') }}
{% endif %}

{% if datamap.shorewall6.config.shorewall6_conf.manage|default(True) %}
{{ datamap.shorewall6.config.shorewall6_conf.fpath }}:
  file:
    - managed
    - source: {{ datamap.shorewall6.config.shorewall6_conf.template_path|default('salt://shorewall/files/shorewall6/shorewall6.conf') }}
    - template: {{ datamap.shorewall6.config.shorewall6_conf.template_renderer|default('jinja') }}
    - mode: {{ datamap.shorewall6.config.shorewall6_conf.mode|default('640') }}
    - user: {{ datamap.shorewall6.config.shorewall6_conf.user|default('root') }}
    - group: {{ datamap.shorewall6.config.shorewall6_conf.group|default('root') }}
{% endif %}

{% if datamap.shorewall6.config.zones.manage|default(True) %}
{{ datamap.shorewall6.config.zones.path }}:
  file:
    - managed
    - source: {{ datamap.shorewall6.config.zones.template_path|default('salt://shorewall/files/shorewall6/zones') }}
    - template: {{ datamap.shorewall6.config.zones.template_renderer|default('jinja') }}
    - mode: {{ datamap.shorewall6.config.zones.mode|default('640') }}
    - user: {{ datamap.shorewall6.config.zones.user|default('root') }}
    - group: {{ datamap.shorewall6.config.zones.group|default('root') }}
{% endif %}
