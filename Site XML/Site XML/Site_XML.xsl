<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="ISO-8859-1" />

	<xsl:template match="/">	
		<html>
		<!-- compatiblité IE 9 BALISE HTML 5 -->
		<!--[if lt IE 9]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
			<head>
				<title>XML et évolution du Web</title>
				<link type="text/css" rel="stylesheet" href="XML_CSS.css" />
			</head>
			
			<body>
				<header>
					<h1>XML et évolution du Web </h1>
					<img src= "images/banniere2.png" alt="banniere" id="ban"/>
				</header>
				
				<xsl:apply-templates/>

				<footer>
					<p> Site réalisé dans le cadre du Deust Webmaster et Gestionnaire d'Intranet de l'université de Limoges <br/>
					<a href= "http://www.cvtic.unilim.fr/deust_webmaster"> http://www.cvtic.unilim.fr/deust_webmaster </a> </p>
				</footer>
			</body>

		</html>
	</xsl:template >

	
	<xsl:template match="sous_partie">
		<ul>
			<li>
				<h3> <xsl:value-of select="nom_sous_partie"/> </h3>
				<xsl:for-each select="paragraphe">
					<p> <xsl:value-of select="."/>  </p>
				</xsl:for-each>				
			</li>
		</ul>
	</xsl:template>
	
	<xsl:template match="Partie">
		<section>
			<article>
				<h2> <xsl:value-of select="nom_partie"/> </h2> <br/>
				<xsl:apply-templates select="sous_partie"/> 
			</article>
			<xsl:apply-templates select ="Menu"/>
		</section>
	</xsl:template>
	
	<xsl:template match="Menu">
		<nav>
			<ul>
				<xsl:for-each select="lien">
				<li> <a href= "{@url}"> <xsl:value-of select="."/> </a> </li>
				</xsl:for-each>	
			</ul>
		</nav>
	</xsl:template>
	
</xsl:stylesheet>