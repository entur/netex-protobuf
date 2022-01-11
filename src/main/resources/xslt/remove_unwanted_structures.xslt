<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:n="http://www.netex.org.uk/netex" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
>
    <xsl:template match="@*|*|processing-instruction()|comment()">
        <xsl:copy>
            <xsl:apply-templates select="*|@*|text()|processing-instruction()|comment()"/>
        </xsl:copy>
    </xsl:template>

    <!-- Ignores -->
    <xsl:template match="/xsd:schema/xsd:complexType[@name='EntityInVersionStructure']/xsd:complexContent/xsd:extension[@base='EntityStructure']/xsd:attribute[@name='dataSourceRef']">
        <xsl:comment>Removed EntityInVersionStructure@dataSourceRef</xsl:comment>
    </xsl:template>
    
    <xsl:template match="/xsd:schema/xsd:complexType[@name='VersionOfObjectRefStructure']/xsd:simpleContent/xsd:extension[@base='ObjectIdType']/xsd:attribute[@name='versionRef']">
        <xsl:comment>Removed VersionOfObjectRefStructure@versionRef</xsl:comment>
    </xsl:template>
    
</xsl:stylesheet>


