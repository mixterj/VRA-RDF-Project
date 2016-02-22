VRA-RDF-Project
===============
This project was initiated by members of the VRA Core Oversight Committee. The goal of the project is to develop an RDF Ontology for the VRA Core 4 data model. 

We have developed a draft ontology and have created an XSLT stylesheet that can convert existing VRA Core 4 compliant XML data into RDF/XML. 

We encourage people to try out the stylesheet and review the ontology. Your feedback will help us refine both the stylesheet as well as the ontology. 

VRA 2 RDF Transformation code:
===============

The Python application applies the XSLT transformation stylesheet to an XML source, producing a range of RDF serializaitons.

To run the application on your system, you will need to have Python installed (preferably 2.7.XX but 3.XX should also work).  The application depends on having three Python modules available: LXML, RDFLIB and RDFLIB-JSONld. 

Initial Python setup instructions for Mac and Windows systems, and general information on getting started with the application, are provided below.

Mac Setup:
------

1. Make sure Python is installed (is packaged with Mac OS X). If not install Python 2.7 (https://www.python.org/downloads/)
2. From the Terminal install Pip: 

    sudo easy_install pip
	
Windows Setup:
------

1. Download Python 2.7 (https://www.python.org/downloads/windows/). Pip is already packaged with the install.

2. Set Python Path for Windows

    Windows 7 - http://stackoverflow.com/questions/3701646/how-to-add-to-the-pythonpath-in-windows-7
    Windows 8 and 10 - http://stackoverflow.com/questions/21372637/installing-python-2-7-on-windows-8
	
Getting Started:
------

1. Clone the GitHub project

2. Run the setup.py installation to include Python dependencies

   python setup.py install

3. Run the vra2rdf transformation using these parameters.

    `vra2rdf -i <inputfile> -s <desired RDF serialization>`

    Sample VRA XML input files are in data/sample/xml/, e.g., data/sample/xml/record1.xml
    
    Acceptable serializations parameters are:
    
    xml = RDF xml
    json-ld = JSON-LD
    nt = N-Triples
    n3 = Turtle
