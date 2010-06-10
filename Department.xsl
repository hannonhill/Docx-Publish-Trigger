<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:ve="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8" indent="yes" method="xml"/>
	<xsl:variable name="type">Word 2007</xsl:variable>
	<xsl:template match="/system-index-block">
		<xsl:apply-templates select="calling-page/system-page/system-data-structure"/>
	</xsl:template>

	
	<xsl:template match="p">
		<w:p>
			<w:pPr>
				<w:rPr>
					<w:sz w:val="20"/>
					<w:szCs w:val="20"/>
				</w:rPr>
			</w:pPr>
		
			<xsl:apply-templates mode="sub-text"/>
		</w:p>
	</xsl:template>
	
	<xsl:template match="b | em | text() | i | strong | br" mode="sub-text">
		<w:r>
			<w:rPr>
							<w:rFonts w:ascii="Arial" w:cs="Times New Roman" w:eastAsia="Times New Roman" w:hAnsi="Arial"/>
				<w:sz w:val="24"/>
				<w:szCs w:val="24"/>
				<xsl:if test="name() = 'b' or name() = 'strong'">
					<w:b/>
				</xsl:if>
				<xsl:if test="name() = 'i' or name() = 'em'">
					<w:i/>
				</xsl:if>
				<xsl:if test="name() = 'br'">
					<w:br/>
				</xsl:if>
			</w:rPr>
			<w:t xml:space="preserve"><xsl:value-of select="."/></w:t>
		</w:r>
	</xsl:template>
	

	<xsl:template match="system-data-structure">
	     <xsl:apply-templates select="faculty"/>
             <xsl:apply-templates select="deptinfo"/>
              <xsl:apply-templates select="sections"/>
	</xsl:template>

	<xsl:template match="faculty">
		<w:p>
			<w:pPr>
				<w:jc w:val="left"/>
				<w:rPr>
					<w:sz w:val="24"/>
					<w:szCs w:val="24"/>
				</w:rPr>
			</w:pPr>
			<w:r>
				<w:rPr>
					<w:rFonts w:ascii="Arial" w:cs="Arial" w:eastAsia="Times New Roman" w:hAnsi="Arial"/>
					<w:sz w:val="24"/>
					<w:szCs w:val="24"/>
				</w:rPr>
				<w:t><xsl:value-of select="facname"/></w:t>
			</w:r>
			<w:r>
				<w:rPr>
					<w:rFonts w:ascii="Arial" w:cs="Arial" w:eastAsia="Times New Roman" w:hAnsi="Arial"/>
					<w:sz w:val="24"/>
					<w:szCs w:val="24"/>
					<w:br/>
				</w:rPr>
				<w:t xml:space="preserve"/>
			</w:r>
			<w:r>
				<w:rPr>
					<w:rFonts w:ascii="Arial" w:cs="Arial" w:eastAsia="Times New Roman" w:hAnsi="Arial"/>
					<w:sz w:val="24"/>
					<w:szCs w:val="24"/>
				</w:rPr>
				<w:t><xsl:value-of select="facdesc"/></w:t>			
			</w:r>
			<w:r>
				<w:rPr>
					<w:rFonts w:ascii="Arial" w:cs="Arial" w:eastAsia="Times New Roman" w:hAnsi="Arial"/>
					<w:sz w:val="24"/>
					<w:szCs w:val="24"/>
					<w:br/>
				</w:rPr>
				<w:t xml:space="preserve"/>
			</w:r>
		</w:p>
	</xsl:template>

	<xsl:template match="deptinfo">
		<xsl:variable name="nodeContent" select="node()"/>
		<xsl:choose>
			<xsl:when test="count($nodeContent/p) > 0">
				<xsl:apply-templates select="node()"/>
			</xsl:when>
			<xsl:otherwise>
				<w:p>
					<w:pPr>
					<w:rPr>
						<w:sz w:val="20"/>
						<w:szCs w:val="20"/>
					</w:rPr>
					</w:pPr>
						<xsl:apply-templates mode="sub-text"/>
				</w:p>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="sections">
		<xsl:variable name="nodeContent" select="node()"/>
		<xsl:choose>
			<xsl:when test="count($nodeContent/p) > 0">
				<xsl:apply-templates select="node()"/>
			</xsl:when>
			<xsl:otherwise>
				<w:p>
					<w:pPr>
					<w:rPr>
						<w:sz w:val="20"/>
						<w:szCs w:val="20"/>
					</w:rPr>
					</w:pPr>
						<xsl:apply-templates mode="sub-text"/>
				</w:p>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>