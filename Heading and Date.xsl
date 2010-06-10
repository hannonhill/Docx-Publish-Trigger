<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet extension-element-prefixes="date-converter" version="1.0" xmlns:date-converter="http://www.hannonhill.com/dateConverter/1.0/" xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:ve="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" xmlns:xalan="http://xml.apache.org/xalan" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8" indent="yes" method="xml"/>
	
	<xsl:template match="/system-index-block">
		<xsl:apply-templates select="calling-page/system-page"/>
	</xsl:template>
	
	<xsl:template match="system-page">
		<w:p w:rsidR="00DF264B" w:rsidRDefault="005D4BAA" w:rsidRPr="00DF264B">
			<w:pPr>
				<w:rPr>
					<w:sz w:val="20"/>
					<w:szCs w:val="20"/>
				</w:rPr>
			</w:pPr>
			<w:r w:rsidR="00D126A5">
				<w:rPr>
					<w:sz w:val="20"/>
					<w:szCs w:val="20"/>
				</w:rPr>
				<w:t><xsl:value-of select="date-converter:convertDate(number(start-date))"/></w:t>
			</w:r>
		</w:p>
	</xsl:template>
	
	<!-- Xalan component for date conversion from CMS date format to RSS 2.0 pubDate format -->
	<xalan:component functions="convertDate" prefix="date-converter">
		<xalan:script lang="javascript">
			function convertDate(date)
			{
				var d = new Date(date); // Splits date into components 
				var temp = d.toString().split(' '); // timezone difference to GMT 
				var timezone = temp[5].substring(3); // RSS 2.0 valid pubDate format 
				var retString = temp[1] + ' ' + temp[2] + ', ' + temp[3];
				
				return retString;
			}</xalan:script>
	</xalan:component>
	
</xsl:stylesheet>