VRA-RDF-Project
===============

This project was initiated by members of the VRA Core Oversight Committee. The goal of the project is to develop an RDF Ontology for the VRA Core 4 data model. 

We have developed a draft ontology and have created an XSLT stylesheet that can convert existing VRA Core 4 compliant XML data into RDF/XML. We encourage people to try out the stylesheet and review the ontology. Your feedback will help us refine both the stylesheet as well as the ontology. 

[The VRA Ontology](http://purl.org/vra/ "View the VRA Ontology")

[The XSLT Stylesheet](https://raw.githubusercontent.com/mixterj/VRA-RDF-Project/b3aebd228171666d4516dce2ff025a493e08fedd/data/xsl/vra2rdf.xsl "View the XSLT stylesheet")

This project also includes a Python application, "vra2rdf", which applies the XSLT stylesheet to VRA XML sources to produce serialized RDF.

The vra2rdf application
===============

The vra2rdf Python application applies the XSLT transformation stylesheet to a VRA XML source, producing a range of RDF serializations.

To run the application on your system, you will need to have Python installed (preferably 2.7.XX but 3.XX should also work).  The application depends on having three Python modules available: LXML, RDFLIB and RDFLIB-JSONld.  These should be installed by running the setup.py install script described below. 

In addition, some Python setup instructions for Mac and Windows systems are provided below.

Mac Setup:
------

1. Make sure Python is installed (is packaged with Mac OS X). If not install Python 2.7 (https://www.python.org/downloads/)
2. From the Terminal install Pip: 
  - `sudo easy_install pip`
3. From the terminal install rdflib package
  - `sudo pip install rdflib`	
4. From the terminal install rdflib-jsonld
  - `sudo pip install rdflib-jsonld`
5. From the terminal install lxml
  - `sudo pip install lxml`

	
Windows Setup:
------

1. Download Python 2.7 (https://www.python.org/downloads/windows/). Pip is already packaged with the install.

2. Set Python Path for Windows
  - Windows 7 - http://stackoverflow.com/questions/3701646/how-to-add-to-the-pythonpath-in-windows-7
  - Windows 8 and 10 - http://stackoverflow.com/questions/21372637/installing-python-2-7-on-windows-8
3. From the DOS command prompt install rdflib package
  - `pip install rdflib`	
4. From the DOS command prompt install rdflib-jsonld
  - `pip install rdflib-jsonld`
5. From the DOS command prompt install lxml
  - `pip install lxml`
	
Installing and Running the vra2rdf Application:
------

1. Clone this GitHub project

2. Run the setup.py installation to include Python dependencies

   `python setup.py install`

3. Run the vra2rdf transformation using these parameters.

    `vra2rdf -i <inputfile> -s <RDF serialization>`

    Sample VRA XML input files are in data/sample/xml/.
    
    For example, this will serialize the sample VRA XML in record1.xml as RDF JSON-LD:
    
    `vra2rdf -i data/sample/xml/record1.xml -s json-ld`
    
4. Supported RDF serialization parameters are:
  * xml = RDF XML
  * json-ld = JSON-LD
  * nt = N-Triples
  * n3 = Turtle
