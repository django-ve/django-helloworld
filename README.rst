helloworld
==========

A Djanfo hello world example

Followed by::

    $ bin/django syncdb

At which point you should see::

    Creating tables ...
    Creating table auth_permission
    Creating table auth_group_permissions
    Creating table auth_group
    Creating table auth_user_user_permissions
    Creating table auth_user_groups
    Creating table auth_user
    Creating table auth_message
    Creating table django_content_type
    Creating table django_session
    Creating table django_site
    Creating table django_admin_log
    
Followed by a prompt for your username and new password::

    You just installed Django's auth system, which means you don't have any
    superusers defined.
    Would you like to create one now? (yes/no): yes
    Username (Leave blank to use 'admin'): admin
    E-mail address: YOUREMAIL@EMAILSERVICE
    Password: 
    Password (again): 
    Superuser created successfully.
    Installing custom SQL ...
    Installing indexes ...
    No fixtures found.

After which you can run::

    $ bin/django runserver

And open the following URL in your web browser:

 - http://127.0.0.1:8000/admin/

And open the following URL in your web browser for see the hello world example:

 - http://127.0.0.1:8000/
