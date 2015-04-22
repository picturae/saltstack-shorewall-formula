===========================
saltstack-shorewall-formula
===========================

Saltstack formula to setup shorewall, shorewall6 and configure it using pillar

NOTICE BEFORE USE
-----------------

* This formula is braindead about the data you feed.
* This is only tested on Debian.

TODO
----

* restart shorewall after update
* support other systems than Debian

Available states
----------------

.. contents::
  :local:

``shorewall.shorewall``
-----------------------
Deploy shorewall

``shorewall.shorewall6``
------------------------
Deploy shorewall6

