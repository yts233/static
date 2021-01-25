<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
               version="1.0"
               xmlns:mat="https://static.yts233.tk/Templates/Material/Schemas/Components.xsd"
               xmlns:h5="http://www.w3.org/1999/xhtml"
               xmlns:svg="http://www.w3.org/2000/svg">
    <xsl:template match="mat:Init">
        <h5:link rel="stylesheet" type="text/css"
                 href="/Blog.Static/Templates/Material/Styles/Components.css"/>
        <h5:script src="/Blog.Static/Templates/Material/Scripts/Material.js" type="text/javascript"/>
        <h5:script src="/Blog.Static/Templates/Material/Scripts/Components.js" type="text/javascript"/>
    </xsl:template>
    <xsl:template match="mat:Button">
        <xsl:variable name="classes">
            <xsl:if test="@ClassName">
                <xsl:value-of select="@ClassName"/>
            </xsl:if>
            mdc-button
            <xsl:if test="@Variant='Outlined'">
                mdc-button--outlined
            </xsl:if>
            <xsl:if test="@Variant='Raised'">
                mdc-button--raised
            </xsl:if>
            <xsl:if test="@Variant='Unelevated'">
                mdc-button--unelevated
            </xsl:if>
        </xsl:variable>
        <h5:button
                class="{$classes}">
            <xsl:if test="@Id">
                <xsl:attribute name="id">
                    <xsl:value-of select="@Id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@Disabled='True'">
                <xsl:attribute name="disabled"/>
            </xsl:if>
            <h5:span class="mdc-button__ripple"/>
            <xsl:if test="@Icon">
                <xsl:call-template name="IconContentBaseTemplate"/>
            </xsl:if>
            <h5:span class="mdc-button__label">
                <xsl:call-template name="TextContentBaseTemplate"/>
            </h5:span>
        </h5:button>
    </xsl:template>
    <xsl:template match="mat:Icon">
        <xsl:call-template name="IconContentBaseTemplate"/>
    </xsl:template>
    <xsl:template match="mat:Checkbox">
        <h5:div class="mdc-form-field">
            <xsl:variable name="classes">
                mdc-checkbox
                <xsl:if test="@Disabled='True'">
                    mdc-checkbox--disabled
                </xsl:if>
            </xsl:variable>
            <h5:div class="mdc-checkbox" id="{@Id}">
                <xsl:variable name="indeterminate">
                    <xsl:if test="@Status='Indeterminate'">true</xsl:if>
                </xsl:variable>
                <h5:input type="checkbox"
                          class="mdc-checkbox__native-control"
                          id="{@Id}-checkbox"
                          data-indeterminate="{$indeterminate}"/>
                <h5:div class="mdc-checkbox__background">
                    <svg:svg class="mdc-checkbox__checkmark" version="1.2"
                             viewBox="0 0 24 24">
                        <svg:path class="mdc-checkbox__checkmark-path"
                                  fill="none"
                                  d="M1.73,12.91 8.1,19.28 22.79,4.59"/>
                    </svg:svg>
                    <h5:div class="mdc-checkbox__mixedmark"/>
                </h5:div>
                <h5:div class="mdc-checkbox__ripple"/>
            </h5:div>
            <xsl:if test="@Text|current()!=''">
                <h5:label for="{@Id}-checkbox" id="{@Id}-label">
                    <xsl:call-template name="TextContentBaseTemplate"/>
                </h5:label>
            </xsl:if>
        </h5:div>
    </xsl:template>
    <xsl:template match="mat:IconButton">
        <xsl:variable name="classes">
            mdc-icon-button
            <xsl:if test="@Pressed='True'">
                mdc-icon-button--on
            </xsl:if>
            <xsl:if test="not(@IconOn)">

            </xsl:if>
        </xsl:variable>
        <xsl:if test="not(@Variant)or@Variant='Button'">
            <button class="mdc-icon-button material-icons">
                <xsl:value-of select="current()"/><xsl:value-of select="@Icon"/>
            </button>
        </xsl:if>
        <button class="mdc-icon-button material-icons">favorite</button>
    </xsl:template>
    <xsl:template name="IconContentBaseTemplate">
        <xsl:variable name="classes">
            <xsl:if test="name(current())='Icon' and @ClassName">
                <xsl:value-of select="@ClassName"/>
            </xsl:if>
            material-icons
            mdc-button__icon
        </xsl:variable>
        <h5:i class="{$classes}">
            <xsl:if test="name(current())='Icon' and @Id">
                <xsl:attribute name="id">
                    <xsl:value-of select="@Id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:value-of select="@Icon"/>
        </h5:i>
    </xsl:template>
    <xsl:template name="TextContentBaseTemplate">
        <xsl:value-of select="@Text"/>
        <xsl:value-of select="current()"/>
    </xsl:template>
</xsl:transform>