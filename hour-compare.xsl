<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" exclude-result-prefixes="xsl xs fn">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
	<xsl:template match="/">
		<xsl:variable name="CurrentHour" select="number(format-time(current-time(),'[H]'))"/>
		<Result>
			<xsl:if test="6>$CurrentHour or $CurrentHour>18">
				<xsl:value-of select="'True'"/>
			</xsl:if>
		</Result>
	</xsl:template>
</xsl:stylesheet>
