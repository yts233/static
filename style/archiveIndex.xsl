<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ar="https://static.yts233.tk/schemas/archiveIndex.xsd" version="1.0"
                xmlns:h5="http://www.w3.org/1999/xhtml">
    <xsl:output method='html' version='1.0' encoding='UTF-8' indent='yes'/>
    <xsl:template match="/">
        <h5:html>
            <h5:head>
                <h5:meta charset="UTF-8"/>
                <h5:title>Index of archives</h5:title>
                <h5:meta name="author" content="Ye_Tianshun"/>
            </h5:head>
            <h5:body>
                <h5:h1>Index of archives</h5:h1>
                <xsl:apply-templates/>
                <h5:hr/>
                <h5:footer>
                    <h5:p>
                        <h5:a href="https://studio.yts233.tk">YTS233 Studio</h5:a>
                        Copyright 2021, All rights reserved.
                    </h5:p>
                </h5:footer>
            </h5:body>
        </h5:html>
    </xsl:template>
    <xsl:template match="ar:archives">
        <h5:ul class="archiveList">
            <xsl:apply-templates/>
        </h5:ul>
    </xsl:template>
    <xsl:template match="ar:archive">
        <h5:li class="archiveInfo">
            <h5:h2>
                <xsl:value-of select="ar:prime/ar:title"/>
            </h5:h2>
            <h5:p>Id:
                <xsl:value-of select="ar:id"/>
            </h5:p>
            <h5:p>Time:
                <xsl:value-of select="ar:time"/>
            </h5:p>
            <h5:p>Language:
                <xsl:value-of select="ar:prime/@lang"/>
            </h5:p>
            <h5:p>Status:
                <xsl:value-of select="ar:status"/>
            </h5:p>
            <h5:p>Description:
                <xsl:value-of select="ar:prime/ar:description"/>
            </h5:p>
            <h5:h3>Files</h5:h3>
            <h5:ul class="archiveFiles">
                <xsl:apply-templates select="ar:prime/ar:files"/>
            </h5:ul>
            <h5:h3>Translations</h5:h3>
            <h5:ul class="archiveTranslations">
                <xsl:apply-templates select="ar:translations"/>
            </h5:ul>
        </h5:li>
    </xsl:template>
    <xsl:template match="ar:translation">
        <h5:li>
            <h5:h4>
                <xsl:value-of select="@lang"/>
            </h5:h4>
            <h5:p>Title:
                <xsl:value-of select="ar:title"/>
            </h5:p>
            <h5:p>Description:
                <xsl:value-of select="ar:description"/>
            </h5:p>
            <h5:h5>Files</h5:h5>
            <h5:ul class="archiveFiles">
                <xsl:apply-templates select="ar:files"/>
            </h5:ul>
        </h5:li>
    </xsl:template>
    <xsl:template match="ar:file">
        <h5:li class="archiveFile">
            <h5:a href="{@ref}">
                <xsl:value-of select="@name"/>
            </h5:a>
            |
            <xsl:value-of select="@time"/>
            |
            <xsl:value-of select="@type"/>
        </h5:li>
    </xsl:template>
    <xsl:template match="ar:directory">
        <h5:li class="archiveDirectory">
            <h5:b>
                <xsl:value-of select="@name"/>
            </h5:b>
            <h5:ul class="archiveFiles">
                <xsl:apply-templates/>
            </h5:ul>
        </h5:li>
    </xsl:template>
</xsl:stylesheet>