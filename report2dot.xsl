<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- 
	  - XSLT Stylesheet that transforms Ivy dependency reports to .dot files
	  - that can be rendered using GraphViz (http://www.graphviz.org) or imported
	  - into OmniGraffle (http://www.omnigroup.com/applications/omnigraffle).
	  -->
	<xsl:output method="text" />

	<xsl:template match="ivy-report">
		digraph {
			rankdir = LR 
			node [shape=Mrecord, fontname = "Trebuchet MS", fontsize = 16, color = lightyellow3]
			edge [arrowhead = empty, color = olivedrab]
			<xsl:apply-templates select="info" />
			<xsl:apply-templates select="dependencies/module" />
			<xsl:apply-templates select="dependencies/module/revision/caller" />
		}
	</xsl:template>
	
	<xsl:template match="info">
		"<xsl:value-of select="@organisation" />-<xsl:value-of select="@module" />" [label = "<xsl:value-of select="@module" />"]
	</xsl:template>
	
	<xsl:template match="module">
		"<xsl:value-of select="@organisation" />-<xsl:value-of select="@name" />" [label = "<xsl:value-of select="@organisation" />\n<xsl:value-of select="@name" />"]
	</xsl:template>
	
	<xsl:template match="caller">
		"<xsl:value-of select="@organisation" />-<xsl:value-of select="@name" />" -> "<xsl:value-of select="../../@organisation" />-<xsl:value-of select="../../@name" />"
	</xsl:template>
	
</xsl:stylesheet>