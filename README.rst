.. |date| date::

*******
JetConf 
*******
:Author: syed s <sk.syed2@gmail.com>
:Date: |date|

This project is fork of original Jetconf 
By Pavel Špírek <pavel.spirek@nic.cz>

Primary objective is to make this generic and not tied to knotdns.

*JetConf* is an implementation of the RESTCONF_ protocol written in
Python 3. Main features:

* HTTP/2 over TLS, certificate-based authentication of clients

* JSON data encoding

* Per-user candidate datastores with transactions

* Support for NACM_

Installation
============

::
   
   Prerequisites:
       python3.5
       yangson-1.3.4
       
   Download this repository and do:
   python3.5 run.py -c jc-config.yaml
   
   Defaults in the jc-config:
      The yang model used: yang-data/yang-library-data.json
      The Datatstore used: data/example-data.json
   The test case for this:
      tests/jc_test_edit_ds.sh
    This test uses curl to edit the data store item, using json text as input and HTTP PUT operation.


Links
=====

* `Git repository`_

* `Documentation`_

.. _RESTCONF: https://tools.ietf.org/html/draft-ietf-netconf-restconf-18
.. _NACM: https://datatracker.ietf.org/doc/rfc6536/
.. _Git repository: https://github.com/CZ-NIC/jetconf
.. _Documentation: https://gitlab.labs.nic.cz/labs/jetconf/wikis/home
