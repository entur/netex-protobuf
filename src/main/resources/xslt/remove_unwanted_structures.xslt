<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:n="http://www.netex.org.uk/netex" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <xsl:template match="@* | * | processing-instruction() | comment()">
        <xsl:copy>
            <xsl:apply-templates select="* | @* | text() | processing-instruction() | comment()"/>
        </xsl:copy>
    </xsl:template>


    <!--
        
        - version_ref
- name_of_class
- data_source_ref
- data_managed_object_ref
- modification
- derived_from_version_ref
- compatible_with_version_frame_version_ref
- responsibility_set_ref
- derived_from_object_ref
- branding_ref
- publication
        -->

    <!-- Ignores -->
    <xsl:template match="/xsd:schema/xsd:complexType[@name = 'EntityInVersionStructure']/xsd:complexContent/xsd:extension[@base = 'EntityStructure']/xsd:attribute[@name = 'dataSourceRef']">
        <xsl:comment>Removed EntityInVersionStructure@dataSourceRef</xsl:comment>
    </xsl:template>

    <xsl:template
        match="/xsd:schema/xsd:element[@name = 'AlternativeName']/xsd:complexType/xsd:complexContent/xsd:restriction[@base = 'AlternativeName_VersionedChildStructure']/xsd:attribute[@name = 'dataSourceRef']">
        <xsl:comment>Removed EntityInVersionStructure@dataSourceRef</xsl:comment>
    </xsl:template>

    <xsl:template match="/xsd:schema/xsd:complexType[@name = 'VersionOfObjectRefStructure']/xsd:simpleContent/xsd:extension[@base = 'ObjectIdType']/xsd:attribute[@name = 'versionRef']">
        <xsl:comment>Removed VersionOfObjectRefStructure@versionRef</xsl:comment>
    </xsl:template>
    
    
    <!-- modification attribute -->
    <xsl:template match="/xsd:schema/xsd:complexType[@name = 'VersionOfObjectRefStructure']/xsd:simpleContent/xsd:extension[@base = 'ObjectIdType']/xsd:attribute[@name = 'modification']">
        <xsl:comment>Removed VersionOfObjectRefStructure@modification</xsl:comment>
    </xsl:template>
    <xsl:template match="/xsd:schema/xsd:complexType[@name = 'TypeOfVersionRefStructure']/xsd:simpleContent/xsd:extension[@base = 'ObjectIdType']/xsd:attribute[@name = 'modification']">
        <xsl:comment>Removed VersionOfObjectRefStructure@modification</xsl:comment>
    </xsl:template>
    <xsl:template match="/xsd:schema/xsd:attributeGroup[@name = 'BasicModificationDetailsGroup']/xsd:attribute[@name = 'modification']">
        <xsl:comment>Removed VersionOfObjectRefStructure@modification</xsl:comment>
    </xsl:template>
    <xsl:template match="/xsd:schema/xsd:attributeGroup[@name = 'DocumentModificationDetailsGroup']/xsd:attribute[@name = 'modification']">
        <xsl:comment>Removed VersionOfObjectRefStructure@modification</xsl:comment>
    </xsl:template>
    <xsl:template
        match="/xsd:schema/xsd:element[@name = 'DisplayAssignment']/xsd:complexType/xsd:complexContent/xsd:restriction[@base = 'DisplayAssignment_VersionStructure']/xsd:attribute[@name = 'dataSourceRef']">
        <xsl:comment>Removed EntityInVersionStructure@dataSourceRef</xsl:comment>
    </xsl:template>
    
    
    
    <xsl:template match="//xsd:attribute[@name = 'nameOfClass']">
        <xsl:comment>Removed @nameOfClass</xsl:comment>
    </xsl:template>

</xsl:stylesheet>
