<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
               version="1.0"
               xmlns:mat="https://static.yts233.tk/Templates/Material/Schemas/Components.xsd"
               xmlns:h5="http://www.w3.org/1999/xhtml"
               xmlns:pg="https://static.yts233.tk/Templates/Schemas/Page.xsd">
    <xsl:template match="mat:Init">
        <h5:link rel="stylesheet" type="text/css"
                 href="http://localhost:63342/Blog.Static/Templates/Material/Styles/Components.css"/>
        <h5:script src="http://localhost:63342/Blog.Static/Templates/Material/Scripts/Material.js" type="text/javascript"/>
        <h5:script src="http://localhost:63342/Blog.Static/Material/Scripts/Components.js" type="text/javascript"/>
    </xsl:template>
    <xsl:template match="mat:Button">
        <xsl:variable name="class">
            <xsl:if test="@Variant">
                mdc-button--<xsl:value-of
                    select="translate(@Variant,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
            </xsl:if>
        </xsl:variable>
        <h5:button
                class="mdc-button {$class}">
            <h5:span class="mdc-button__ripple"/>
            <xsl:if test="@Icon">
                <h5:i class="material-icons mdc-button__icon">
                    <xsl:value-of select="@Icon"/>
                </h5:i>
            </xsl:if>
            <h5:span class="mdc-button__label">
                <xsl:value-of select="@Text"/>
                <xsl:value-of select="current()"/>
            </h5:span>
        </h5:button>
    </xsl:template>
</xsl:transform>