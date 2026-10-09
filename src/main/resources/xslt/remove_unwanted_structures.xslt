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
- compatible_with_version_frame_version_ref
- responsibility_set_ref
- branding_ref
- publication
        -->

    <!-- Ignores -->
    <xsl:template match="/xsd:schema/xsd:complexType[@name = 'EntityInVersionStructure']/xsd:complexContent/xsd:extension[@base = 'EntityStructure']/xsd:attribute[@name = 'dataSourceRef']"/> 

    <xsl:template
        match="/xsd:schema/xsd:element[@name = 'AlternativeName']/xsd:complexType/xsd:complexContent/xsd:restriction[@base = 'AlternativeName_VersionedChildStructure']/xsd:attribute[@name = 'dataSourceRef']"/>

    <!-- versionRef and modification attributes on reference structures. NeTEx 2.0 redeclares them in every restriction of
         VersionOfObjectRefStructure, so they are removed from all simple content types, except where they have always been
         kept (versionRef on TypeOfVersionRefStructure) -->
    <xsl:template match="//xsd:complexType[not(@name = 'TypeOfVersionRefStructure')]/xsd:simpleContent/*/xsd:attribute[@name = 'versionRef']"/>
    <xsl:template match="//xsd:complexType/xsd:simpleContent/*/xsd:attribute[@name = 'modification']"/>

    <!-- modification attribute -->
    <xsl:template match="/xsd:schema/xsd:attributeGroup[@name = 'BasicModificationDetailsGroup']/xsd:attribute[@name = 'modification']"/>
    <xsl:template match="/xsd:schema/xsd:attributeGroup[@name = 'DocumentModificationDetailsGroup']/xsd:attribute[@name = 'modification']"/>
    <xsl:template
        match="/xsd:schema/xsd:element[@name = 'DisplayAssignment']/xsd:complexType/xsd:complexContent/xsd:restriction[@base = 'DisplayAssignment_VersionStructure']/xsd:attribute[@name = 'dataSourceRef']"/>

    <!-- compatibleWithVersionFrameVersionRef attribute -->
    <xsl:template match="/xsd:schema/xsd:attributeGroup[@name = 'BasicModificationDetailsGroup']/xsd:attribute[@name = 'compatibleWithVersionFrameVersionRef']"/>
    <xsl:template
        match="/xsd:schema/xsd:element[@name = 'DisplayAssignment']/xsd:complexType/xsd:complexContent/xsd:restriction[@base = 'DisplayAssignment_VersionStructure']/xsd:attribute[@name = 'compatibleWithVersionFrameVersionRef']"/>

    <xsl:template match="/xsd:schema/xsd:attributeGroup[@name = 'BasicModificationDetailsGroup']/xsd:attribute[@name = 'publication']"/>


    <xsl:template match="//xsd:attribute[@name = 'nameOfClass']"/>

    <xsl:template match="//xsd:attribute[@name = 'nameOfRefClass']"/>

    <xsl:template match="//xsd:attribute[@name = 'nameOfMemberClass']"/>

    <!-- NameOfClass is an enumeration of all class names in NeTEx 2.0 (free text before). Keep it free text, as the enum is
         unused (fields are replaced with string) and pairs like 'Delta' and 'DeltaValue' break the generated Java (protoc adds a
         DELTA_VALUE int constant for DELTA) -->
    <xsl:template match="/xsd:schema/xsd:simpleType[@name = 'NameOfClass']/xsd:restriction/xsd:enumeration"/>

    <!-- NeTEx 2.0 has both e.g. 'planning' and 'Planning' in this enumeration, which give the same enum constant name. Keep
         the lower case variant (the only one before 2.0) -->
    <xsl:template
        match="/xsd:schema/xsd:simpleType[@name = 'StakeholderRoleTypeEnumeration']/xsd:restriction/xsd:enumeration
            [translate(substring(@value, 1, 1), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', '') = '']
            [../xsd:enumeration/@value = concat(translate(substring(current()/@value, 1, 1), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), substring(current()/@value, 2))]"/>

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

    <!-- ActivationMeans is a single ActivationMeansEnumeration in NeTEx 2.0.0,
         but was a list (ActivationMeansListOfEnumerations) before. Keep the list for now, so activation_means stays a
         repeated enum. Reversal was likely not intended, https://github.com/TransmodelEcosystem/NeTEx/pull/1085 attempts to change back to list again. -->
    <xsl:template match="/xsd:schema/xsd:group[@name = 'UsageValidityPeriodGroup']/xsd:sequence/xsd:element[@name = 'ActivationMeans']/@type">
        <xsl:attribute name="type">ActivationMeansListOfEnumerations</xsl:attribute>
    </xsl:template>


</xsl:stylesheet>
