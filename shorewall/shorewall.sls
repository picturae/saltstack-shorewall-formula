#!jinja|yaml

{% from "shorewall/defaults.yaml" import rawmap with context %}
{% set datamap = salt['grains.filter_by'](rawmap, merge=salt['pillar.get']('shorewall:lookup')) %}

shorewall:
  pkg:
    - installed
    - pkgs: {{ datamap.shorewall.pkgs }}

{% if datamap.shorewall.config.interfaces|default(True) %}
{{ datamap.shorewall.config.interfaces.path }}:
  file:
    - managed
    - source: {{ datamap.shorewall.config.interfaces.template_path|default('salt://shorewall/files/shorewall/interfaces') }}
    - template: {{ datamap.shorewall.config.interfaces.template_renderer|default('jinja') }}
    - mode: {{ datamap.shorewall.config.interfaces.mode|default('640') }}
    - user: {{ datamap.shorewall.config.interfaces.user|default('root') }}
    - group: {{ datamap.shorewall.config.interfaces.group|default('root') }}
{% endif %}

{% if datamap.shorewall.config.masq|default(True) %}
{{ datamap.shorewall.config.masq.path }}:
  file:
    - managed
    - source: {{ datamap.shorewall.config.masq.template_path|default('salt://shorewall/files/shorewall/masq') }}
    - template: {{ datamap.shorewall.config.masq.template_renderer|default('jinja') }}
    - mode: {{ datamap.shorewall.config.masq.mode|default('640') }}
    - user: {{ datamap.shorewall.config.masq.user|default('root') }}
    - group: {{ datamap.shorewall.config.masq.group|default('root') }}
{% endif %}

{% if datamap.shorewall.config.policy|default(True) %}
{{ datamap.shorewall.config.policy.path }}:
  file:
    - managed
    - source: {{ datamap.shorewall.config.policy.template_path|default('salt://shorewall/files/shorewall/policy') }}
    - template: {{ datamap.shorewall.config.policy.template_renderer|default('jinja') }}
    - mode: {{ datamap.shorewall.config.policy.mode|default('640') }}
    - user: {{ datamap.shorewall.config.policy.user|default('root') }}
    - group: {{ datamap.shorewall.config.policy.group|default('root') }}
{% endif %}

{% if datamap.shorewall.config.rules|default(True) %}
{{ datamap.shorewall.config.rules.path }}:
  file:
    - managed
    - source: {{ datamap.shorewall.config.rules.template_path|default('salt://shorewall/files/shorewall/rules') }}
    - template: {{ datamap.shorewall.config.rules.template_renderer|default('jinja') }}
    - mode: {{ datamap.shorewall.config.rules.mode|default('640') }}
    - user: {{ datamap.shorewall.config.rules.user|default('root') }}
    - group: {{ datamap.shorewall.config.rules.group|default('root') }}
{% endif %}

{% if datamap.shorewall.config.shorewall_default.manage|default(True) %}
{{ datamap.shorewall.config.shorewall_default.path }}:
  file:
    - managed
    - source: {{ datamap.shorewall.config.shorewall_default.template_path|default('salt://shorewall/files/shorewall/shorewall') }}
    - template: {{ datamap.shorewall.config.shorewall_default.template_renderer|default('jinja') }}
    - mode: {{ datamap.shorewall.config.shorewall_default.mode|default('640') }}
    - user: {{ datamap.shorewall.config.shorewall_default.user|default('root') }}
    - group: {{ datamap.shorewall.config.shorewall_default.group|default('root') }}
{% endif %}

{% if datamap.shorewall.config.shorewall_conf.manage|default(True) %}
{{ datamap.shorewall.config.shorewall_conf.fpath }}:
  file:
    - managed
    - source: {{ datamap.shorewall.config.shorewall_conf.template_path|default('salt://shorewall/files/shorewall/shorewall.conf') }}
    - template: {{ datamap.shorewall.config.shorewall_conf.template_renderer|default('jinja') }}
    - mode: {{ datamap.shorewall.config.shorewall_conf.mode|default('640') }}
    - user: {{ datamap.shorewall.config.shorewall_conf.user|default('root') }}
    - group: {{ datamap.shorewall.config.shorewall_conf.group|default('root') }}
{% endif %}

{% if datamap.shorewall.config.zones.manage|default(True) %}
{{ datamap.shorewall.config.zones.path }}:
  file:
    - managed
    - source: {{ datamap.shorewall.config.zones.template_path|default('salt://shorewall/files/shorewall/zones') }}
    - template: {{ datamap.shorewall.config.zones.template_renderer|default('jinja') }}
    - mode: {{ datamap.shorewall.config.zones.mode|default('640') }}
    - user: {{ datamap.shorewall.config.zones.user|default('root') }}
    - group: {{ datamap.shorewall.config.zones.group|default('root') }}
{% endif %}

