<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html"/>

<xsl:template match="/">
<html>
<head>
<meta charset="utf-8"/>
<title>XML - Quantum Data</title>
</head>
<body>
    <xsl:apply-templates/>
</body>
</html>
</xsl:template>

<xsl:template match="contenido">
<xsl:for-each select="tema">
<h1 id="{@id}"><xsl:value-of select="@titulo"/></h1>
    <xsl:for-each select="subtema">
        <h2 id="{@id}"><xsl:value-of select="@titulo"/></h2>
        <xsl:apply-templates select="texto"/>
        <xsl:for-each select="apartado">
            <h3 id="{@id}"><xsl:value-of select="@titulo"/></h3>
            <xsl:apply-templates select="texto"/>
            <xsl:for-each select="subapartado">
                <h4 id="{@id}"><xsl:value-of select="@titulo"/></h4>
                <xsl:apply-templates select="texto"/>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:for-each>
</xsl:for-each>
</xsl:template>

<xsl:template match="saltolinea">
    <br/>
</xsl:template>

<xsl:template match="negrita">
    <strong>
        <xsl:value-of select="."/>
    </strong>
</xsl:template>

<xsl:template match="cursiva">
    <em>
        <xsl:value-of select="."/>
    </em>
</xsl:template>

<xsl:template match="enlace">
    <a href="{@referencia}" target="_blank">
        <xsl:value-of select="."/>
    </a>
</xsl:template>

<xsl:template match="code">
    <code>
        <xsl:value-of select="."/>
    </code>
</xsl:template>

<xsl:template match="codeblock">
    <pre>
        <xsl:value-of select="."/>
    </pre>
</xsl:template>

<xsl:template match="lista">
    <ul>
        <xsl:for-each select="item">
            <li>
                <xsl:apply-templates select="."/>
            </li>
        </xsl:for-each>
    </ul>
</xsl:template>

<xsl:template match="tabla">

    <table border="1" align="center" width="75%">
        <xsl:for-each select="fila">
            <tr>
                <xsl:for-each select="celda">
                    <td>
                        <xsl:apply-templates />
                    </td>
                </xsl:for-each>
            </tr>
        </xsl:for-each>
    </table>
</xsl:template>

<xsl:template match="texto">
<div>
    <xsl:apply-templates/>
</div>
</xsl:template>

</xsl:stylesheet>

