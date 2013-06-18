<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml"
	xmlns:atom="http://www.w3.org/2005/Atom" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:apiscol="http://www.crdp.ac-versailles.fr/2012/apiscol"
	exclude-result-prefixes="#default">
	<xsl:output method="html" omit-xml-declaration="yes"
		encoding="UTF-8" indent="yes" />
	<xsl:template match="/">
		<html>
			<head>
				<meta charset="utf-8">
				</meta>


				<style>
					/* ------------------
					styling for the tables
					------------------ */

					div.apiscol-list table#hor-minimalist-a thead
					tr th img {
					vertical-align: bottom;
					display: inline-block;
					margin-right: 1em;
					}

					#hor-minimalist-a {
					font-family: "Lucida Sans
					Unicode", "Lucida Grande", Sans-Serif;
					font-size: 12px;
					background:
					#fff;
					margin: 45px;
					border-collapse: collapse;
					text-align: left;
					vertical-align: top;
					width: 1000px;
					table-layout: fixed;
					}
					#hor-minimalist-a tbody tr.bottom td details div {
					padding-bottom:0.5em;
					}
					#hor-minimalist-a tr,#hor-minimalist-a td {
					vertical-align: top;
					}

					#hor-minimalist-a tbody tr td, #hor-minimalist-a tbody tr div{

					}
					#hor-minimalist-a tbody tr div{
					margin: 0;
					padding: 0;
					}

					#hor-minimalist-a tbody tr.bottom {
					border-bottom: thin solid
					#6678b1;
					padding-bottom: 0.5em;
					}

					#hor-minimalist-a th {
					font-size:
					14px;
					font-weight: normal;
					color: #039;
					padding: 10px 8px;
					border-bottom: 2px solid #6678b1;
					}

					#hor-minimalist-a td {
					color:
					#669;
					padding: 9px 8px 0px 8px;
					}

					#hor-minimalist-a tbody tr:hover td
					{
					color: #009;
					}
				</style>
				<xsl:element name="meta" namespace="">
					<xsl:attribute name="name">
						<xsl:value-of select="'description'"></xsl:value-of>
						</xsl:attribute>
					<xsl:attribute name="content">
						<xsl:value-of select="'Séquences pédagogiques'"></xsl:value-of>
						</xsl:attribute>
				</xsl:element>
				<meta name="viewport" content="width=device-width"></meta>

			</head>
			<body>
				<xsl:apply-templates select="*[local-name()='feed']"></xsl:apply-templates>


			</body>



		</html>

	</xsl:template>
	<xsl:template match="*[local-name()='feed']">

		<div class="apiscol-list">
			<table id="hor-minimalist-a">
				<thead>
					<tr>
						<th colspan="12">
							<xsl:apply-templates select="logo"></xsl:apply-templates>
							<xsl:apply-templates select="generator"></xsl:apply-templates>
						</th>
					</tr>
				</thead>
				<tbody>
					<xsl:apply-templates select="*[local-name()='entry']"></xsl:apply-templates>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="12">
							<xsl:call-template name="pagination">
								<xsl:with-param name="length" select="*[local-name()='count']">
								</xsl:with-param>
								<xsl:with-param name="step" select="0">
								</xsl:with-param>
							</xsl:call-template>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</xsl:template>
	<xsl:template match="logo">
		<xsl:element name="img">
			<xsl:attribute name="src">
			<xsl:value-of select=".">
			</xsl:value-of>
			</xsl:attribute>
		</xsl:element>
	</xsl:template>
	<xsl:template match="generator">
		<xsl:element name="span">
			<xsl:value-of select=".">
			</xsl:value-of>
		</xsl:element>
	</xsl:template>
	<xsl:template match="*[local-name()='entry']">
		<tr>
			<td colspan="5">
				<strong>
					<xsl:value-of select="*[local-name()='title']"></xsl:value-of>
				</strong>
			</td>

			<td colspan="7">
				<div>
					<xsl:value-of select="*[local-name()='summary']"></xsl:value-of>
				</div>
			</td>

		</tr>
		<tr>
			<td>
				<xsl:element name="a">
					<xsl:attribute name="href">
			<xsl:value-of select="*[local-name()='link'][@type='text/html']/@href"></xsl:value-of>
			</xsl:attribute>
					HTML
				</xsl:element>
			</td>
			<td>
				<xsl:element name="a">
					<xsl:attribute name="href">
			<xsl:value-of
						select="*[local-name()='link'][@type='application/atom+xml']/@href"></xsl:value-of>&amp;desc=true
			</xsl:attribute>
					ATOM
				</xsl:element>
			</td>
			<td>
				<xsl:element name="a">
					<xsl:attribute name="href">
			<xsl:value-of
						select="*[local-name()='link'][@rel='alternate'][@type='application/xml']/@href"></xsl:value-of>
			</xsl:attribute>
					MANIFESTE
				</xsl:element>
			</td>
			<td>
				<xsl:element name="a">
					<xsl:attribute name="href">
			<xsl:value-of
						select="*[local-name()='link'][@type='application/atom+xml'][@rel='describedby']/@href"></xsl:value-of>
			</xsl:attribute>
					META
				</xsl:element>
			</td>
			<td>
				<xsl:element name="a">
					<xsl:attribute name="href">
			<xsl:value-of select="*[local-name()='content']/@src"></xsl:value-of>
			</xsl:attribute>
					DOWNLOAD
				</xsl:element>
			</td>
			<td colspan="7">
				<xsl:value-of select="*[local-name()='id']"></xsl:value-of>
			</td>

		</tr>
		<tr class="bottom">
			<td colspan="12">
				<details>
					<summary>Ressources</summary>
					<div>
						<xsl:apply-templates select="content/resources/resource"></xsl:apply-templates>
					</div>
				</details>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="content/resources/resource">

		<span>
			<xsl:element name="a">
				<xsl:attribute name="href">
			<xsl:value-of select="@href"></xsl:value-of>
			</xsl:attribute>
				n°
				<xsl:value-of select="position()"></xsl:value-of>
			</xsl:element>
		</span>&#0160;

	</xsl:template>
	<xsl:template name="pagination">
		<xsl:param name="step"></xsl:param>
		<xsl:param name="length"></xsl:param>
		<xsl:element name="a">
			<xsl:attribute name="href">
		<xsl:value-of
				select="concat('?start=', $step*10, '&amp;rows=10')"></xsl:value-of>
		</xsl:attribute>
			<xsl:value-of select="$step+1"></xsl:value-of>
		</xsl:element>
		&#0160;
		<xsl:choose>
			<xsl:when test="($step+1)*10>$length"></xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="pagination">
					<xsl:with-param name="length" select="$length">
					</xsl:with-param>
					<xsl:with-param name="step" select="$step+1">
					</xsl:with-param>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
