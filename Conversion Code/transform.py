from __future__ import print_function
import lxml.etree as ET
import sys
import rdflib
from rdflib import URIRef, Namespace, RDF, Graph, Literal, BNode, plugin, Variable
import re
import sys, getopt
from rdflib.plugin import register, Serializer
from optparse import OptionParser
register('json-ld', Serializer, 'rdflib_jsonld.serializer', 'JsonLDSerializer')

### Title: VRA/RDF Transform code
### Author: VRA Oversight Committee
### Description: This stylesheet can be used to convert VRA 4.0 XML formated records into RDF/XML. The records must conform the the VRA 4.0 Restricted Schema in order to work with the stylesheet
### Attribution-NonCommercial-ShareAlike 3.0 United States (cc) 2008-2010 <http://creativecommons.org/licenses/by-nc-sa/3.0/>

### Initiate the program and check/parse the command line variables
def parameters():
   parser = OptionParser()
   parser.add_option("-i", dest="inputfile", help="The File you would like to convert", action='store')
   parser.add_option("-f", dest="serialization", help="The serialization for the RDF output. n3 = Turtle, nt = N-Triples, xml = RDF/XML, json-ld = JSON-ld.", action='store')
   (options, args) = parser.parse_args(sys.argv)
   if not options.inputfile:
       print('please include a -i <inputfile> parameter. Use -h or --help for help')
       sys.exit(2)
   if not options.serialization:
       print('please include a -f <serialization> parameter. Use -h or --help for help')
       sys.exit(2)
   inputfile = (options.inputfile)
   serialization = (options.serialization)
   return (inputfile, serialization)
 
### Based on the input file variable parse the VRA XML and use the predefined XSLT_Stylesheet_official.xsl stylesheet to convert it into RDF/XML  
def xsl(input):
   transformfile = 'XSL/XSLT_Stylesheet.xsl'
   xml = ET.parse(input)
   xslt = ET.parse(transformfile)
   transform = ET.XSLT(xslt)
   rdfxml = transform(xml)
   return (rdfxml)

### Based on the serialization parameter convert the data into the desired RDF serialization ###
### RDF/XML is reparsed in order to clean up comments generated by the initial XSL conversion ###   
def rdf(rdfdata, serialization): 
    graph = rdflib.Graph()
    graph.parse(data=rdfxml, format='xml')
    rdfData = graph.serialize(format=serialization)
    print(rdfData.strip())
   
if __name__ == "__main__":
   input, serialization = parameters()
   rdfxml = xsl(input)
   rdf(rdfxml, serialization)
