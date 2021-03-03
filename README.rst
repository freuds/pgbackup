========
pgbackup
========

CLI for backing up remote PostgreSQL databases locally or to `AWS S3 <https://aws.amazon.com/fr/s3/>`_


Preparing for Development
=========================

Ensure pip and pipenv are installed
-----------------------------------

``$ pip3 install --user pipenv``

``$ pipenv --python $(which python3)``

Clone repository
----------------
   
``git clone https://github.com:example/pgbackup``

Fetch development dependencies
-----------------------------------------------------
   
``cd pgbackup && make install``

Activate virtualenv
-------------------
   
``pipenv shell``


Usage
=====

Pass in a full database URL, the storage driver, and destination.

Install package on virtualenv
-----------------------------

``$ pip install -e .``

Uninstall package
-----------------

``$ pip uninstall pgbackup``

S3 Example w/ bucket name
--------------------------

``$ pgbackup postgres://bob@example.com:5432/db_one --driver s3 backups``

Local Example w/ local path
---------------------------

``$ pgbackup postgres://bob@example.com:5432/db_one --driver local /var/local/db_one/backups``


Running Tests
=============

Run tests locally using make if virtualenv is active
----------------------------------------------------

``$ make``

If virtualenv isn’t active then use
-----------------------------------

``$ pipenv run make``


Manual Testing
==============

``(pgbackup) ➜  pgbackup git:(main) ✗ PYTHONPATH=./src python3``

``>>> from pgbackup import pgdump``

``>>> proc = pgdump.dump('postgres://user:password@localhost:5432/sample')``

``>>> f = open('./db/dump.sql', 'wb')``

``>>> f.write(proc.stdout.read())``

``>>> f.close()``

This document is based on `reStructuredText <https://docutils.sourceforge.io>`_ tool.