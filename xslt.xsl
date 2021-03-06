﻿<?xml version="1.0" encoding="utf-8" ?>
<!--xslt.xsl-->
<!--author: Jonathan Godley (c3188072)-->
<!--date: 30/10/15-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>

	<xsl:template match="/">
		<html>
			<head>
				<title>NUtube: University of Newcastle's YouTube Channel Showcase</title>
				<meta charset="UTF-8" />
				<link rel="stylesheet" type="text/css" href="style.css"/>
			</head>
			<body>
				<section>
					<header>
						<img src="images/NUtube.png" alt="NUtube: University of Newcastle's YouTube Channel Showcase"> <!--generated by http://textcraft.net --> </img>
					</header>
					<nav>
						<ul>
							<li><a class="navbarlink" href="index.html">Home</a></li>
							<li><a class="navbarlink" href="gaming.xml">Data Display Page</a></li>
							<li><a class="navbarlink" href="music.xml">Data Display Page 2</a></li>
							<li><a class="navbarlink" href="data_collection.html">Data Collection Form</a></li>
							<li><a class="navbarlink" href="https://www.youtube.com/user/universitynewcastle">UON YouTube Account</a></li>
						</ul>
					</nav>
					<main>	
						<br />
						<div id="showcase">
						<h1>
							UON: Channel Showcase - <xsl:value-of select="categories/category/@name" />
						</h1>
						<xsl:for-each select="categories/category/channel">
						<xsl:sort select="owner/owner_name/surname"/>
							<p> 
								Channel Information: <br />
								Name: <xsl:value-of select="name"/><br />
								<xsl:apply-templates select="logo"/>
								<xsl:apply-templates select="profile_photo"/>
								<xsl:apply-templates select="trailer"/>
								<xsl:apply-templates select="URL"/>
								Description: <xsl:value-of select="description"/><br />
								<xsl:apply-templates select="relURL"/>
								<xsl:for-each select="similar_channels">
								Similar Channels: <xsl:value-of select="."/><br />
								</xsl:for-each>
								Subscriber Count: <xsl:value-of select="subscribers"/><br />
								Restricted Mode:  <strong><xsl:value-of select="@restricted_mode" /></strong>
							</p>
							<p>
								Owner Information: <br />
								<xsl:apply-templates select="owner/owner_name"/>
								Email: <xsl:value-of select="owner/email" /><br />
								<xsl:apply-templates select="owner/address"/>
								<xsl:apply-templates select="owner/equipment"/>
								<xsl:apply-templates select="owner/owner_photo"/>
							</p>
							<br />
						</xsl:for-each>
						</div>
					</main>
					<footer>
						<p>site design © 2015 <a href="mailto:c3188072@uon.edu.au">Jonathan Godley</a></p> <!-- used a mailto link instead of outright displaying an email address/contact details -->
					</footer>
				</section>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="owner/owner_name">
		Owner:
		<xsl:value-of select="./firstname" />
		<xsl:text> </xsl:text>
		<xsl:value-of select="./surname" />
		<br />
	</xsl:template>
	<xsl:template match="owner/address">
		Address:
		<xsl:value-of select="./street_no" />
		<xsl:text> </xsl:text>
		<xsl:value-of select="./street" />
		<xsl:text> </xsl:text>
		<xsl:value-of select="./suburb" />
		<xsl:text> </xsl:text>
		<xsl:value-of select="./postcode" />
		<xsl:text> </xsl:text>
		<xsl:value-of select="./state" />
		<xsl:text> </xsl:text>
		<xsl:value-of select="./country" />
		<br />
	</xsl:template>
	<xsl:template match="owner/equipment">
		Equipment:
		<xsl:value-of select="." />
		<br />
	</xsl:template>
	<xsl:template match="owner/owner_photo">
		Photo:
		<img alt="Picture not found">
			<xsl:attribute name="src">
				.<xsl:value-of select="." />
			</xsl:attribute>
		</img>

		<br />
	</xsl:template>
	<xsl:template match="logo">
		Logo:
		<img alt="Picture not found">
			<xsl:attribute name="src">
				.<xsl:value-of select="." />
			</xsl:attribute>			
		</img>

		<br />
	</xsl:template>
	<xsl:template match="profile_photo">
		Profile Photo:
		<img alt="Picture not found">
			<xsl:attribute name="src">
				.<xsl:value-of select="." />
			</xsl:attribute>			
		</img>

		<br />
	</xsl:template>
	<xsl:template match="trailer">
		Trailer URL:
		<a href='{.}'><xsl:value-of select="."/></a>
		<br />
	</xsl:template>
	<xsl:template match="URL">
		Channel URL:
		<a href='{.}'><xsl:value-of select="."/></a>
		<br />
	</xsl:template>
	<xsl:template match="relURL">
		Assosciated URL:
		<a href='{.}'><xsl:value-of select="."/></a>
		<br />
	</xsl:template>
</xsl:stylesheet>