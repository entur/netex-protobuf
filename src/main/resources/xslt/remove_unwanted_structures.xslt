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
    <xsl:template match="/xsd:schema/xsd:complexType[@name = 'EntityInVersionStructure']/xsd:complexContent/xsd:extension[@base = 'EntityStructure']/xsd:attribute[@name = 'dataSourceRef']"/> 

    <xsl:template
        match="/xsd:schema/xsd:element[@name = 'AlternativeName']/xsd:complexType/xsd:complexContent/xsd:restriction[@base = 'AlternativeName_VersionedChildStructure']/xsd:attribute[@name = 'dataSourceRef']"/>

    <xsl:template match="/xsd:schema/xsd:complexType[@name = 'VersionOfObjectRefStructure']/xsd:simpleContent/xsd:extension[@base = 'ObjectIdType']/xsd:attribute[@name = 'versionRef']"/>


    <!-- modification attribute -->
    <xsl:template match="/xsd:schema/xsd:complexType[@name = 'VersionOfObjectRefStructure']/xsd:simpleContent/xsd:extension[@base = 'ObjectIdType']/xsd:attribute[@name = 'modification']"/>
    <xsl:template match="/xsd:schema/xsd:complexType[@name = 'TypeOfVersionRefStructure']/xsd:simpleContent/xsd:extension[@base = 'ObjectIdType']/xsd:attribute[@name = 'modification']"/>
    <xsl:template match="/xsd:schema/xsd:attributeGroup[@name = 'BasicModificationDetailsGroup']/xsd:attribute[@name = 'modification']"/>
    <xsl:template match="/xsd:schema/xsd:attributeGroup[@name = 'DocumentModificationDetailsGroup']/xsd:attribute[@name = 'modification']"/>
    <xsl:template
        match="/xsd:schema/xsd:element[@name = 'DisplayAssignment']/xsd:complexType/xsd:complexContent/xsd:restriction[@base = 'DisplayAssignment_VersionStructure']/xsd:attribute[@name = 'dataSourceRef']"/>

    <!-- derivedFromVersionRef attribute -->
    <xsl:template match="/xsd:schema/xsd:attributeGroup[@name = 'BasicModificationDetailsGroup']/xsd:attribute[@name = 'derivedFromVersionRef']"/>
    <xsl:template
        match="/xsd:schema/xsd:element[@name = 'DisplayAssignment']/xsd:complexType/xsd:complexContent/xsd:restriction[@base = 'DisplayAssignment_VersionStructure']/xsd:attribute[@name = 'derivedFromVersionRef']"/>

    <!-- derivedFromObjectRef attribute -->
    <xsl:template match="/xsd:schema/xsd:attributeGroup[@name = 'BasicModificationDetailsGroup']/xsd:attribute[@name = 'derivedFromObjectRef']"/>
    <xsl:template
        match="/xsd:schema/xsd:element[@name = 'DisplayAssignment']/xsd:complexType/xsd:complexContent/xsd:restriction[@base = 'DisplayAssignment_VersionStructure']/xsd:attribute[@name = 'derivedFromObjectRef']"/>


    <!-- compatibleWithVersionFrameVersionRef attribute -->
    <xsl:template match="/xsd:schema/xsd:attributeGroup[@name = 'BasicModificationDetailsGroup']/xsd:attribute[@name = 'compatibleWithVersionFrameVersionRef']"/>
    <xsl:template
        match="/xsd:schema/xsd:element[@name = 'DisplayAssignment']/xsd:complexType/xsd:complexContent/xsd:restriction[@base = 'DisplayAssignment_VersionStructure']/xsd:attribute[@name = 'compatibleWithVersionFrameVersionRef']"/>

    <xsl:template
        match="/xsd:schema/xsd:complexType[@name = 'DataManagedObjectStructure']/xsd:complexContent/xsd:extension[@base = 'EntityInVersionStructure']/xsd:attribute[@name = 'responsibilitySetRef']"/>

    <xsl:template match="/xsd:schema/xsd:attributeGroup[@name = 'BasicModificationDetailsGroup']/xsd:attribute[@name = 'publication']"/>


    <xsl:template match="//xsd:attribute[@name = 'nameOfClass']"/>

    <xsl:template match="//xsd:attribute[@name = 'nameOfRefClass']"/>

    <xsl:template match="//xsd:attribute[@name = 'nameOfMemberClass']"/>

    <!-- Only support embedded CPP prices, not relations -->
    <xsl:template match="/xsd:schema/xsd:complexType[@name = 'customerPurchasePackagePrices_RelStructure']/xsd:complexContent/xsd:extension[@base = 'strictContainmentAggregationStructure']">
        <xsd:extension base="strictContainmentAggregationStructure">
            <xsd:sequence maxOccurs="unbounded">
                <xsd:element name="CustomerPurchasePackagePrice" type="CustomerPurchasePackagePrice_VersionedChildStructure">
                    <xsd:annotation>
                        <xsd:documentation>A set of all possible price features of a CUSTOMER PURCHASE PACKAGE ELEMENT: default total price, discount in value or percentage etc.</xsd:documentation>
                    </xsd:annotation>
                </xsd:element>
            </xsd:sequence>
        </xsd:extension>
    </xsl:template>

    <!-- Fare price -->
    <xsl:template match="/xsd:schema/xsd:group[@name = 'FarePriceGroup']/xsd:sequence/xsd:element[@name = 'Name']"/>
    <xsl:template match="/xsd:schema/xsd:group[@name = 'FarePriceGroup']/xsd:sequence/xsd:element[@name = 'Description']"/>
    <xsl:template match="/xsd:schema/xsd:group[@name = 'FarePriceGroup']/xsd:sequence/xsd:element[@ref = 'PrivateCode']"/>
    <xsl:template match="/xsd:schema/xsd:group[@name = 'FarePriceGroup']/xsd:sequence/xsd:element[@name = 'StartDate']"/>
    <xsl:template match="/xsd:schema/xsd:group[@name = 'FarePriceGroup']/xsd:sequence/xsd:element[@name = 'EndDate']"/>
    <xsl:template match="/xsd:schema/xsd:group[@name = 'FarePriceGroup']/xsd:sequence/xsd:element[@name = 'FarePriceAmountWithDerivationGroup']"/>
    <xsl:template match="/xsd:schema/xsd:group[@name = 'FarePriceGroup']/xsd:sequence/xsd:element[@name = 'IsAllowed']"/>
    <xsl:template match="/xsd:schema/xsd:group[@name = 'FarePriceGroup']/xsd:sequence/xsd:element[@name = 'PricingServiceRef']"/>
    <xsl:template match="/xsd:schema/xsd:group[@name = 'FarePriceGroup']/xsd:sequence/xsd:element[@name = 'Ranking']"/>
    
    <!-- Remove pricing details from most objects -->
    <xsl:template match="/xsd:schema/xsd:group[@name = 'PriceableObjectGroup']/xsd:sequence/xsd:group[@ref = 'PriceableObjectPricingGroup']"/>
    <xsl:template match="/xsd:schema/xsd:group[@name = 'PriceableObjectGroup']/xsd:sequence/xsd:group[@ref = 'PriceableObjectPricesGroup']"/>
    
</xsl:stylesheet>
