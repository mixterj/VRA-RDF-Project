<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- 
Title: VRA Template
Author: VRA Oversight Committee
Also see: 
Description: This stylesheet can be used to convert VRA 4.0 XML formated records into RDF/XML.
			 The records must conform the the VRA 4.0 Restricted Schema in order to work with the stylesheet
Attribution-NonCommercial-ShareAlike 3.0 United States (cc) 2008-2010 <http://creativecommons.org/licenses/by-nc-sa/3.0/>
 -->
<xsl:stylesheet version="1.0"
xmlns:foaf="http://xmlns.com/foaf/0.1/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
xmlns:vra="http://purl.org/vra/"
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:library="http://purl.org/library/"
xmlns:void="http://rdfs.org/ns/void#"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:vc="http://www.vraweb.org/vracore4.htm"
exclude-result-prefixes="vc xsl">
  
<xsl:output
	method="xml"
	media-type="application/xml" 
	indent="yes"/>

	<xsl:template match="/vc:vra">
		<rdf:RDF>
			<xsl:apply-templates />
		</rdf:RDF>
	</xsl:template>
	
	<xsl:template match="vc:collection">
		<rdf:Description rdf:about="#{@refid}">
			<rdf:type rdf:resource="http://rdfs.org/ns/void#DataSet" />
			<rdfs:label>
				<xsl:value-of select="@source"/>
			</rdfs:label>
			<xsl:apply-templates select="*[not(name()='measurementsSet')]" />
		</rdf:Description>
	</xsl:template>
	<xsl:template match="vc:work">
		<rdf:Description rdf:about="#{@refid}">
		<rdf:type rdf:resource="http://purl.org/vra/CreativeWork"/>
			<xsl:apply-templates select="vc:worktypeSet" mode="workType"/>
			<xsl:apply-templates />
			<xsl:if test="vc:relationSet/vc:relation/@type = 'imageOf'">
				<vra:imageOf>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:imageOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'imageIs'">
				<vra:hasImage>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork"/>
					</rdf:Description>
				</vra:hasImage>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'cartoonFor'">
				<vra:cartoonFor>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:cartoonFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'cartoonIs'">
				<vra:hasCartoon>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:hasCartoon>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'componentOf'">
				<vra:componentOf>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:componentOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'componentIs'">
				<vra:hasComponent>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:hasComponent>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'copyAfter'">
				<vra:copyOf>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:copyOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'copyIs'">
				<vra:hasCopy>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:hasCopy>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'counterProofFor'">
				<vra:counterProofFor>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:counterProofFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'counterProofIs'">
				<vra:hasCounterProof>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:hasCounterProof>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'depicts'">
				<vra:depicts>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:depicts>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'depictedIn'">
				<vra:depictedIn>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:depictedIn>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'derivedFrom'">
				<vra:derivedFrom>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:derivedFrom>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'sourceFor'">
				<vra:sourceFor>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:sourceFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'designedFor'">
				<vra:designedFor>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:designedFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'contextIs'">
				<vra:hasContext>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:hasContext>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'exhibitedAt'">
				<vra:exhibitedAt>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:exhibitedAt>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'venueFor'">
				<vra:venueFor>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:venueFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'facsimileOf'">
				<vra:facsimileOf>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:facsimileOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'facsimileIs'">
				<vra:hasFacsimile>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:hasFacsimile>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'formerlyPartOf'">
				<vra:formerlyPartOf>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:formerlyPartOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'formerlyLargerContextFor'">
				<vra:formerlyLargerContextFor>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:formerlyLargerContextFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'mateOf'">
				<vra:imageOf>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:imageOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'modelFor'">
				<vra:imageOf>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:imageOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'modelIs'">
				<vra:hasModel>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:hasModel>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'largerContextFor'">
				<vra:largerContextFor>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:largerContextFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'partOf'">
				<vra:partOf>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:partOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'partnerInSetWith'">
				<vra:partnerInSetWith>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:partnerInSetWith>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'pendantOf'">
				<vra:pendantOf>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:pendantOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'planFor'">
				<vra:planFor>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:planFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'planIs'">
				<vra:hasPlan>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:hasPlan>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'prepatoryFor'">
				<vra:prepatoryFor>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:prepatoryFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'basedOn'">
				<vra:basedOn>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:basedOn>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'printingPlateFor'">
				<vra:printingPlateFor>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:printingPlateFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'printingPlateIs'">
				<vra:hasPrintingPlate>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:hasPrintingPlate>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'prototypeFor'">
				<vra:prototypeFor>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:prototypeFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'prototypeIs'">
				<vra:hasPrototype>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:hasPrototype>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'relatedTo'">
				<vra:isRelatedTo>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:isRelatedTo>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'reliefFor'">
				<vra:reliefFor>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:reliefFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'impressionIs'">
				<vra:hasImpression>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:hasImpression>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'replicaOf'">
				<vra:replicaOf>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:replicaOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'replicaIs'">
				<vra:hasReplica>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:hasReplica>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'studyFor'">
				<vra:studyFor>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:studyFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'studyIs'">
				<vra:hasStudy>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:hasStudy>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'versionOf'">
				<vra:versionOf>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:versionOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'versionIs'">
				<vra:hasVersion>
					<rdf:Description rdf:about="#{translate(vc:relationSet/vc:relation/@relids, 'w_', '')}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:hasVersion>
			</xsl:if>
		</rdf:Description>
	</xsl:template>
	<xsl:template match="vc:image">
		<rdf:Description rdf:about="#{@refid}">
		<rdf:type rdf:resource="http://purl.org/vra/ImageObject" />
			<xsl:apply-templates select="vc:worktypeSet" mode="workType"/>
			<xsl:apply-templates />
			<xsl:if test="vc:relationSet/vc:relation/@type = 'imageOf'">
				<vra:imageOf>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:imageOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'imageIs'">
				<vra:hasImage>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:hasImage>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'cartoonFor'">
				<vra:cartoonFor>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:cartoonFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'cartoonIs'">
				<vra:hasCartoon>
					<rdf:Description rdf:about="#vc:relationSet/vc:relation/{@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:hasCartoon>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'componentOf'">
				<vra:componentOf>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:componentOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'componentIs'">
				<vra:hasComponent>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:hasComponent>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'copyAfter'">
				<vra:copyOf>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:copyOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'copyIs'">
				<vra:hasCopy>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:hasCopy>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'counterProofFor'">
				<vra:counterProofFor>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:counterProofFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'counterProofIs'">
				<vra:hasCounterProof>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:hasCounterProof>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'depicts'">
				<vra:depicts>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:depicts>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'depictedIn'">
				<vra:depictedIn>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:depictedIn>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'derivedFrom'">
				<vra:derivedFrom>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:derivedFrom>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'sourceFor'">
				<vra:sourceFor>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:sourceFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'designedFor'">
				<vra:designedFor>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:designedFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'contextIs'">
				<vra:hasContext>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:hasContext>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'exhibitedAt'">
				<vra:exhibitedAt>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:exhibitedAt>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'venueFor'">
				<vra:venueFor>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:venueFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'facsimileOf'">
				<vra:facsimileOf>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:facsimileOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'facsimileIs'">
				<vra:hasFacsimile>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:hasFacsimile>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'formerlyPartOf'">
				<vra:formerlyPartOf>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:formerlyPartOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'formerlyLargerContextFor'">
				<vra:formerlyLargerContextFor>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:formerlyLargerContextFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'mateOf'">
				<vra:imageOf>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:imageOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'modelFor'">
				<vra:imageOf>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:imageOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'modelIs'">
				<vra:hasModel>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:hasModel>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'largerContextFor'">
				<vra:largerContextFor>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:largerContextFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'partOf'">
				<vra:partOf>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@relids}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:partOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'partnerInSetWith'">
				<vra:partnerInSetWith>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:partnerInSetWith>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'pendantOf'">
				<vra:pendantOf>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:pendantOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'planFor'">
				<vra:planFor>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:planFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'planIs'">
				<vra:hasPlan>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:hasPlan>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'prepatoryFor'">
				<vra:prepatoryFor>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:prepatoryFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'basedOn'">
				<vra:basedOn>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:basedOn>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'printingPlateFor'">
				<vra:printingPlateFor>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:printingPlateFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'printingPlateIs'">
				<vra:hasPrintingPlate>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:hasPrintingPlate>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'prototypeFor'">
				<vra:prototypeFor>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:prototypeFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'prototypeIs'">
				<vra:hasPrototype>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:hasPrototype>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'relatedTo'">
				<vra:isRelatedTo>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:isRelatedTo>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'reliefFor'">
				<vra:reliefFor>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:reliefFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'impressionIs'">
				<vra:hasImpression>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:hasImpression>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'replicaOf'">
				<vra:replicaOf>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:replicaOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'replicaIs'">
				<vra:hasReplica>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:hasReplica>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'studyFor'">
				<vra:studyFor>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:studyFor>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'studyIs'">
				<vra:hasStudy>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:hasStudy>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'versionOf'">
				<vra:versionOf>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:versionOf>
			</xsl:if>
			<xsl:if test="vc:relationSet/vc:relation/@type = 'versionIs'">
				<vra:hasVersion>
					<rdf:Description rdf:about="#{vc:relationSet/vc:relation/@refid}">
						<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					</rdf:Description>
				</vra:hasVersion>
			</xsl:if>
		</rdf:Description>
	</xsl:template>
  
  <!-- Agent template -->
	<xsl:template match="vc:agent">
		<vra:creator>
		<rdf:Description>
			<xsl:if test="vc:name/@vocab= 'ULAN' and vc:name/@refid">
					<xsl:attribute name="rdf:about">
					<xsl:text>http://vocab.getty.edu/ulan/</xsl:text>
					<xsl:value-of select="vc:name/@refid"/>
				</xsl:attribute>
			</xsl:if>
			<xsl:if test="vc:name/@vocab= 'LCNAF' and vc:name/@refid">
				<xsl:attribute name="rdf:about">
					<xsl:text>http://id.loc.gov/authorities/names/</xsl:text>
					<xsl:value-of select="translate(vc:name/@refid,' ','')"/>
				</xsl:attribute>
			</xsl:if>
			<rdf:type rdf:resource="http://purl.org/vra/Agent" />
			<xsl:if test="vc:name/@type='personal'">
				<rdf:type rdf:resource="http://purl.org/vra/Person" />
			</xsl:if>
			<xsl:if test="vc:name/@type='corporate'">
				<rdf:type rdf:resource="http://purl.org/vra/Organization" />
			</xsl:if>
			<xsl:choose>
			<xsl:when test="vc:name/@type='family'">
				<vra:familyName>
					<xsl:value-of select="vc:name" />
				</vra:familyName>
			</xsl:when>
			<xsl:otherwise>
			<vra:name>
				<xsl:value-of select="vc:name" />
			</vra:name>
			</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="vc:dates/@type='life'">
				<vra:birthDate>
					<xsl:value-of select="vc:dates/vc:earliestDate"/>
				</vra:birthDate>
				<vra:deathDate>
					<xsl:value-of select="vc:dates/vc:latestDate"/>
				</vra:deathDate>
			</xsl:if>
			<xsl:if test="vc:dates/@type='activity'">
				<vra:creativeActivity>
				<rdf:Description>
				<rdf:type rdf:resource="http://purl.org/vra/Event" />
					<vra:name>ArtisticActivity</vra:name>
					<vra:startDate>
						<xsl:value-of select="vc:dates/vc:earliestDate" />
					</vra:startDate>
					<vra:endDate>
						<xsl:value-of select="vc:dates/vc:latestDate" />
					</vra:endDate>
				</rdf:Description>
				</vra:creativeActivity>
			</xsl:if>
			<xsl:if test="vc:culture">
			<vra:hasCulture>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:text>http://purl.org/getty/vocab/ulan/</xsl:text>
					<xsl:value-of select="vc:culture"/>
				</xsl:attribute>
				<vra:name>
					<xsl:value-of select="vc:culture" />
				</vra:name>
			</rdf:Description>
			</vra:hasCulture>
			</xsl:if>
		</rdf:Description>
		</vra:creator>
	</xsl:template>
   
   <!-- CreativeWork Culture template -->
	<xsl:template match="vc:culturalContext">
	<xsl:choose>
		<xsl:when test="@vocab ='ULAN' and @refid">
		<vra:culturalContext>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:text>http://purl.org/getty/vocab/ulan/</xsl:text>
					<xsl:value-of select="translate(.,' ', '')"/>
				</xsl:attribute>
				<vra:name>
					<xsl:value-of select="." />
				</vra:name>
			</rdf:Description>
		</vra:culturalContext>
		</xsl:when>
		<xsl:when test="@vocab ='AAT' and @refid">
		<vra:culturalContext>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:text>http://vocab.getty.edu/aat/</xsl:text>
					<xsl:value-of select="translate(.,' ', '')"/>
				</xsl:attribute>
				<vra:name>
					<xsl:value-of select="." />
				</vra:name>
			</rdf:Description>
		</vra:culturalContext>
		</xsl:when>
		<xsl:when test="@vocab ='LCSH' and @refid">
		<vra:culturalContext>
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:text>http://id.loc.gov/authorities/subjects/</xsl:text>
					<xsl:value-of select="translate(.,' ', '')"/>
				</xsl:attribute>
				<vra:name>
					<xsl:value-of select="." />
				</vra:name>
			</rdf:Description>
		</vra:culturalContext>
		</xsl:when>
		<xsl:otherwise>
		<vra:culturalContext>
			<rdf:Description>
				<vra:name>
					<xsl:value-of select="." />
				</vra:name>
			</rdf:Description>
		</vra:culturalContext>
		</xsl:otherwise>		
	</xsl:choose>
	</xsl:template>

	<!-- Date/Event templates -->
	<xsl:template match="vc:dateSet">
		<xsl:if test="not(vc:dateSet/vc:dates)">
			<vra:dateCreated>
				<xsl:value-of select="vc:display" />
			</vra:dateCreated>
		</xsl:if>

		<xsl:if test="vc:date[@type='creation']">
			<vra:wasCreated>
				<rdf:Description>
				<rdf:type rdf:resource="http://purl.org/vra/Event" />
					<vra:name>Creation</vra:name>
					<vra:startDate>
						<xsl:value-of select="vc:date/vc:earliestDate" />
					</vra:startDate>
					<vra:endDate>
						<xsl:value-of select="vc:date/vc:latestDate" />
					</vra:endDate>
				</rdf:Description>
			</vra:wasCreated>
		</xsl:if>
		
		<xsl:if test="vc:date[@type='inclusive']">
			<vra:wasCreated>
				<rdf:Description>
				<rdf:type rdf:resource="http://purl.org/vra/Event" />
					<vra:name>Inclusive</vra:name>
					<vra:startDate>
						<xsl:value-of select="vc:date/vc:earliestDate" />
					</vra:startDate>
					<vra:endDate>
						<xsl:value-of select="vc:date/vc:latestDate" />
					</vra:endDate>
				</rdf:Description>
			</vra:wasCreated>
		</xsl:if>

		<xsl:if test="vc:date[@type='broadcast']">
			<vra:wasBroadcast>
				<rdf:Description>
				<rdf:type rdf:resource="http://purl.org/vra/Event" />
					<vra:name>Broadcast</vra:name>
					<vra:startDate>
						<xsl:value-of select="vc:date/vc:earliestDate" />
					</vra:startDate>
					<vra:endDate>
						<xsl:value-of select="vc:date/vc:latestDate" />
					</vra:endDate>
				</rdf:Description>
			</vra:wasBroadcast>
		</xsl:if>

		<xsl:if test="vc:date[@type='alteration']">
			<vra:wasAltered>
				<rdf:Description>
				<rdf:type rdf:resource="http://purl.org/vra/Event" />
					<vra:name>Altered</vra:name>
					<vra:startDate>
						<xsl:value-of select="vc:date/vc:earliestDate" />
					</vra:startDate>
					<vra:endDate>
						<xsl:value-of select="vc:date/vc:latestDate" />
					</vra:endDate>
				</rdf:Description>
			</vra:wasAltered>
		</xsl:if>

		<xsl:if test="vc:date[@type='commission']">
			<vra:wasCommissioned>
				<rdf:Description>
				<rdf:type rdf:resource="http://purl.org/vra/Event" />
					<vra:name>Commission</vra:name>
					<vra:startDate>
						<xsl:value-of select="vc:date/vc:earliestDate" />
					</vra:startDate>
					<vra:endDate>
						<xsl:value-of select="vc:date/vc:latestDate" />
					</vra:endDate>
				</rdf:Description>
			</vra:wasCommissioned>
		</xsl:if>

		<xsl:if test="vc:date[@type='design']">
			<vra:wasDesigned>
				<rdf:Description>
				<rdf:type rdf:resource="http://purl.org/vra/Event" />
					<vra:name>Design</vra:name>
					<vra:startDate>
						<xsl:value-of select="vc:date/vc:earliestDate" />
					</vra:startDate>
					<vra:endDate>
						<xsl:value-of select="vc:date/vc:latestDate" />
					</vra:endDate>
				</rdf:Description>
			</vra:wasDesigned>
		</xsl:if>

		<xsl:if test="vc:date[@type='destruction']">
			<vra:wasDestroyed>
				<rdf:Description>
				<rdf:type rdf:resource="http://purl.org/vra/Event" />
					<vra:name>Destruction</vra:name>
					<vra:startDate>
						<xsl:value-of select="vc:date/vc:earliestDate" />
					</vra:startDate>
					<vra:endDate>
						<xsl:value-of select="vc:date/vc:latestDate" />
					</vra:endDate>
				</rdf:Description>
			</vra:wasDestroyed>
		</xsl:if>

		<xsl:if test="vc:date[@type='discovery']">
			<vra:wasDiscovered>
				<rdf:Description>
				<rdf:type rdf:resource="http://purl.org/vra/Event" />
					<vra:name>Discovery</vra:name>
					<vra:startDate>
						<xsl:value-of select="vc:date/vc:earliestDate" />
					</vra:startDate>
					<vra:endDate>
						<xsl:value-of select="vc:date/vc:latestDate" />
					</vra:endDate>
				</rdf:Description>
			</vra:wasDiscovered>
		</xsl:if>

		<xsl:if test="vc:date[@type='exhibition']">
			<vra:wasExhibited>
				<rdf:Description>
				<rdf:type rdf:resource="http://purl.org/vra/Event" />
					<vra:name>Exhibition</vra:name>
					<vra:startDate>
						<xsl:value-of select="vc:date/vc:earliestDate" />
					</vra:startDate>
					<vra:endDate>
						<xsl:value-of select="vc:date/vc:latestDate" />
					</vra:endDate>
				</rdf:Description>
			</vra:wasExhibited>
		</xsl:if>

		<xsl:if test="vc:date[@type='performance']">
			<vra:wasPerformed>
				<rdf:Description>
				<rdf:type rdf:resource="http://purl.org/vra/Event" />
					<vra:name>Performance</vra:name>
					<vra:startDate>
						<xsl:value-of select="vc:date/vc:earliestDate" />
					</vra:startDate>
					<vra:endDate>
						<xsl:value-of select="vc:date/vc:latestDate" />
					</vra:endDate>
				</rdf:Description>
			</vra:wasPerformed>
		</xsl:if>

		<xsl:if test="vc:date[@type='publication']">
			<vra:wasPublished>
				<rdf:Description>
				<rdf:type rdf:resource="http://purl.org/vra/Event" />
					<vra:name>Publication</vra:name>
					<vra:startDate>
						<xsl:value-of select="vc:date/vc:earliestDate" />
					</vra:startDate>
					<vra:endDate>
						<xsl:value-of select="vc:date/vc:latestDate" />
					</vra:endDate>
				</rdf:Description>
			</vra:wasPublished>
		</xsl:if>

		<xsl:if test="vc:date[@type='restoration']">
			<vra:wasRestored>
				<rdf:Description>
				<rdf:type rdf:resource="http://purl.org/vra/Event" />
					<vra:name>Restoration</vra:name>
					<vra:startDate>
						<xsl:value-of select="vc:date/vc:earliestDate" />
					</vra:startDate>
					<vra:endDate>
						<xsl:value-of select="vc:date/vc:latestDate" />
					</vra:endDate>
				</rdf:Description>
			</vra:wasRestored>
		</xsl:if>

		<xsl:if test="vc:date[@type='view']">
			<vra:wasViewed>
				<rdf:Description>
				<rdf:type rdf:resource="http://purl.org/vra/Event" />
					<vra:name>Viewed</vra:name>
					<vra:startDate>
						<xsl:value-of select="vc:date/vc:earliestDate" />
					</vra:startDate>
					<vra:endDate>
						<xsl:value-of select="vc:date/vc:latestDate" />
					</vra:endDate>
				</rdf:Description>
			</vra:wasViewed>
		</xsl:if>
	</xsl:template>

