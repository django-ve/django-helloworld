# -*- coding: utf-8 -*-

from setuptools import setup, find_packages
import os

CLASSIFIERS = [
    'Development Status :: 5 - Production/Stable',
    'Environment :: Web Environment',
    'Framework :: Django',
    'Intended Audience :: Developers',
    'License :: OSI Approved :: GNU General Public License (GPL)',
    'Operating System :: OS Independent',
    'Programming Language :: Python',
    'Topic :: Internet :: WWW/HTTP :: Dynamic Content',
    'Topic :: Software Development',
    'Topic :: Software Development :: Libraries :: Application Frameworks',
]

setup(
    author="Alex Clark",
    author_email="aclark@aclark.net",
    maintainer='Leonardo J. Caballero G.',
    maintainer_email='leonardocaballero@gmail.com',
    name='helloworld',
    version='0.1',
    description='A Django hello world example ',
    long_description=open(os.path.join(os.path.dirname(__file__), 'README.rst')).read(),
    url='https://github.com/django-ve/helloworld',
    license='GPL',
    platforms=['OS Independent'],
    classifiers=CLASSIFIERS,
    install_requires=[
        'Django==1.6.5',
    ],
    packages=find_packages(exclude=["project","project.*"]),
    include_package_data=True,
    zip_safe = False
)
