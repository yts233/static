<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
               xmlns:pg="https://static.yts233.tk/Templates/Schemas/Page.xsd"
               xmlns:h5="http://www.w3.org/1999/xhtml">
    <xsl:template match="pg:Page">
        <h5:html lang="{@Language}">
            <h5:head>
                <h5:title>
                    <xsl:value-of select="@Title"/>
                </h5:title>
                <h5:meta name="generator" content="https://static.yts233.tk/Templates"/>
                <xsl:apply-templates select="pg:Include/*"/>
            </h5:head>
            <h5:body>
                <h5:noscript>
                    <h5:center style="background:#000;color:#fff;">You seem to block javascript, and this page may not display
                        properly.
                    </h5:center>
                </h5:noscript>
                <xsl:apply-templates select="*[not(pg:Include|pg:Include//*)]"/>
            </h5:body>
        </h5:html>
    </xsl:template>
    <xsl:template match="pg:Script">
        <xsl:if test="@Src">
            <h5:script src="{@Src}" type="{@Type}"/>
        </xsl:if>
        <xsl:if test="not(@Src)">
            <h5:script lang="{@Type}">
                <xsl:value-of select="current()"/>
            </h5:script>
        </xsl:if>
    </xsl:template>
    <xsl:template match="pg:Style">
        <xsl:if test="@Href">
            <h5:link rel="stylesheet" type="{@Type}" href="{@Href}"/>
        </xsl:if>
        <xsl:if test="not(@Href)">
            <h5:style lang="{@Type}">
                <xsl:value-of select="current()"/>
            </h5:style>
        </xsl:if>
    </xsl:template>

</xsl:transform>