<!-- Title template -->	
	<xsl:template match="vc:titleSet">
		<xsl:choose>
			<xsl:when test="not(vc:title)">
				<vra:name>
					<xsl:value-of select="vc:display" />
				</vra:name>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="vc:title"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="vc:title">
		<vra:name>
		<xsl:if test="@xml:lang">
			<xsl:attribute name="xml:lang">
				<xsl:value-of select="@xml:lang"/>
			</xsl:attribute>
		</xsl:if>
			<xsl:value-of select="." />
		</vra:name>
	</xsl:template>
	
	<!-- Description template -->
	<xsl:template match="vc:description">
		<vra:description>
			<xsl:value-of select="normalize-space(.)" />
		</vra:description>
	</xsl:template>

<!-- Location templates -->	
	<xsl:template match="vc:location[@type='repository']">
		<xsl:if test ="vc:refid/@type='accession'">
			<vra:serialNumber>
				<xsl:value-of select="vc:refid"/>
			</vra:serialNumber>
		</xsl:if>
		<vra:placeOfRepository>
			<rdf:Description>
				<rdf:type rdf:resource="http://purl.org/vra/Place" />
				<rdf:type rdf:resource="http://purl.org/vra/CivicStructure" />
				<xsl:apply-templates select="vc:name" mode="vra:Place"/>
				<vra:name>
					<xsl:value-of select="../vc:display"/>
				</vra:name>
				<vra:description>
					<xsl:value-of select="../vc:notes"/>
				</vra:description>
				</rdf:Description>
		</vra:placeOfRepository>
	</xsl:template>
	
	<xsl:template match="vc:location[@type='publication']">
		<vra:placeOfPublication>
			<rdf:Description>
				<rdf:type rdf:resource="http://purl.org/vra/Place" />
				<xsl:apply-templates select="vc:name" mode="vra:Place"/>
				<vra:name>
					<xsl:value-of select="../vc:display"/>
				</vra:name>
				<vra:description>
					<xsl:value-of select="../vc:notes"/>
				</vra:description>
			</rdf:Description>
		</vra:placeOfPublication>
	</xsl:template>
	
	<xsl:template match="vc:location[@type='formerOwner']">
		<vra:formerOwner>
			<rdf:Description>
				<rdf:type rdf:resource="http://purl.org/vra/Place" />
				<xsl:apply-templates select="vc:name" mode="vra:Place"/>
				<vra:name>
					<xsl:value-of select="../vc:display"/>
				</vra:name>
				<vra:description>
					<xsl:value-of select="../vc:notes"/>
				</vra:description>
			</rdf:Description>
		</vra:formerOwner>
	</xsl:template>
	
	<xsl:template match="vc:location[@type='discovery']">
		<vra:placeOfDiscovery>
			<rdf:Description>
				<rdf:type rdf:resource="http://purl.org/vra/Place" />
				<xsl:apply-templates select="vc:name" mode="vra:Place"/>
				<vra:name>
					<xsl:value-of select="../vc:display"/>
				</vra:name>
				<vra:description>
					<xsl:value-of select="../vc:notes"/>
				</vra:description>
			</rdf:Description>
		</vra:placeOfDiscovery>
	</xsl:template>
	
	<xsl:template match="vc:location[@type='exhibition']">
		<vra:placeOfExhibition>
			<rdf:Description>
				<rdf:type rdf:resource="http://purl.org/vra/Place" />
				<xsl:apply-templates select="vc:name" mode="vra:Place"/>
				<vra:name>
					<xsl:value-of select="../vc:display"/>
				</vra:name>
				<vra:description>
					<xsl:value-of select="../vc:notes"/>
				</vra:description>
			</rdf:Description>
		</vra:placeOfExhibition>
	</xsl:template>
	
	<xsl:template match="vc:location[@type='formerRepository']">
		<vra:formerRepository>
			<rdf:Description>
				<rdf:type rdf:resource="http://purl.org/vra/Place" />
				<rdf:type rdf:resource="http://purl.org/vra/CivicStructure" />
				<xsl:apply-templates select="vc:name" mode="vra:Place"/>
				<vra:name>
					<xsl:value-of select="../vc:display"/>
				</vra:name>
				<vra:description>
					<xsl:value-of select="../vc:notes"/>
				</vra:description>
			</rdf:Description>
		</vra:formerRepository>
	</xsl:template>
	
	<xsl:template match="vc:location[@type='formerSite']">
		<vra:formerSite>
			<rdf:Description>
				<rdf:type rdf:resource="http://purl.org/vra/Place" />
				<xsl:apply-templates select="vc:name" mode="vra:Place"/>
				<vra:name>
					<xsl:value-of select="../vc:display"/>
				</vra:name>
				<vra:description>
					<xsl:value-of select="../vc:notes"/>
				</vra:description>
			</rdf:Description>
		</vra:formerSite>
	</xsl:template>
	
	<xsl:template match="vc:location[@type='installation']">
		<vra:placeOfInstallation>
			<rdf:Description>
				<rdf:type rdf:resource="http://purl.org/vra/Place" />
				<xsl:apply-templates select="vc:name" mode="vra:Place"/>
				<vra:name>
					<xsl:value-of select="../vc:display"/>
				</vra:name>
				<vra:description>
					<xsl:value-of select="../vc:notes"/>
				</vra:description>
			</rdf:Description>
		</vra:placeOfInstallation>
	</xsl:template>
	
	<xsl:template match="vc:location[@type='intended']">
		<vra:placeOfIntention>
			<rdf:Description>
				<rdf:type rdf:resource="http://purl.org/vra/Place" />
				<xsl:apply-templates select="vc:name" mode="vra:Place"/>
				<vra:name>
					<xsl:value-of select="../vc:display"/>
				</vra:name>
				<vra:description>
					<xsl:value-of select="../vc:notes"/>
				</vra:description>
			</rdf:Description>
		</vra:placeOfIntention>
	</xsl:template>
	
	<xsl:template match="vc:location[@type='owner']">
		<vra:placeOfOwnership>
			<rdf:Description>
				<rdf:type rdf:resource="http://purl.org/vra/Place" />
				<xsl:apply-templates select="vc:name" mode="vra:Place"/>
				<vra:name>
					<xsl:value-of select="../vc:display"/>
				</vra:name>
				<vra:description>
					<xsl:value-of select="../vc:notes"/>
				</vra:description>
			</rdf:Description>
		</vra:placeOfOwnership>
	</xsl:template>
	
	<xsl:template match="vc:location[@type='performance']">
		<vra:placeOfPerformance>
			<rdf:Description>
				<rdf:type rdf:resource="http://purl.org/vra/Place" />
				<xsl:apply-templates select="vc:name" mode="vra:Place"/>
				<vra:name>
					<xsl:value-of select="../vc:display"/>
				</vra:name>
				<vra:description>
					<xsl:value-of select="../vc:notes"/>
				</vra:description>
			</rdf:Description>
		</vra:placeOfPerformance>
	</xsl:template>
	
	<xsl:template match="vc:location[@type='creation']">
		<vra:placeOfCreation>
			<rdf:Description>
				<rdf:type rdf:resource="http://purl.org/vra/Place" />
				<xsl:apply-templates select="vc:name" mode="vra:Place"/>
				<vra:name>
					<xsl:value-of select="../vc:display"/>
				</vra:name>
				<vra:description>
					<xsl:value-of select="../vc:notes"/>
				</vra:description>
			</rdf:Description>
		</vra:placeOfCreation>
	</xsl:template>
	
		
	<xsl:template match="vc:location[@type='other']">
		<rdfs:comment>
			<xsl:text>This is a default value. Please modify the Transformation stylesheet so that the @type'other' template reflects your organizaitons specific use of it</xsl:text>
		</rdfs:comment>
	</xsl:template>
	
	<xsl:template match="vc:location[@type='site']">
		<vra:placeOfSite>
			<rdf:Description>
				<rdf:type rdf:resource="http://purl.org/vra/Place" />
				<xsl:apply-templates select="vc:name" mode="vra:Place"/>
				<vra:name>
					<xsl:value-of select="../vc:display"/>
				</vra:name>
				<vra:description>
					<xsl:value-of select="../vc:notes"/>
				</vra:description>
			</rdf:Description>
		</vra:placeOfSite>
	</xsl:template>
	
	<xsl:template match="vc:name" mode="vra:Place">
		<vra:containedIn>
			<rdf:Description>
				<xsl:if test="@vocab='TGN' and @refid">
					<xsl:attribute name="rdf:about">
						<xsl:text>http://vocab.getty.edu/tgn/</xsl:text>
						<xsl:value-of select="normalize-space(@refid)"/>
					</xsl:attribute>
				</xsl:if>
				<xsl:if test="@vocab='LCSH' and @refid">
					<xsl:attribute name="rdf:about">
						<xsl:text>http://id.loc.gov/authorities/subjects/</xsl:text>
						<xsl:value-of select="translate(@refid,' ','')"/>
					</xsl:attribute>
				</xsl:if>
				<rdf:type rdf:resource="http://purl.org/vra/Place" />
				<xsl:if test="@extent='state'">
					<rdf:type rdf:resource="http://purl.org/vra/State" />
				</xsl:if>
				<xsl:if test="@extent='nation'">
					<rdf:type rdf:resource="http://purl.org/vra/Country" />
				</xsl:if>
				<xsl:if test="@extent='continent'">
					<rdf:type rdf:resource="http://purl.org/vra/Continent" />
				</xsl:if>
				<vra:name>
					<xsl:value-of select="."/>
				</vra:name>	
			</rdf:Description>
		</vra:containedIn>
	</xsl:template>
	
	<!-- Material template -->
		<xsl:template match="vc:materialSet">
			<xsl:choose>
					<xsl:when test="not(vc:material/node())">
						<vra:material>
						<rdf:Description>
						<rdf:type rdf:resource="http://purl.org/vra/Material" />
						<vra:name>
							<xsl:value-of select="vc:display"/>
						</vra:name>
						</rdf:Description>
						</vra:material>
					</xsl:when>
					<xsl:otherwise>
								<xsl:apply-templates select="vc:material"/>
					</xsl:otherwise>
			</xsl:choose>
	</xsl:template>
	
	<xsl:template match="vc:material">	
	<xsl:if test="string-length(.)&gt;0">	
		<xsl:choose>
			<xsl:when test="@vocab ='LCSAF' and @refid">
				<vra:material>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://id.loc.gov/authorities/subjects/</xsl:text>
						<xsl:value-of select="translate(@refid,' ','')"/>
					</xsl:attribute>
					<rdf:type rdf:resource="http://purl.org/vra/Material" />
					<vra:name>
						<xsl:value-of select="."/>
					</vra:name>
			</rdf:Description>
			</vra:material>
			</xsl:when>
			<xsl:when test="@vocab ='LCNAF' and @refid">
				<vra:material>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://id.loc.gov/authorities/names/</xsl:text>
						<xsl:value-of select="translate(@refid,' ','')"/>
					</xsl:attribute>
					<rdf:type rdf:resource="http://purl.org/vra/Material" />
					<vra:name>
						<xsl:value-of select="."/>
					</vra:name>
			</rdf:Description>
			</vra:material>
			</xsl:when>
			<xsl:when test="@vocab ='LCTGM' and @refid">
				<vra:material>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://id.loc.gov/vocabulary/graphicMaterials/</xsl:text>
						<xsl:value-of select="translate(@refid,' ','')"/>
					</xsl:attribute>
					<rdf:type rdf:resource="http://purl.org/vra/Intangible"/>
					<rdf:type rdf:resource="http://purl.org/vra/StylePeriod"/>
					<vra:name>
						<xsl:value-of select="."/>
					</vra:name>
			</rdf:Description>
			</vra:material>
			</xsl:when>
			<xsl:when test="@vocab ='AAT' and @refid">
				<vra:material>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://vocab.getty.edu/aat/</xsl:text>
						<xsl:value-of select="@refid"/>
					</xsl:attribute>
					<rdf:type rdf:resource="http://purl.org/vra/Material" />
					<vra:name>
						<xsl:value-of select="."/>
					</vra:name>
				</rdf:Description>
				</vra:material>
			</xsl:when>
			<xsl:when test="@vocab ='ULAN' and @refid">
				<vra:material>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://vocab.getty.edu/ulan/</xsl:text>
						<xsl:value-of select="@refid"/>
					</xsl:attribute>
					<rdf:type rdf:resource="http://purl.org/vra/Material" />
					<vra:name>
						<xsl:value-of select="."/>
					</vra:name>
				</rdf:Description>
				</vra:material>
			</xsl:when>
			<xsl:when test="@vocab ='TGN' and @refid">
				<vra:material>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://vocab.getty.edu/tgn/</xsl:text>
						<xsl:value-of select="@refid"/>
					</xsl:attribute>
					<rdf:type rdf:resource="http://purl.org/vra/Material" />
					<vra:name>
						<xsl:value-of select="."/>
					</vra:name>
				</rdf:Description>
				</vra:material>
			</xsl:when>
			<xsl:otherwise>
				<vra:material>
				<rdf:Description>
					<rdf:type rdf:resource="http://purl.org/vra/Material" />
					<vra:name>
						<xsl:value-of select="."/>
					</vra:name>
				</rdf:Description>
				</vra:material>
			</xsl:otherwise>
		</xsl:choose>
		</xsl:if>
	</xsl:template>
	
	<!-- StylePeriod templates -->
	<xsl:template match="vc:stylePeriodSet">
			<xsl:choose>
					<xsl:when test="not(vc:stylePeriod)">
						<vra:hasStylePeriod>
						<rdf:Description>
						<rdf:type rdf:resource="http://purl.org/vra/Intangible" />
						<rdf:type rdf:resource="http://purl.org/vra/StylePeriod" />
						<vra:name><xsl:value-of select="vc:display"></xsl:value-of></vra:name>
						</rdf:Description>
						</vra:hasStylePeriod>
					</xsl:when>
					<xsl:otherwise>
								<xsl:apply-templates select="vc:stylePeriod"/>
					</xsl:otherwise>
			</xsl:choose>
	</xsl:template>
	
	<xsl:template match="vc:stylePeriod">		
		<xsl:choose>
			<xsl:when test="@vocab ='LCSAF' and @refid">
				<vra:hasStylePeriod>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://id.loc.gov/authorities/subjects/</xsl:text>
						<xsl:value-of select="translate(@refid,' ','')"/>
					</xsl:attribute>
					<rdf:type rdf:resource="http://purl.org/vra/Intangible"/>
					<rdf:type rdf:resource="http://purl.org/vra/StylePeriod"/>
					<vra:name><xsl:value-of select="."/></vra:name>
			</rdf:Description>
			</vra:hasStylePeriod>
			</xsl:when>
			<xsl:when test="@vocab ='LCNAF' and @refid">
				<vra:hasStylePeriod>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://id.loc.gov/authorities/names/</xsl:text>
						<xsl:value-of select="translate(@refid,' ','')"/>
					</xsl:attribute>
					<rdf:type rdf:resource="http://purl.org/vra/Intangible"/>
					<rdf:type rdf:resource="http://purl.org/vra/StylePeriod"/>
					<vra:name><xsl:value-of select="."/></vra:name>
			</rdf:Description>
			</vra:hasStylePeriod>
			</xsl:when>
			<xsl:when test="@vocab ='LCTGM' and @refid">
				<vra:hasStylePeriod>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://id.loc.gov/vocabulary/graphicMaterials/</xsl:text>
						<xsl:value-of select="translate(@refid,' ','')"/>
					</xsl:attribute>
					<rdf:type rdf:resource="http://purl.org/vra/Intangible"/>
					<rdf:type rdf:resource="http://purl.org/vra/StylePeriod"/>
					<vra:name><xsl:value-of select="."/></vra:name>
			</rdf:Description>
			</vra:hasStylePeriod>
			</xsl:when>
			<xsl:when test="@vocab ='AAT' and @refid">
				<vra:hasStylePeriod>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://vocab.getty.edu/aat/</xsl:text>
						<xsl:value-of select="@refid"/>
					</xsl:attribute>
					<rdf:type rdf:resource="http://purl.org/vra/Intangible" />
					<rdf:type rdf:resource="http://purl.org/vra/StylePeriod" />
					<vra:name><xsl:value-of select="."/></vra:name>
				</rdf:Description>
				</vra:hasStylePeriod>
			</xsl:when>
			<xsl:when test="@vocab ='ULAN' and @refid">
				<vra:hasStylePeriod>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://vocab.getty.edu/ulan/</xsl:text>
						<xsl:value-of select="@refid"/>
					</xsl:attribute>
					<rdf:type rdf:resource="http://purl.org/vra/Intangible" />
					<rdf:type rdf:resource="http://purl.org/vra/StylePeriod" />
					<vra:name><xsl:value-of select="."/></vra:name>
				</rdf:Description>
				</vra:hasStylePeriod>
			</xsl:when>
			<xsl:when test="@vocab ='TGN' and @refid">
				<vra:hasStylePeriod>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://vocab.getty.edu/tgn/</xsl:text>
						<xsl:value-of select="@refid"/>
					</xsl:attribute>
					<rdf:type rdf:resource="http://purl.org/vra/Intangible" />
					<rdf:type rdf:resource="http://purl.org/vra/StylePeriod" />
					<vra:name><xsl:value-of select="."/></vra:name>
				</rdf:Description>
				</vra:hasStylePeriod>
			</xsl:when>
			<xsl:otherwise>
				<vra:hasStylePeriod>
				<rdf:Description>
					<rdf:type rdf:resource="http://purl.org/vra/Intangible" />
					<rdf:type rdf:resource="http://purl.org/vra/StylePeriod" />
					<vra:name><xsl:value-of select="."/></vra:name>
				</rdf:Description>
				</vra:hasStylePeriod>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- Subject Templates	  -->
	<xsl:template match="vc:subjectSet">
		<xsl:choose>
			<xsl:when test="not(vc:subject/vc:term)">
				<vra:about>
				<rdf:Description>
					<rdf:type rdf:resource="http://purl.org/vra/Thing" />
					<vra:name><xsl:value-of select="vc:display"></xsl:value-of></vra:name>
				</rdf:Description>
				</vra:about>
			</xsl:when>
			<xsl:otherwise>
						<xsl:apply-templates select="vc:subject/vc:term"/>
			</xsl:otherwise>
			</xsl:choose>
	</xsl:template>
	
	<xsl:template match="vc:subject/vc:term">	 
		<xsl:choose>	
			<xsl:when test="@vocab = 'LCSAF' and @refid">
				<vra:about>
				<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:text>http://id.loc.gov/authorities/subjects/</xsl:text>
					<xsl:value-of select="translate(@refid,' ','')"/>
				</xsl:attribute>
				<xsl:choose>
					<xsl:when test="@type='corporateName'">
						<rdf:type rdf:resource="http://purl.org/vra/Organization" />
					</xsl:when>	
					<xsl:when test="@type='personalName'">
						<rdf:type rdf:resource="http://purl.org/vra/Person" />
					</xsl:when>
					<xsl:when test="@type='familyName'">
						<rdf:type rdf:resource="http://purl.org/vra/Person" />
					</xsl:when>
					<xsl:otherwise>
						<rdf:type rdf:resource="http://purl.org/vra/Thing" />
					</xsl:otherwise>
				</xsl:choose>
				<vra:name>
					<xsl:value-of select="."/>
				</vra:name>
				</rdf:Description>
				</vra:about>
			</xsl:when>
			<xsl:when test="@vocab = 'LCNAF' and @refid">
				<vra:about>
				<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:text>http://id.loc.gov/authorities/names/</xsl:text>
					<xsl:value-of select="translate(@refid,' ','')"/>
				</xsl:attribute>
				<xsl:choose>
					<xsl:when test="@type='corporateName'">
						<rdf:type rdf:resource="http://purl.org/vra/Organization" />
					</xsl:when>	
					<xsl:when test="@type='personalName'">
						<rdf:type rdf:resource="http://purl.org/vra/Person" />
					</xsl:when>
					<xsl:when test="@type='familyName'">
						<rdf:type rdf:resource="http://purl.org/vra/Person" />
					</xsl:when>
					<xsl:otherwise>
						<rdf:type rdf:resource="http://purl.org/vra/Thing" />
					</xsl:otherwise>
				</xsl:choose>
				<vra:name>
					<xsl:value-of select="."/>
				</vra:name>
				</rdf:Description>
				</vra:about>
			</xsl:when>
			<xsl:when test="@vocab = 'LCTGM' and @refid">
				<vra:about>
				<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:text>http://id.loc.gov/vocabulary/graphicMaterials/</xsl:text>
					<xsl:value-of select="translate(@refid,' ','')"/>
				</xsl:attribute>
				<xsl:choose>
					<xsl:when test="@type='corporateName'">
						<rdf:type rdf:resource="http://purl.org/vra/Organization" />
					</xsl:when>	
					<xsl:when test="@type='personalName'">
						<rdf:type rdf:resource="http://purl.org/vra/Person" />
					</xsl:when>
					<xsl:when test="@type='familyName'">
						<rdf:type rdf:resource="http://purl.org/vra/Person" />
					</xsl:when>
					<xsl:otherwise>
						<rdf:type rdf:resource="http://purl.org/vra/Thing" />
					</xsl:otherwise>
				</xsl:choose>
				<vra:name>
					<xsl:value-of select="."/>
				</vra:name>
				</rdf:Description>
				</vra:about>
			</xsl:when>
			<xsl:when test="@vocab = 'TGN' and @refid">
				<vra:about>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://vocab.getty.edu/tgn/</xsl:text>
						<xsl:value-of select="@refid"/>
					</xsl:attribute>
					<xsl:choose>
						<xsl:when test="@type='corporateName'">
							<rdf:type rdf:resource="http://purl.org/vra/Organization" />
						</xsl:when>	
						<xsl:when test="@type='personalName'">
							<rdf:type rdf:resource="http://purl.org/vra/Person" />
						</xsl:when>
						<xsl:when test="@type='familyName'">
							<rdf:type rdf:resource="http://purl.org/vra/Person" />
						</xsl:when>
						<xsl:otherwise>
							<rdf:type rdf:resource="http://purl.org/vra/Thing" />
						</xsl:otherwise>
					</xsl:choose>
					<vra:name>
						<xsl:value-of select="."/>
					</vra:name>
				</rdf:Description>
				</vra:about>
			</xsl:when>
			<xsl:when test="@vocab = 'AAT' and @refid">
				<vra:about>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://vocab.getty.edu/aat/</xsl:text>
						<xsl:value-of select="@refid"/>
					</xsl:attribute>
					<xsl:choose>
						<xsl:when test="@type='corporateName'">
							<rdf:type rdf:resource="http://purl.org/vra/Organization" />
						</xsl:when>	
						<xsl:when test="@type='personalName'">
							<rdf:type rdf:resource="http://purl.org/vra/Person" />
						</xsl:when>
						<xsl:when test="@type='familyName'">
							<rdf:type rdf:resource="http://purl.org/vra/Person" />
						</xsl:when>
						<xsl:otherwise>
							<rdf:type rdf:resource="http://purl.org/vra/Thing" />
						</xsl:otherwise>
					</xsl:choose>
					<vra:name>
						<xsl:value-of select="."/>
					</vra:name>
				</rdf:Description>
				</vra:about>
			</xsl:when>
			<xsl:when test="@vocab = 'ULAN' and @refid">
				<vra:about>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://vocab.getty.edu/ulan/</xsl:text>
						<xsl:value-of select="@refid"/>
					</xsl:attribute>
					<xsl:choose>
						<xsl:when test="@type='corporateName'">
							<rdf:type rdf:resource="http://purl.org/vra/Organization" />
						</xsl:when>	
						<xsl:when test="@type='personalName'">
							<rdf:type rdf:resource="http://purl.org/vra/Person" />
						</xsl:when>
						<xsl:when test="@type='familyName'">
							<rdf:type rdf:resource="http://purl.org/vra/Person" />
						</xsl:when>
						<xsl:otherwise>
							<rdf:type rdf:resource="http://purl.org/vra/Thing" />
						</xsl:otherwise>
					</xsl:choose>
					<vra:name>
						<xsl:value-of select="."/>
					</vra:name>
				</rdf:Description>
				</vra:about>
			</xsl:when>
			<xsl:otherwise>
				<vra:about>
				<rdf:Description>
					<xsl:choose>
						<xsl:when test="@type='corporateName'">
							<rdf:type rdf:resource="http://purl.org/vra/Organization" />
						</xsl:when>	
						<xsl:when test="@type='personalName'">
							<rdf:type rdf:resource="http://purl.org/vra/Person" />
						</xsl:when>
						<xsl:when test="@type='familyName'">
							<rdf:type rdf:resource="http://purl.org/vra/Person" />
						</xsl:when>
						<xsl:otherwise>
							<rdf:type rdf:resource="http://purl.org/vra/Thing" />
						</xsl:otherwise>
					</xsl:choose>
					<vra:name>
						<xsl:value-of select="."/>
					</vra:name>
				</rdf:Description>
				</vra:about>
			</xsl:otherwise>
			</xsl:choose>
	</xsl:template>
	
	<!-- Technique set templates -->
	<xsl:template match="vc:techniqueSet">
		<xsl:choose>
			<xsl:when test="not(vc:technique/node())">
				<vra:hasTechnique>
				<rdf:Description>
				<rdf:type rdf:resource="http://purl.org/vra/Intangible" />
				<rdf:type rdf:resource="http://purl.org/vra/Technique" />
				<vra:name>
					<xsl:value-of select="vc:display" />
				</vra:name>
				</rdf:Description>
				</vra:hasTechnique>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="vc:technique"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>		
			
	<xsl:template match="vc:technique">	 
		<xsl:choose>	
			<xsl:when test="@vocab = 'LCSAF' and @refid">
				<vra:hasTechnique>
				<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:text>http://id.loc.gov/authorities/subjects/</xsl:text>
					<xsl:value-of select="translate(@refid,' ','')"/>
				</xsl:attribute>
					<rdf:type rdf:resource="http://purl.org/vra/Intangible" />
					<rdf:type rdf:resource="http://purl.org/vra/Technique" />
					<vra:name>
						<xsl:value-of select="."/>
					</vra:name>
				</rdf:Description>
				</vra:hasTechnique>
			</xsl:when>
			<xsl:when test="@vocab = 'LCNAF' and @refid">
				<vra:hasTechnique>
				<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:text>http://id.loc.gov/authorities/names/</xsl:text>
					<xsl:value-of select="translate(@refid,' ','')"/>
				</xsl:attribute>
					<rdf:type rdf:resource="http://purl.org/vra/Intangible" />
					<rdf:type rdf:resource="http://purl.org/vra/Technique" />
					<vra:name>
						<xsl:value-of select="."/>
					</vra:name>
				</rdf:Description>
				</vra:hasTechnique>
			</xsl:when>
			<xsl:when test="@vocab = 'LCTGM' and @refid">
				<vra:hasTechnique>
				<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:text>http://id.loc.gov/vocabulary/graphicMaterials/</xsl:text>
					<xsl:value-of select="translate(@refid,' ','')"/>
				</xsl:attribute>
					<rdf:type rdf:resource="http://purl.org/vra/Intangible" />
					<rdf:type rdf:resource="http://purl.org/vra/Technique" />
					<vra:name>
						<xsl:value-of select="."/>
					</vra:name>
				</rdf:Description>
				</vra:hasTechnique>
			</xsl:when>
			<xsl:when test="@vocab = 'TGN' and @refid">
				<vra:hasTechnique>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://vocab.getty.edu/tgn/</xsl:text>
						<xsl:value-of select="@refid"/>
					</xsl:attribute>
					<rdf:type rdf:resource="http://purl.org/vra/Intangible" />
					<rdf:type rdf:resource="http://purl.org/vra/Technique" />
				<vra:name>
					<xsl:value-of select="."/>
				</vra:name>
				</rdf:Description>
				</vra:hasTechnique>
			</xsl:when>
			<xsl:when test="@vocab = 'AAT' and @refid">
				<vra:hasTechnique>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://vocab.getty.edu/aat/</xsl:text>
						<xsl:value-of select="@refid"/>
					</xsl:attribute>
					<rdf:type rdf:resource="http://purl.org/vra/Intangible" />
					<rdf:type rdf:resource="http://purl.org/vra/Technique" />
					<vra:name>
						<xsl:value-of select="."/>
					</vra:name>
				</rdf:Description>
				</vra:hasTechnique>
			</xsl:when>
			<xsl:when test="@vocab = 'ULAN' and @refid">
				<vra:hasTechnique>
				<rdf:Description>
					<xsl:attribute name="rdf:about">
						<xsl:text>http://vocab.getty.edu/ulan/</xsl:text>
						<xsl:value-of select="@refid"/>
					</xsl:attribute>
					<rdf:type rdf:resource="http://purl.org/vra/Intangible" />
					<rdf:type rdf:resource="http://purl.org/vra/Technique" />
					<vra:name>
						<xsl:value-of select="."/>
					</vra:name>
				</rdf:Description>
				</vra:hasTechnique>
			</xsl:when>
			<xsl:otherwise>
				<vra:hasTechnique>
				<rdf:Description>
					<rdf:type rdf:resource="http://purl.org/vra/Intangible" />
					<rdf:type rdf:resource="http://purl.org/vra/Technique" />
					<vra:name>
						<xsl:value-of select="."/>
					</vra:name>
				</rdf:Description>
				</vra:hasTechnique>
			</xsl:otherwise>
			</xsl:choose>
	</xsl:template>
	
	<!-- Measurement Templates -->
	<xsl:template match="vc:measurementsSet">
		<xsl:choose>
			<xsl:when test="not(vc:measurements/node())">
					<vra:contentSize>
					<xsl:value-of select="vc:display" />
					</vra:contentSize>
					<xsl:apply-templates select="/*//vc:measurements[@extent='each slide']"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="vc:measurements"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>	
	
	<xsl:template match="vc:measurements">
		<xsl:if test="@type = 'height'">
			<vra:height>
				<rdf:Description>
					<rdf:type rdf:resource="http://purl.org/vra/QuantitativeValue" />
					<vra:value>
						<xsl:value-of select="." />
					</vra:value>
					<xsl:if test="@unit = 'in'">
						<vra:unitCode>
							<xsl:text>INH</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'cm'">
						<vra:unitCode>
							<xsl:text>CMT</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'ft'">
						<vra:unitCode>
							<xsl:text>FOT</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'm'">
						<vra:unitCode>
							<xsl:text>MTR</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'yd'">
						<vra:unitCode>
							<xsl:text>YRD</xsl:text>
						</vra:unitCode>
					</xsl:if>
				</rdf:Description>
			</vra:height>
		</xsl:if>
		<xsl:if test="@type = 'width'">
			<vra:width>
				<rdf:Description>
					<rdf:type rdf:resource="http://purl.org/vra/QuantitativeValue" />
					<vra:value>
						<xsl:value-of select="." />
					</vra:value>
					<xsl:if test="@unit = 'in'">
						<vra:unitCode>
							<xsl:text>INH</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'cm'">
						<vra:unitCode>
							<xsl:text>CMT</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'ft'">
						<vra:unitCode>
							<xsl:text>FOT</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'm'">
						<vra:unitCode>
							<xsl:text>MTR</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'yd'">
						<vra:unitCode>
							<xsl:text>YRD</xsl:text>
						</vra:unitCode>
					</xsl:if>
				</rdf:Description>
			</vra:width>
		</xsl:if>
		<xsl:if test="@type = 'depth'">
			<vra:depth>
				<rdf:Description>
					<rdf:type rdf:resource="http://purl.org/vra/QuantitativeValue" />
					<vra:value>
						<xsl:value-of select="." />
					</vra:value>
					<xsl:if test="@unit = 'in'">
						<vra:unitCode>
							<xsl:text>INH</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'cm'">
						<vra:unitCode>
							<xsl:text>CMT</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'ft'">
						<vra:unitCode>
							<xsl:text>FOT</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'm'">
						<vra:unitCode>
							<xsl:text>MTR</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'yd'">
						<vra:unitCode>
							<xsl:text>YRD</xsl:text>
						</vra:unitCode>
					</xsl:if>
				</rdf:Description>
			</vra:depth>
		</xsl:if>
		<xsl:if test="@type = 'length'">
			<vra:length>
				<rdf:Description>
					<rdf:type rdf:resource="http://purl.org/vra/QuantitativeValue" />
					<vra:value>
						<xsl:value-of select="." />
					</vra:value>
					<xsl:if test="@unit = 'in'">
						<vra:unitCode>
							<xsl:text>INH</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'cm'">
						<vra:unitCode>
							<xsl:text>CMT</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'ft'">
						<vra:unitCode>
							<xsl:text>FOT</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'm'">
						<vra:unitCode>
							<xsl:text>MTR</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'yd'">
						<vra:unitCode>
							<xsl:text>YRD</xsl:text>
						</vra:unitCode>
					</xsl:if>
				</rdf:Description>
			</vra:length>
		</xsl:if>
		<xsl:if test="@type = 'distanceBetween'">
			<vra:distanceBetween>
				<rdf:Description>
					<rdf:type rdf:resource="http://purl.org/vra/QuantitativeValue" />
					<vra:value>
						<xsl:value-of select="." />
					</vra:value>
					<xsl:if test="@unit = 'in'">
						<vra:unitCode>
							<xsl:text>INH</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'cm'">
						<vra:unitCode>
							<xsl:text>CMT</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'ft'">
						<vra:unitCode>
							<xsl:text>FOT</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'm'">
						<vra:unitCode>
							<xsl:text>MTR</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'yd'">
						<vra:unitCode>
							<xsl:text>YRD</xsl:text>
						</vra:unitCode>
					</xsl:if>
				</rdf:Description>
			</vra:distanceBetween>
		</xsl:if>
		<xsl:if test="@type = 'diameter'">
			<vra:diameter>
				<rdf:Description>
					<rdf:type rdf:resource="http://purl.org/vra/QuantitativeValue" />
					<vra:value>
						<xsl:value-of select="." />
					</vra:value>
					<xsl:if test="@unit = 'in'">
						<vra:unitCode>
							<xsl:text>INH</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'cm'">
						<vra:unitCode>
							<xsl:text>CMT</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'ft'">
						<vra:unitCode>
							<xsl:text>FOT</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'm'">
						<vra:unitCode>
							<xsl:text>MTR</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'yd'">
						<vra:unitCode>
							<xsl:text>YRD</xsl:text>
						</vra:unitCode>
					</xsl:if>
				</rdf:Description>
			</vra:diameter>
		</xsl:if>
		<xsl:if test="@type = 'circumfrence'">
			<vra:circumfrence>
				<rdf:Description>
					<rdf:type rdf:resource="http://purl.org/vra/QuantitativeValue" />
					<vra:value>
						<xsl:value-of select="." />
					</vra:value>
					<xsl:if test="@unit = 'in'">
						<vra:unitCode>
							<xsl:text>INH</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'cm'">
						<vra:unitCode>
							<xsl:text>CMT</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'ft'">
						<vra:unitCode>
							<xsl:text>FOT</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'm'">
						<vra:unitCode>
							<xsl:text>MTR</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'yd'">
						<vra:unitCode>
							<xsl:text>YRD</xsl:text>
						</vra:unitCode>
					</xsl:if>
				</rdf:Description>
			</vra:circumfrence>
		</xsl:if>
		<xsl:if test="@type = 'area'">
			<vra:area>
				<rdf:Description>
					<rdf:type rdf:resource="http://purl.org/vra/QuantitativeValue" />
					<vra:value>
						<xsl:value-of select="." />
					</vra:value>
					<xsl:if test="@unit = 'inÂ²'">
						<vra:unitCode>
							<xsl:text>INK</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'cmÂ²'">
						<vra:unitCode>
							<xsl:text>CMK</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'ftÂ²'">
						<vra:unitCode>
							<xsl:text>FTK</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'mÂ²'">
						<vra:unitCode>
							<xsl:text>MTK</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'ydÂ²'">
						<vra:unitCode>
							<xsl:text>YDK</xsl:text>
						</vra:unitCode>
					</xsl:if>
				</rdf:Description>
			</vra:area>
		</xsl:if>
		<xsl:if test="@type = 'weight'">
			<vra:weight>
				<rdf:Description>
					<rdf:type rdf:resource="http://purl.org/vra/QuantitativeValue" />
					<vra:value>
						<xsl:value-of select="." />
					</vra:value>
					<xsl:if test="@unit = 'mg'">
						<vra:unitCode>
							<xsl:text>MGM</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'g'">
						<vra:unitCode>
							<xsl:text>GRM</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'kg'">
						<vra:unitCode>
							<xsl:text>KGM</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 't'">
						<vra:unitCode>
							<xsl:text>TNE</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'oz'">
						<vra:unitCode>
							<xsl:text>ONZ</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'lb'">
						<vra:unitCode>
							<xsl:text>LBR</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'ton (US)'">
						<vra:unitCode>
							<xsl:text>STN</xsl:text>
						</vra:unitCode>
					</xsl:if>
				</rdf:Description>
			</vra:weight>
		</xsl:if>
		<xsl:if test="@type = 'duration'">
			<vra:duration>
				<rdf:Description>
					<rdf:type rdf:resource="http://purl.org/vra/QuantitativeValue" />
					<vra:value>
						<xsl:value-of select="." />
					</vra:value>
					<xsl:if test="@unit = 's'">
						<vra:unitCode>
							<xsl:text>SEC</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'min'">
						<vra:unitCode>
							<xsl:text>MIN</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'h'">
						<vra:unitCode>
							<xsl:text>HUR</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'd'">
						<vra:unitCode>
							<xsl:text>DAY</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'wk'">
						<vra:unitCode>
							<xsl:text>WEE</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'mo'">
						<vra:unitCode>
							<xsl:text>MON</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'a'">
						<vra:unitCode>
							<xsl:text>ANN</xsl:text>
						</vra:unitCode>
					</xsl:if>
				</rdf:Description>
			</vra:duration>
		</xsl:if>
		<xsl:if test="@type = 'runningTime'">
			<vra:runningTime>
				<rdf:Description>
					<rdf:type rdf:resource="http://purl.org/vra/QuantitativeValue" />
					<vra:value>
						<xsl:value-of select="." />
					</vra:value>
					<xsl:if test="@unit = 's'">
						<vra:unitCode>
							<xsl:text>SEC</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'min'">
						<vra:unitCode>
							<xsl:text>MIN</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'h'">
						<vra:unitCode>
							<xsl:text>HUR</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'd'">
						<vra:unitCode>
							<xsl:text>DAY</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'wk'">
						<vra:unitCode>
							<xsl:text>WEE</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'mo'">
						<vra:unitCode>
							<xsl:text>MON</xsl:text>
						</vra:unitCode>
					</xsl:if>
					<xsl:if test="@unit = 'a'">
						<vra:unitCode>
							<xsl:text>ANN</xsl:text>
						</vra:unitCode>
					</xsl:if>
				</rdf:Description>
			</vra:runningTime>
		</xsl:if>
		<xsl:if test="@type = 'count'">
			<vra:inventoryLevel>
				<rdf:Description>
					<rdf:type rdf:resource="http://purl.org/vra/QuantitativeValue" />
					<vra:value>
						<xsl:value-of select="." />
					</vra:value>
				</rdf:Description>
			</vra:inventoryLevel>
		</xsl:if>
		<xsl:if test="@type = 'bitDepth'">
			<vra:bitrate>
					<xsl:value-of select="." />
					<xsl:text>" "</xsl:text>
					<xsl:value-of select="@unit" />
			</vra:bitrate>
		</xsl:if>
		<xsl:if test="@type = 'fileSize'">
			<vra:contentSize>
					<xsl:value-of select="." />
					<xsl:text>" "</xsl:text>
					<xsl:value-of select="@unit" />
			</vra:contentSize>
		</xsl:if>
		<xsl:if test="@type = 'resolution'">
			<vra:resolution>
					<xsl:value-of select="." />
					<xsl:text>" "</xsl:text>
					<xsl:value-of select="@unit" />
			</vra:resolution>
		</xsl:if>
	</xsl:template>
	
	<!-- Rights Templates -->
	<xsl:template match="vc:rightsSet">
		<xsl:choose>
			<xsl:when test="not(vc:rights/node())">
				<dcterms:rights>
					<rdf:Description>
						<rdfs:label>
							<xsl:value-of select="vc:display" />
						</rdfs:label>
					</rdf:Description>
				</dcterms:rights>
			</xsl:when>
			<xsl:otherwise>
				<dcterms:rights>
					<rdf:Description>
						<xsl:attribute name="rdf:about">
							<xsl:text>http://purl.org/rights/</xsl:text>
							<xsl:value-of select="vc:rights/@type"/>
						</xsl:attribute>
						<xsl:value-of select="vc:rights/vc:text" />
					</rdf:Description>
				</dcterms:rights>
				<vra:copyrightHolder>
					<rdf:Description>
						<rdf:type rdf:resource="http://purl.org/vra/Agent" />	
						<vra:name>
							<xsl:value-of select="vc:rights/vc:rightsHolder" />
						</vra:name>
					</rdf:Description>
				</vra:copyrightHolder>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- Inscription templates -->
	<xsl:template match="vc:inscriptionSet">
		<xsl:choose>
			<xsl:when test="not(vc:inscription/vc:author/node())">
				<vra:hasInscription>
					<rdf:Description>
					<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					<rdf:type rdf:resource="http://purl.org/vra/Inscription" />
					<vra:description>
						<xsl:value-of select="vc:display"/>
					</vra:description>
					</rdf:Description>
				</vra:hasInscription>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="vc:inscription"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="vc:inscription">
		<xsl:choose>
			<xsl:when test="vc:author/@vocab = 'LCSAF' and @refid">
				<vra:hasInscription>
				<rdf:Description>
					<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					<rdf:type rdf:resource="http://purl.org/vra/Inscription" />
					<vra:position>
						<xsl:value-of select="vc:position"/>
					</vra:position>
					<vra:signiture>
						<xsl:value-of select="vc:signiture"/>
					</vra:signiture>
					<vra:text>
						<xsl:value-of select="vc:text"/>
					</vra:text>
					<vra:mark>
						<xsl:value-of select="vc:mark"/>
					</vra:mark>
					<vra:caption>
						<xsl:value-of select="vc:caption"/>
					</vra:caption>
					<vra:translation>
						<xsl:value-of select="vc:translation"/>
					</vra:translation>
					<vra:dateCreated>
						<xsl:value-of select="vc:date"/>
					</vra:dateCreated>
					<vra:author>
						<rdf:Description>
						<xsl:attribute name="rdf:about">
								<xsl:text>http://id.loc.gov/authorities/subjects/</xsl:text>
								<xsl:value-of select="translate(@refid,' ','')"/>
						</xsl:attribute>
					<rdf:type rdf:resource="http://purl.org/vra/Agent" />	
					<vra:name>
						<xsl:value-of select="vc:author"/>
					</vra:name>	
					</rdf:Description>	
					</vra:author>
				</rdf:Description>
				</vra:hasInscription>
			</xsl:when>
			<xsl:when test="@vocab = 'LCNAF' and @refid">
				<vra:hasInscription>
				<rdf:Description>
					<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					<rdf:type rdf:resource="http://purl.org/vra/Inscription" />
					<vra:position>
						<xsl:value-of select="vc:position"/>
					</vra:position>
					<vra:signiture>
						<xsl:value-of select="vc:signiture"/>
					</vra:signiture>
					<vra:text>
						<xsl:value-of select="vc:text"/>
					</vra:text>
					<vra:mark>
						<xsl:value-of select="vc:mark"/>
					</vra:mark>
					<vra:caption>
						<xsl:value-of select="vc:caption"/>
					</vra:caption>
					<vra:translation>
						<xsl:value-of select="vc:translation"/>
					</vra:translation>
					<vra:dateCreated>
						<xsl:value-of select="vc:date"/>
					</vra:dateCreated>
					<vra:author>
						<rdf:Description>
						<xsl:attribute name="rdf:about">
								<xsl:text>http://id.loc.gov/authorities/names/</xsl:text>
								<xsl:value-of select="translate(@refid,' ','')"/>
						</xsl:attribute>
					<rdf:type rdf:resource="http://purl.org/vra/Agent" />	
					<vra:name>
						<xsl:value-of select="vc:author"/>
					</vra:name>	
					</rdf:Description>	
					</vra:author>
				</rdf:Description>
				</vra:hasInscription>
			</xsl:when>
			<xsl:when test="@vocab = 'LCTGM' and @refid">
				<vra:hasInscription>
				<rdf:Description>
					<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					<rdf:type rdf:resource="http://purl.org/vra/Inscription" />
					<vra:position>
						<xsl:value-of select="vc:position"/>
					</vra:position>
					<vra:signiture>
						<xsl:value-of select="vc:signiture"/>
					</vra:signiture>
					<vra:text>
						<xsl:value-of select="vc:text"/>
					</vra:text>
					<vra:mark>
						<xsl:value-of select="vc:mark"/>
					</vra:mark>
					<vra:caption>
						<xsl:value-of select="vc:caption"/>
					</vra:caption>
					<vra:translation>
						<xsl:value-of select="vc:translation"/>
					</vra:translation>
					<vra:dateCreated>
						<xsl:value-of select="vc:date"/>
					</vra:dateCreated>
					<vra:author>
						<rdf:Description>
						<xsl:attribute name="rdf:about">
								<xsl:text>http://id.loc.gov/vocabulary/graphicMaterials/</xsl:text>
								<xsl:value-of select="translate(@refid,' ','')"/>
						</xsl:attribute>
					<rdf:type rdf:resource="http://purl.org/vra/Agent" />	
					<vra:name>
						<xsl:value-of select="vc:author"/>
					</vra:name>	
					</rdf:Description>	
					</vra:author>
				</rdf:Description>
				</vra:hasInscription>
			</xsl:when>
			<xsl:when test="@vocab = 'TGN' and @refid">
				<vra:hasInscription>
				<rdf:Description>
					<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					<rdf:type rdf:resource="http://purl.org/vra/Inscription" />
					<vra:position>
						<xsl:value-of select="vc:position"/>
					</vra:position>
					<vra:signiture>
						<xsl:value-of select="vc:signiture"/>
					</vra:signiture>
					<vra:text>
						<xsl:value-of select="vc:text"/>
					</vra:text>
					<vra:mark>
						<xsl:value-of select="vc:mark"/>
					</vra:mark>
					<vra:caption>
						<xsl:value-of select="vc:caption"/>
					</vra:caption>
					<vra:translation>
						<xsl:value-of select="vc:translation"/>
					</vra:translation>
					<vra:dateCreated>
						<xsl:value-of select="vc:date"/>
					</vra:dateCreated>
					<vra:author>
					<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:text>http://vocab.getty.edu/tgn/</xsl:text>
								<xsl:value-of select="@refid"/>
							</xsl:attribute>
					<rdf:type rdf:resource="http://purl.org/vra/Agent" />	
					<vra:name>
						<xsl:value-of select="vc:author"/>
					</vra:name>	
					</rdf:Description>	
					</vra:author>
				</rdf:Description>
				</vra:hasInscription>
			</xsl:when>
			<xsl:when test="@vocab = 'AAT' and @refid">
				<vra:hasInscription>
				<rdf:Description>
					<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					<rdf:type rdf:resource="http://purl.org/vra/Inscription" />
					<vra:position>
						<xsl:value-of select="vc:position"/>
					</vra:position>
					<vra:signiture>
						<xsl:value-of select="vc:signiture"/>
					</vra:signiture>
					<vra:text>
						<xsl:value-of select="vc:text"/>
					</vra:text>
					<vra:mark>
						<xsl:value-of select="vc:mark"/>
					</vra:mark>
					<vra:caption>
						<xsl:value-of select="vc:caption"/>
					</vra:caption>
					<vra:translation>
						<xsl:value-of select="vc:translation"/>
					</vra:translation>
					<vra:dateCreated>
						<xsl:value-of select="vc:date"/>
					</vra:dateCreated>
					<vra:author>
					<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:text>http://vocab.getty.edu/aat/</xsl:text>
								<xsl:value-of select="@refid"/>
							</xsl:attribute>
					<rdf:type rdf:resource="http://purl.org/vra/Agent" />	
					<vra:name>
						<xsl:value-of select="vc:author"/>
					</vra:name>	
					</rdf:Description>	
					</vra:author>
				</rdf:Description>
				</vra:hasInscription>
			</xsl:when>
			<xsl:when test="@vocab = 'ULAN' and @refid">
				<vra:hasInscription>
				<rdf:Description>
					<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					<rdf:type rdf:resource="http://purl.org/vra/Inscription" />
					<vra:position>
						<xsl:value-of select="vc:position"/>
					</vra:position>
					<vra:signiture>
						<xsl:value-of select="vc:signiture"/>
					</vra:signiture>
					<vra:text>
						<xsl:value-of select="vc:text"/>
					</vra:text>
					<vra:mark>
						<xsl:value-of select="vc:mark"/>
					</vra:mark>
					<vra:caption>
						<xsl:value-of select="vc:caption"/>
					</vra:caption>
					<vra:translation>
						<xsl:value-of select="vc:translation"/>
					</vra:translation>
					<vra:dateCreated>
						<xsl:value-of select="vc:date"/>
					</vra:dateCreated>
					<vra:author>
					<rdf:Description>
							<xsl:attribute name="rdf:about">
								<xsl:text>http://vocab.getty.edu/ulan/</xsl:text>
								<xsl:value-of select="@refid"/>
							</xsl:attribute>
					<rdf:type rdf:resource="http://purl.org/vra/Agent" />	
					<vra:name>
						<xsl:value-of select="vc:author"/>
					</vra:name>	
					</rdf:Description>	
					</vra:author>
				</rdf:Description>
				</vra:hasInscription>
			</xsl:when>
			<xsl:otherwise>
				<vra:hasInscription>
				<rdf:Description>
					<rdf:type rdf:resource="http://purl.org/vra/CreativeWork" />
					<rdf:type rdf:resource="http://purl.org/vra/Inscription" />
					<vra:position>
						<xsl:value-of select="vc:position"/>
					</vra:position>
					<vra:signiture>
						<xsl:value-of select="vc:signiture"/>
					</vra:signiture>
					<vra:text>
						<xsl:value-of select="vc:text"/>
					</vra:text>
					<vra:mark>
						<xsl:value-of select="vc:mark"/>
					</vra:mark>
					<vra:caption>
						<xsl:value-of select="vc:caption"/>
					</vra:caption>
					<vra:translation>
						<xsl:value-of select="vc:translation"/>
					</vra:translation>
					<vra:dateCreated>
						<xsl:value-of select="vc:date"/>
					</vra:dateCreated>
					<vra:author>
					<rdf:Description>
					<rdf:type rdf:resource="http://purl.org/vra/Agent" />	
					<vra:name>
						<xsl:value-of select="vc:author"/>
					</vra:name>	
					</rdf:Description>	
					</vra:author>
				</rdf:Description>
				</vra:hasInscription>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
