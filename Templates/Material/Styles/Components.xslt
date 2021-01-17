<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
               version="1.0"
               xmlns:mat="https://static.yts233.tk/Templates/Material/Schemas/Components.xsd"
               xmlns:h5="http://www.w3.org/1999/xhtml"
               xmlns:pg="https://static.yts233.tk/Templates/Schemas/Page.xsd">
    <xsl:import href="../../Styles/Page.xslt"/>
    <xsl:template match="mat:Init">
        <h5:link rel="stylesheet" type="text/css" href="../Scripts/Material.js"/>
        <h5:script type="text/javascript" src="../Scripts/Material.js"/>
    </xsl:template>
    <xsl:template match="mat:Button">
        <h5:button class="mdc-button">
            <h5:span class="mdc-button__ripple"/>
            <xsl:value-of select="."/>
        </h5:button>
    </xsl:template>
</xsl:transform>