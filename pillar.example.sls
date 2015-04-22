shorewall:
  lookup:
    config:
      manage:
        - masq
      masq:
        - ensure: absent
  zones:
    - "net  ipv4"
    - "pipo ipv4"
  interfaces:
    - "eth0 net"
    - "eth1 pipo"
  policy:
    - "$FW  net ACCEPT"
    - "$FW  pipo  ACCEPT"
    - "all  all DROP"
  rules:
    new:
      - "ACCEPT net $FW tcp 22"
shorewall6:
  zones:
    - "net  ipv4"
    - "pipo ipv4"
  interfaces:
    - "eth0 net"
    - "eth1 pipo"
  policy:
    - "$FW  net ACCEPT"
    - "$FW  pipo  ACCEPT"
    - "all  all DROP"
  rules:
    new:
      - "ACCEPT net $FW tcp 22"

