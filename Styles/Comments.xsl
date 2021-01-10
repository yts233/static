<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                xmlns:h5="http://www.w3.org/1999/xhtml"
                xmlns:cos="https://static.yts233.tk/Schemas/Comments.xsd"
                xmlns:co="https://static.yts233.tk/Schemas/Comment.xsd"
                xmlns:usr="https://static.yts233.tk/Schemas/User.xsd">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="cos:comments">
        <h5:html lang="en-US">
            <h5:head>
                <h5:meta charset="UTF-8"/>
                <h5:title>Comments</h5:title>
            </h5:head>
            <h5:body>
                <h1>Comments:</h1>
                <ul class="commentItems">
                    <xsl:apply-templates select="cos:items/co:comment"/>
                </ul>
            </h5:body>
        </h5:html>
    </xsl:template>
    <xsl:template match="co:comment">
        <h5:li class="commentItem">
            <h5:a class="userName" href="https://yts233.tk/users/{co:user/usr:id}">
                <xsl:value-of select="co:user/usr:name"/>
            </h5:a>
            at
            <h5:span class="commentTime">
                <xsl:value-of select="co:time"/>
            </h5:span>
            <h5:p class="commentContent">
                <xsl:value-of select="co:content"/>
            </h5:p>
            <xsl:if test="co:replies/co:reply">
                <h5:ul class="commentReplies">
                    <xsl:apply-templates select="co:replies/co:reply"/>
                </h5:ul>
            </xsl:if>
        </h5:li>
    </xsl:template>
    <xsl:template match="co:reply">
        <h5:li class="commentReply">
            <h5:a class="userName" href="https://yts233.tk/users/{co:user/usr:id}">
                <xsl:value-of select="co:user/usr:name"/>
            </h5:a>
            at
            <h5:span class="commentTime">
                <xsl:value-of select="co:time"/>
            </h5:span>
            <h5:p class="commentContent">
                <xsl:value-of select="co:content"/>
            </h5:p>
            <xsl:if test="co:replies/co:reply">
                <h5:ul class="commentReplies">
                    <xsl:apply-templates select="co:replies/co:reply"/>
                </h5:ul>
            </xsl:if>
        </h5:li>
    </xsl:template>
</xsl:stylesheet>