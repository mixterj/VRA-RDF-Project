VRA-RDF-Project
===============
This project was initiated by members of the VRA Core Oversight Committee. The goal of the project is to develop a RDF Ontology for the VRA Core 4 data model. We have developed a draft ontology and have created an XSLT stylesheet that can convert existing VRA Core 4 compliant XML data into RDF/XML. We encourage people to try out the stylesheet and review the ontology. Your feedback will help us refine both the stylesheet as well as the ontology. 

Instructions:
===============

Under the Conversion Code directory you will find a same VRA/XML Record (VraXmlSampleRecord.xml) and a Python script (transform.py).

In order to run the code you will need to have Python installed (preferably 2.7.XX but 3.XX should also work)
You will also need to install 3 Python modules: LXML, RDFLIB and RDFLIB-JSONld. Below are instructions doing so on both Mac and Windows systems

Mac:

Make sure Python is installed (is packaged with Mac OS X). If not install Python (https://www.python.org/downloads/)
From the Terminal install Pip: 
    sudo easy_install pip
From the Terminal install RDFLIB: 
    pip install rdflib
From the Terminal install RDFLIB-JSONld: 
    pip install rdflib-jsonld
	
Windows:

Download Python 2.7.11 (https://www.python.org/downloads/windows/). Pip is already packaged with the install.
From the Command Line navigate to Python directory
    cd C:\Python27
From Command Line install RDFLIB
    python -m pip install rdflib
From Command Line install RDFLIB-JSON-ld
    python -m pip install rdflib-jsonld
Install LXML (https://pypi.python.org/pypi/lxml/3.5.0)
Set Python Path for Windows
    Windows 7 - http://stackoverflow.com/questions/3701646/how-to-add-to-the-pythonpath-in-windows-7
    Windows 8 and 10 - http://stackoverflow.com/questions/21372637/installing-python-2-7-on-windows-8
	
Using the transform code:

Clone the GitHub project and navigate to the /VRA-RDF-Project/Conversion Code directory
Run the transform.py script using these parameters.
    python transform.py -i <inputfile> -f <desired RDF serialization>
Acceptable serializations parameters are:
    xml - RDF xml
    jsonld - JSON-LD
    nt - N-Triples
    n3 - Turtle

