=================
django-helloworld
=================

This is a Django `Hello World <https://en.wikipedia.org/wiki/%22Hello,_World!%22_program>`_ example.

Installation
============

You need to install the pre-requirements for run this Hello World example.

Update repositories of available packages to install, with
the following command:

::

  $ sudo apt update && sudo apt upgrade -y

Install necessary minimum dependencies, with the following command:

::

  $ sudo apt install -y python3-dev python3-pip python3-virtualenv

For run this example need to install Django framework
executing the follow command:

::

    $ sudo pip3 install -r requirements.txt

And later to test the Django Installation is done with the following command:

::

    $ python3 -m django --version
    5.1.6


::

    $ python3 manage.py migrate

At which point you should see:

::

    Operations to perform:
      Apply all migrations: admin, auth, contenttypes, sessions
    Running migrations:
      Applying contenttypes.0001_initial... OK
      Applying auth.0001_initial... OK
      Applying admin.0001_initial... OK
      Applying admin.0002_logentry_remove_auto_add... OK
      Applying admin.0003_logentry_add_action_flag_choices... OK
      Applying contenttypes.0002_remove_content_type_name... OK
      Applying auth.0002_alter_permission_name_max_length... OK
      Applying auth.0003_alter_user_email_max_length... OK
      Applying auth.0004_alter_user_username_opts... OK
      Applying auth.0005_alter_user_last_login_null... OK
      Applying auth.0006_require_contenttypes_0002... OK
      Applying auth.0007_alter_validators_add_error_messages... OK
      Applying auth.0008_alter_user_username_max_length... OK
      Applying auth.0009_alter_user_last_name_max_length... OK
      Applying auth.0010_alter_group_name_max_length... OK
      Applying auth.0011_update_proxy_permissions... OK
      Applying auth.0012_alter_user_first_name_max_length... OK
      Applying sessions.0001_initial... OK


For use the Django Admin Interface, it's needed to create a superuser 
for management, with the following command:

::

    $ python3 manage.py createsuperuser --username admin --email admin@mail.com

At which point you should see:

::

    Password:
    Password (again):

    Superuser created successfully.

Run application
===============

After which you can run::

    $ python3 manage.py runserver

Then, you can open the URL http://127.0.0.1:8000/ in your web browser and you can 
see the hello world example like this:

.. figure:: https://github.com/django-ve/django-helloworld/raw/master/docs/django_helloword.png
   :width: 315px
   :align: center
   :alt: A Django 'Hello World' application example

   A Django 'Hello World' application example

Also you can open in your web browser the URL http://127.0.0.1:8000/admin for access to 
the *Django Admin Interface* like this:

.. figure:: https://github.com/django-ve/django-helloworld/raw/master/docs/django_admin_interface_running.png
   :width: 315px
   :align: center
   :alt: Django Admin Interface running

   Django Admin Interface running


Running the testing
===================

Running the ``helloworld`` application tests with the following command:

::

    $ python3 manage.py test helloworld.tests

At which point you should see:

::

    Found 2 test(s).
    Creating test database for alias 'default'...
    System check identified no issues (0 silenced).
    ..
    ----------------------------------------------------------------------
    Ran 2 tests in 1.017s

    OK
    Destroying test database for alias 'default'...


Building with docker
====================

Building ``helloworld`` image with the following command:

::

    $ docker build --tag=helloworld .


Running the ``django-helloworld`` container with the following command:

::

    $ docker run docker run -p 4000:8000 --name django-helloworld -d helloworld


Checking the ``django-helloworld`` logs with the following command:

::

    $ docker logs -f django-helloworld


Stoping the ``django-helloworld`` container with the following command:

::

    $ docker stop django-helloworld


Requesting the URL http://localhost:4000 with the following command:

::

    $ curl localhost:4000

At which point you should see:

::

    Hello, world!


Also you can request the URL http://localhost:4000 in your web browser
you can see the hello world example.

.. figure:: https://github.com/django-ve/django-helloworld/raw/master/docs/django_helloword_docker.png
   :width: 315px
   :align: center
   :alt: A Django 'Hello World' example from a Docker container
