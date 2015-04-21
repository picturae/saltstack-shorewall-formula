#!jinja|yaml

{% from "shorewall/defaults.yaml" import rawmap with context %}
{% set datamap = salt['grains.filter_by'](rawmap, merge=salt['pillar.get']('shorewall6:lookup')) %}

shorewall6:
  pkg:
    - installed
    - pkgs: {{ datamap.shorewall6.pkgs }}


