<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ar="https://static.yts233.tk/schemas/archiveIndex.xsd" version="1.0">
    <xsl:output method='html' version='1.0' encoding='UTF-8' indent='yes'/>
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Index of archives</title>
                <meta name="author" content="Ye_Tianshun"/>
            </head>
            <body>
                <h1>Index of archives</h1>
                <xsl:apply-templates/>
                <hr/>
                <footer>
                    <p><a href="https://studio.yts233.tk">YTS233 Studio</a>
                        Copyright 2021, All rights reserved.</p>
                </footer>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="ar:archives">
        <ul class="archiveList">
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    <xsl:template match="ar:archive">
        <li class="archiveInfo">
            <h2>
                <xsl:value-of select="ar:prime/ar:title"/>
            </h2>
            <p>Id:
                <xsl:value-of select="ar:id"/>
            </p>
            <p>Time:
                <xsl:value-of select="ar:time"/>
            </p>
            <p>Language:
                <xsl:value-of select="ar:prime/@lang"/>
            </p>
            <p>Status:
                <xsl:value-of select="ar:status"/>
            </p>
            <p>Description:
                <xsl:value-of select="ar:prime/ar:description"/>
            </p>
            <h3>Files</h3>
            <ul class="archiveFiles">
                <xsl:apply-templates select="ar:prime/ar:files"/>
            </ul>
            <h3>Translations</h3>
            <ul class="archiveTranslations">
                <xsl:apply-templates select="ar:translations"/>
            </ul>
        </li>
    </xsl:template>
    <xsl:template match="ar:translation">
        <li>
            <h4>
                <xsl:value-of select="@lang"/>
            </h4>
            <p>Title:
                <xsl:value-of select="ar:title"/>
            </p>
            <p>Description:
                <xsl:value-of select="ar:description"/>
            </p>
            <h5>Files</h5>
            <ul class="archiveFiles">
                <xsl:apply-templates select="ar:files"/>
            </ul>
        </li>
    </xsl:template>
    <xsl:template match="ar:file">
        <li class="archiveFile">
            <a href="{@ref}">
                <xsl:value-of select="@name"/>
            </a>
            |
            <xsl:value-of select="@time"/>
            |
            <xsl:value-of select="@type"/>
        </li>
    </xsl:template>
    <xsl:template match="ar:directory">
        <li class="archiveDirectory">
            <b>
                <xsl:value-of select="@name"/>
            </b>
            <ul class="archiveFiles">
                <xsl:apply-templates/>
            </ul>
        </li>
    </xsl:template>
</xsl:stylesheet>