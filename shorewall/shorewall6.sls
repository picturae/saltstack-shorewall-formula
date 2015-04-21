#!jinja|yaml

{% from "shorewall/defaults.yaml" import rawmap with context %}
{% set datamap = salt['grains.filter_by'](rawmap, merge=salt['pillar.get']('shorewall6:lookup')) %}

shorewall6:
  pkg:
    - installed
    - pkgs: {{ datamap.shorewall6.pkgs }}

{% if datamap.shorewall6.config.shorewall6_conf.manage|default(True) %}
{{ datamap.shorewall6.config.shorewall6_conf.fpath }}:
  file:
    - managed
    - source: {{ datamap.shorewall6.config.shorewall6_conf.template_path|default('salt://shorewall6/files/shorewall6/shorewall6.conf') }}
    - template: {{ datamap.shorewall6.config.shorewall6_conf.template_renderer|default('jinja') }}
    - mode: {{ datamap.shorewall6.config.shorewall6_conf.mode|default('644') }}
    - user: {{ datamap.shorewall6.config.shorewall6_conf.user|default('root') }}
    - group: {{ datamap.shorewall6.config.shorewall6_conf.group|default('root') }}
{% endif %}

