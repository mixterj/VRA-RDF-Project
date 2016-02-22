import os

from setuptools import setup, find_packages

setup(
    name = "python-vra2rdf",
    version = "0.1",
    author = "Jeff Mixter",
    author_email = "mixterj@oclc.org",
    description = ("A python script to convert VRA Core 4 compliant XML data into RDF/XML."),
    license = "LICENSE",
    keywords = "xml vra rdf xslt n3 nt jsonld",
    url = "https://github.com/mixterj/VRA-RDF-Project",
    packages=['vra2rdf'],
    classifiers=[
        "Development Status :: 3 - Alpha",
        "Topic :: Utilities",
        "License :: OSI Approved :: GNU General Public License v3 or later (GPLv3+)",
        ],
    install_requires=[
        'rdflib',
        'rdflib-jsonld',
        'lxml'
        ],
    entry_points={
        'console_scripts': [
            'vra2rdf = vra2rdf.__main__:main'
        ]
    }
)