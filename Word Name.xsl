<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8" indent="yes" method="xml" version="1.0"/>
	<xsl:template match="/system-index-block">
		<xsl:value-of select="calling-page/system-page/display-name"/>
	</xsl:template>
</xsl:stylesheet>