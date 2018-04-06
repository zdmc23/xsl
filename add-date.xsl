<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:ns1="http://www.ns1.com" exclude-result-prefixes="xsl xs fn ns1">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
	<xsl:template match="/">
		<xsl:variable name="ProjApptDate" select="'2014/09/03'"/>
		<Result>
			<xsl:value-of select="xs:date(ns1:formatDate($ProjApptDate))+xs:dayTimeDuration('P2D')"/>
		</Result>
	</xsl:template>
	<xsl:function name="ns1:formatDate" as="xs:string">
		<xsl:param name="Date"/>
		<xsl:choose>
			<!-- 03/28/2014 00:00 and 2014-01-17 12:00:00 AM -->
			<xsl:when test="contains($Date,' ')">
				<xsl:value-of select="ns1:formatDate(substring-before($Date,' '))"/>
			</xsl:when>
			<!-- 202014-01-09 -->
			<xsl:when test="matches(translate($Date,' ',''),'\d{6}-\d{2}-\d{2}')">
				<xsl:variable name="Tokens" select="tokenize($Date,'-')"/>
				<xsl:value-of select="concat(substring-after($Tokens[1],'20'),'-',$Tokens[2],'-',$Tokens[3])"/>
			</xsl:when>
			<!-- 2014-01-09 -->
			<xsl:when test="matches($Date,'[0-9]{4}-[0-9]{2}-[0-9]{2}')">
				<xsl:variable name="Tokens" select="tokenize($Date,'-')"/>
				<xsl:value-of select="concat($Tokens[1],'-',$Tokens[2],'-',$Tokens[3])"/>
			</xsl:when>
			<!-- 2014-01-9 -->
			<xsl:when test="matches($Date,'[0-9]{4}-[0-9]{2}-[0-9]{1}')">
				<xsl:variable name="Tokens" select="tokenize($Date,'-')"/>
				<xsl:value-of select="concat($Tokens[1],'-',$Tokens[2],'-','0',$Tokens[3])"/>
			</xsl:when>
			<!-- 2014-1-09 -->
			<xsl:when test="matches($Date,'[0-9]{4}-[0-9]{1}-[0-9]{2}')">
				<xsl:variable name="Tokens" select="tokenize($Date,'-')"/>
				<xsl:value-of select="concat($Tokens[1],'-','0',$Tokens[2],'-',$Tokens[3])"/>
			</xsl:when>
			<!-- 2014-1-9 -->
			<xsl:when test="matches($Date,'[0-9]{4}-[0-9]{1}-[0-9]{1}')">
				<xsl:variable name="Tokens" select="tokenize($Date,'-')"/>
				<xsl:value-of select="concat($Tokens[1],'-','0',$Tokens[2],'-','0',$Tokens[3])"/>
			</xsl:when>
			<!-- 2014/01/09 -->
			<xsl:when test="matches($Date,'[0-9]{4}/[0-9]{2}/[0-9]{2}')">
				<xsl:variable name="Tokens" select="tokenize($Date,'/')"/>
				<xsl:value-of select="concat($Tokens[1],'-',$Tokens[2],'-',$Tokens[3])"/>
			</xsl:when>
			<!-- 2014/01/9 -->
			<xsl:when test="matches($Date,'[0-9]{4}/[0-9]{2}/[0-9]{1}')">
				<xsl:variable name="Tokens" select="tokenize($Date,'/')"/>
				<xsl:value-of select="concat($Tokens[1],'-',$Tokens[2],'-','0',$Tokens[3])"/>
			</xsl:when>
			<!-- 2014/1/09 -->
			<xsl:when test="matches($Date,'[0-9]{4}/[0-9]{1}/[0-9]{2}')">
				<xsl:variable name="Tokens" select="tokenize($Date,'/')"/>
				<xsl:value-of select="concat($Tokens[1],'-','0',$Tokens[2],'-',$Tokens[3])"/>
			</xsl:when>
			<!-- 2014/1/9 -->
			<xsl:when test="matches($Date,'[0-9]{4}/[0-9]{1}/[0-9]{1}')">
				<xsl:variable name="Tokens" select="tokenize($Date,'/')"/>
				<xsl:value-of select="concat($Tokens[1],'-','0',$Tokens[2],'-','0',$Tokens[3])"/>
			</xsl:when>
			<!-- 01-09-2014 -->
			<xsl:when test="matches($Date,'[0-9]{2}-[0-9]{2}-[0-9]{4}')">
				<xsl:variable name="Tokens" select="tokenize($Date,'-')"/>
				<xsl:value-of select="concat($Tokens[3],'-',$Tokens[1],'-',$Tokens[2])"/>
			</xsl:when>
			<!-- 01-9-2014 -->
			<xsl:when test="matches($Date,'[0-9]{2}-[0-9]{1}-[0-9]{4}')">
				<xsl:variable name="Tokens" select="tokenize($Date,'-')"/>
				<xsl:value-of select="concat($Tokens[3],'-',$Tokens[1],'-','0',$Tokens[2])"/>
			</xsl:when>
			<!-- 1-09-2014 -->
			<xsl:when test="matches($Date,'[0-9]{1}-[0-9]{2}-[0-9]{4}')">
				<xsl:variable name="Tokens" select="tokenize($Date,'-')"/>
				<xsl:value-of select="concat($Tokens[3],'-','0',$Tokens[1],'-',$Tokens[2])"/>
			</xsl:when>
			<!-- 1-9-2014 -->
			<xsl:when test="matches($Date,'[0-9]{1}-[0-9]{1}-[0-9]{4}')">
				<xsl:variable name="Tokens" select="tokenize($Date,'-')"/>
				<xsl:value-of select="concat($Tokens[3],'-','0',$Tokens[1],'-','0',$Tokens[2])"/>
			</xsl:when>
			<!-- 01/09/2014 -->
			<xsl:when test="matches($Date,'[0-9]{2}/[0-9]{2}/[0-9]{4}')">
				<xsl:variable name="Tokens" select="tokenize($Date,'/')"/>
				<xsl:value-of select="concat($Tokens[3],'-',$Tokens[1],'-',$Tokens[2])"/>
			</xsl:when>
			<!-- 01/9/2014 -->
			<xsl:when test="matches($Date,'[0-9]{2}/[0-9]{1}/[0-9]{4}')">
				<xsl:variable name="Tokens" select="tokenize($Date,'/')"/>
				<xsl:value-of select="concat($Tokens[3],'-',$Tokens[1],'-','0',$Tokens[2])"/>
			</xsl:when>
			<!-- 1/09/2014 -->
			<xsl:when test="matches($Date,'[0-9]{1}/[0-9]{2}/[0-9]{4}')">
				<xsl:variable name="Tokens" select="tokenize($Date,'/')"/>
				<xsl:value-of select="concat($Tokens[3],'-','0',$Tokens[1],'-',$Tokens[2])"/>
			</xsl:when>
			<!-- 1/9/2014 -->
			<xsl:when test="matches($Date,'[0-9]{1}/[0-9]{1}/[0-9]{4}')">
				<xsl:variable name="Tokens" select="tokenize($Date,'/')"/>
				<xsl:value-of select="concat($Tokens[3],'-','0',$Tokens[1],'-','0',$Tokens[2])"/>
			</xsl:when>
			<!-- 01-09-14 -->
			<xsl:when test="matches($Date,'[0-9]{2}-[0-9]{2}-[0-9]{2}')">
				<xsl:variable name="Tokens" select="tokenize($Date,'-')"/>
				<xsl:value-of select="concat('20',$Tokens[3],'-',$Tokens[1],'-',$Tokens[2])"/>
			</xsl:when>
			<!-- 01-9-14 -->
			<xsl:when test="matches($Date,'[0-9]{2}-[0-9]{1}-[0-9]{2}')">
				<xsl:variable name="Tokens" select="tokenize($Date,'-')"/>
				<xsl:value-of select="concat('20',$Tokens[3],'-',$Tokens[1],'-','0',$Tokens[2])"/>
			</xsl:when>
			<!-- 1-09-14 -->
			<xsl:when test="matches($Date,'[0-9]{1}-[0-9]{2}-[0-9]{2}')">
				<xsl:variable name="Tokens" select="tokenize($Date,'-')"/>
				<xsl:value-of select="concat('20',$Tokens[3],'-','0',$Tokens[1],'-',$Tokens[2])"/>
			</xsl:when>
			<!-- 1-9-14 -->
			<xsl:when test="matches($Date,'[0-9]{1}-[0-9]{1}-[0-9]{2}')">
				<xsl:variable name="Tokens" select="tokenize($Date,'-')"/>
				<xsl:value-of select="concat('20',$Tokens[3],'-','0',$Tokens[1],'-','0',$Tokens[2])"/>
			</xsl:when>
			<!-- 01/09/14 -->
			<xsl:when test="matches($Date,'[0-9]{2}/[0-9]{2}/[0-9]{2}')">
				<xsl:variable name="Tokens" select="tokenize($Date,'/')"/>
				<xsl:value-of select="concat('20',$Tokens[3],'-',$Tokens[1],'-',$Tokens[2])"/>
			</xsl:when>
			<!-- 01/9/14 -->
			<xsl:when test="matches($Date,'[0-9]{2}/[0-9]{1}/[0-9]{2}')">
				<xsl:variable name="Tokens" select="tokenize($Date,'/')"/>
				<xsl:value-of select="concat('20',$Tokens[3],'-',$Tokens[1],'-','0',$Tokens[2])"/>
			</xsl:when>
			<!-- 1/09/14 -->
			<xsl:when test="matches($Date,'[0-9]{1}/[0-9]{2}/[0-9]{2}')">
				<xsl:variable name="Tokens" select="tokenize($Date,'/')"/>
				<xsl:value-of select="concat('20',$Tokens[3],'-','0',$Tokens[1],'-',$Tokens[2])"/>
			</xsl:when>
			<!-- 1/9/14 -->
			<xsl:when test="matches($Date,'[0-9]{1}/[0-9]{1}/[0-9]{2}')">
				<xsl:variable name="Tokens" select="tokenize($Date,'/')"/>
				<xsl:value-of select="concat('20',$Tokens[3],'-','0',$Tokens[1],'-','0',$Tokens[2])"/>
			</xsl:when>
			<xsl:when test="$Date castable as xs:date">
				<xsl:value-of select="$Date"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$Date"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>
</xsl:stylesheet>