<!-- WorkType template -->
	<xsl:template match="vc:worktypeSet" mode="workType">
		<xsl:apply-templates select="vc:worktype" mode="workType"/>
	</xsl:template>
	
	<xsl:template match="vc:worktype" mode="workType">
		<xsl:if test="@vocab = 'AAT' and @refid">
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:text>http://vocab.getty.edu/aat/</xsl:text>
					<xsl:value-of select="@refid"/>
				</xsl:attribute>
			</rdf:type>
		</xsl:if>
		<xsl:if test="@vocab = 'ULAN' and @refid">
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:text>http://vocab.getty.edu/ulan/</xsl:text>
					<xsl:value-of select="@refid"/>
				</xsl:attribute>
			</rdf:type>
		</xsl:if>
		<xsl:if test="@vocab = 'TGN' and @refid">
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:text>http://vocab.getty.edu/tgn/</xsl:text>
					<xsl:value-of select="@refid"/>
				</xsl:attribute>
			</rdf:type>
		</xsl:if>
		<xsl:if test="@vocab = 'LCSAF' and @refid">
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:text>http://id.loc.gov/authorities/subjects/</xsl:text>
					<xsl:value-of select="translate(@refid,' ','')"/>
				</xsl:attribute>
			</rdf:type>
		</xsl:if>
		<xsl:if test="@vocab = 'LCNAF' and @refid">
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:text>http://id.loc.gov/authorities/names/</xsl:text>
					<xsl:value-of select="translate(@refid,' ','')"/>
				</xsl:attribute>	
			</rdf:type>
		</xsl:if>
		<xsl:if test="@vocab = 'LCTGM' and @refid">
			<rdf:type>
				<xsl:attribute name="rdf:resource">
					<xsl:text>http://id.loc.gov/vocabulary/graphicMaterials/</xsl:text>
					<xsl:value-of select="translate(@refid,' ','')"/>
				</xsl:attribute>
			</rdf:type>
		</xsl:if>
	</xsl:template>
	
<!-- Catch remainder templates -->	
	<xsl:template match="*">
		<xsl:comment>
			<xsl:text>Skipping over </xsl:text>
			<xsl:value-of select="name()"/>
		</xsl:comment>
		<xsl:apply-templates />
	</xsl:template>
	
	<xsl:template match="@*|text()">
		<xsl:comment>
			<xsl:text>Skipping over </xsl:text>
			<xsl:value-of select="."/>
		</xsl:comment>
	</xsl:template>

</xsl:stylesheet>
