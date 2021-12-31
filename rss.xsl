<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- xsl:output method="xml" indent="yes" cdata-section-elements="description"/ -->
<xsl:output method="xml" indent="yes"/>

<xsl:template match="/">
    <rss version="2.0">
    <channel>
        <title>Curso XML - Quantum Data</title>
        <link>http://localhost:8000/html.html</link>
        <description>Curso de XML elaborado por Quantum Data.</description>
        <language>es</language>
        <xsl:apply-templates/>
    </channel>
    </rss>
</xsl:template>

<xsl:template match="contenido">
<xsl:for-each select="tema">
    <xsl:for-each select="subtema">

        <xsl:if test="/contenido/tema/subtema/texto">
            <item>
                <title><xsl:value-of select="@titulo"/></title>
                <link>http://localhost:8000/html.html#<xsl:value-of select="@id"/></link>
                <description><xsl:value-of select="texto"/></description>
                <guid>http://localhost:8000/html.html#<xsl:value-of select="@id"/></guid>
            </item>
        </xsl:if>

        <xsl:for-each select="apartado">
            <xsl:if test="/contenido/tema/subtema/apartado/texto">
                <item>
                    <title><xsl:value-of select="@titulo"/></title>
                    <link>http://localhost:8000/html.html#<xsl:value-of select="@id"/></link>
                    <description><xsl:value-of select="texto"/></description>
                    <guid>http://localhost:8000/html.html#<xsl:value-of select="@id"/></guid>
                </item>
            </xsl:if>

            <xsl:for-each select="subapartado">
                <item>
                    <title><xsl:value-of select="@titulo"/></title>
                    <link>http://localhost:8000/html.html#<xsl:value-of select="@id"/></link>
                    <description><xsl:value-of select="texto"/></description>
                    <guid>http://localhost:8000/html.html#<xsl:value-of select="@id"/></guid>
                </item>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:for-each>
</xsl:for-each>
</xsl:template>


</xsl:stylesheet>