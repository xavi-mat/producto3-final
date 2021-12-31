<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml" indent="yes"/>

<xsl:template match="/">
    <speak version="1.1" xmlns="http://www.w3.org/2001/10/synthesis" xml:lang="es-ES">
        <voice gender="male" languages="es">
            <xsl:apply-templates/>
        </voice>
    </speak>
</xsl:template>

<xsl:template match="contenido">
    <xsl:apply-templates/>
</xsl:template>

<xsl:template match="contenido">
<xsl:for-each select="tema">
    <voice gender="female" languages="es">
        <xsl:value-of select="@titulo"/>
    </voice>
    <xsl:for-each select="subtema">
        <voice gender="female" languages="es">
            <xsl:value-of select="@titulo"/>
        </voice>
        <xsl:if test="/contenido/tema/subtema/texto">
            <xsl:value-of select="texto"/>
        </xsl:if>

        <xsl:for-each select="apartado">
            <voice gender="female" languages="es">
                <xsl:value-of select="@titulo"/>
            </voice>
            <xsl:if test="/contenido/tema/subtema/apartado/texto">
                <xsl:value-of select="texto"/>
            </xsl:if>

            <xsl:for-each select="subapartado">
                <voice gender="female" languages="es">
                    <xsl:value-of select="@titulo"/>
                </voice>
                <xsl:value-of select="texto"/>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:for-each>
</xsl:for-each>
</xsl:template>

</xsl:stylesheet>