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
        <xsl:comment>Removed TypeOfVersionRefStructure@modification</xsl:comment>
    </xsl:template>
    <xsl:template match="/xsd:schema/xsd:attributeGroup[@name = 'BasicModificationDetailsGroup']/xsd:attribute[@name = 'modification']">
        <xsl:comment>Removed BasicModificationDetailsGroup@modification</xsl:comment>
    </xsl:template>
    <xsl:template match="/xsd:schema/xsd:attributeGroup[@name = 'DocumentModificationDetailsGroup']/xsd:attribute[@name = 'modification']">
        <xsl:comment>Removed DocumentModificationDetailsGroup@modification</xsl:comment>
    </xsl:template>
    <xsl:template
        match="/xsd:schema/xsd:element[@name = 'DisplayAssignment']/xsd:complexType/xsd:complexContent/xsd:restriction[@base = 'DisplayAssignment_VersionStructure']/xsd:attribute[@name = 'dataSourceRef']">
        <xsl:comment>Removed DisplayAssignment@dataSourceRef</xsl:comment>
    </xsl:template>
    
    <!-- derivedFromVersionRef attribute -->
    <xsl:template match="/xsd:schema/xsd:attributeGroup[@name = 'BasicModificationDetailsGroup']/xsd:attribute[@name = 'derivedFromVersionRef']">
        <xsl:comment>Removed VersionOfObjectRefStructure@derivedFromVersionRef</xsl:comment>
    </xsl:template>
    <xsl:template
        match="/xsd:schema/xsd:element[@name = 'DisplayAssignment']/xsd:complexType/xsd:complexContent/xsd:restriction[@base = 'DisplayAssignment_VersionStructure']/xsd:attribute[@name = 'derivedFromVersionRef']">
        <xsl:comment>Removed DisplayAssignment@derivedFromVersionRef</xsl:comment>
    </xsl:template>
    
    <!-- derivedFromObjectRef attribute -->
    <xsl:template match="/xsd:schema/xsd:attributeGroup[@name = 'BasicModificationDetailsGroup']/xsd:attribute[@name = 'derivedFromObjectRef']">
        <xsl:comment>Removed VersionOfObjectRefStructure@derivedFromObjectRef</xsl:comment>
    </xsl:template>
    <xsl:template
        match="/xsd:schema/xsd:element[@name = 'DisplayAssignment']/xsd:complexType/xsd:complexContent/xsd:restriction[@base = 'DisplayAssignment_VersionStructure']/xsd:attribute[@name = 'derivedFromObjectRef']">
        <xsl:comment>Removed DisplayAssignment@derivedFromObjectRef</xsl:comment>
    </xsl:template>
    
    
    <!-- compatibleWithVersionFrameVersionRef attribute -->
    <xsl:template match="/xsd:schema/xsd:attributeGroup[@name = 'BasicModificationDetailsGroup']/xsd:attribute[@name = 'compatibleWithVersionFrameVersionRef']">
        <xsl:comment>Removed VersionOfObjectRefStructure@compatibleWithVersionFrameVersionRef</xsl:comment>
    </xsl:template>
    <xsl:template
        match="/xsd:schema/xsd:element[@name = 'DisplayAssignment']/xsd:complexType/xsd:complexContent/xsd:restriction[@base = 'DisplayAssignment_VersionStructure']/xsd:attribute[@name = 'compatibleWithVersionFrameVersionRef']">
        <xsl:comment>Removed DisplayAssignment@compatibleWithVersionFrameVersionRef</xsl:comment>
    </xsl:template>
    
    <xsl:template match="/xsd:schema/xsd:complexType[@name = 'DataManagedObjectStructure']/xsd:complexContent/xsd:extension[@base = 'EntityInVersionStructure']/xsd:attribute[@name = 'responsibilitySetRef']">
        <xsl:comment>Removed DataManagedObjectStructure@responsibilitySetRef</xsl:comment>
    </xsl:template>
    
    
    
    <xsl:template match="//xsd:attribute[@name = 'nameOfClass']">
        <xsl:comment>Removed @nameOfClass</xsl:comment>
    </xsl:template>

</xsl:stylesheet>
