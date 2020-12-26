<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ar="https://static.yts233.tk/schemas/archiveIndex.xsd" version="1.0">
    <xsl:output method='html' version='1.0' encoding='UTF-8' indent='yes'/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Index of archives</title>
            </head>
            <body>
                <h2>Index of archives</h2>
                <ul>
                    <xsl:for-each select="ar:archives/ar:archive">
                        <li>
                            <p><xsl:value-of select="ar:prime/ar:title"/> (aid=<xsl:value-of select="ar:id"/>)</p>
                        </li>
                    </xsl:for-each>
                </ul>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>