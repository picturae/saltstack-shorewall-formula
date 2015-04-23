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

* support other systems than Debian

Available states
----------------

.. contents::
  :local:

``shorewall``
-------------
Deploy both shorewall and shorewall6

``shorewall.shorewall``
-----------------------
Deploy shorewall

``shorewall.shorewall6``
------------------------
Deploy shorewall6

