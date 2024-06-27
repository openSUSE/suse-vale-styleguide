<?xml version="1.0" encoding="UTF-8"?>
<!--
  Purpose:
     Process XML file to simplify output for Vale

  Input:
     DocBook 5 document

  Output:
     Single, simplified XHTML document


  Author:    Thomas Schraitle <toms@opensuse.org>
  Copyright: 2023, Thomas Schraitle

-->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  xmlns:dm="urn:x-suse:ns:docmanager"
  xmlns:exsl="http://exslt.org/common"
  xmlns:date="http://exslt.org/dates-and-times"
  xmlns="http://www.w3.org/1999/xhtml"
  exclude-result-prefixes="exsl date d dm">

  <xsl:import href="/usr/share/xml/docbook/stylesheet/nwalsh5/current/xhtml/docbook.xsl"/>
  <xsl:output indent="yes"/>

  <!-- Overwrite parameters -->
  <xsl:param name="admon.textlabel" select="0"/>
  <xsl:param name="admon.style"/>
  <xsl:param name="callout.graphics" select="0"/>
  <xsl:param name="callout.unicode" select="1"/>
  <xsl:param name="generate.toc" select="''"/>
  <xsl:param name="generate.index" select="0"/>
  <xsl:param name="emphasis.propagates.style" select="0"/>
  <xsl:param name="para.propagates.style" select="0"/>
  <xsl:param name="make.clean.html" select="1"/>
  <xsl:param name="css.decoration" select="0"/>
  <xsl:param name="allow-anchors" select="0"/>
  <xsl:param name="suppress.navigation" select="1"/>
  <xsl:param name="docbook.css.link" select="0"/>
  <xsl:param name="docbook.css.source"/>

  <!-- Title page -->
  <xsl:template match="d:info/*[not(self::d:title or self::d:subtitle or self::d:titleabbrev or self::d:abstract)]"
    mode="article.titlepage.recto.auto.mode"/>
  <xsl:template match="d:info/*[not(self::d:title or self::d:subtitle or self::d:titleabbrev or self::d:abstract)]"
    mode="book.titlepage.recto.auto.mode"/>
  <xsl:template match="d:info/*[not(self::d:title or self::d:subtitle or self::d:titleabbrev or self::d:abstract)]"
    mode="set.titlepage.recto.auto.mode"/>

  <!-- Templates -->
  <xsl:template match="d:command|d:envar|
                       d:filename|d:function|
                       d:guiicon|d:guimenu|d:guilabel|d:guimenuitem|
                       d:keycap|d:keycombo|d:label|d:link|d:literal|
                       d:markup|d:mathphrase|
                       d:option|d:optional|
                       d:package|d:parameter|d:prompt|d:programlisting|d:programlistingco|
                       d:tag|d:uri|d:remark">
   <xsl:message>Ignored <xsl:value-of select="local-name(.)"/>.</xsl:message>
   </xsl:template>

  <!-- We don't want to create IDs with <a id="..."> -->
  <xsl:template match="*" mode="common.html.attributes"/>

  <!-- Remove class attribute -->
  <xsl:template name="generate.class.attribute"/>
  <xsl:template match="*" mode="class.attribute"/>

  <xsl:template match="comment()"/>

</xsl:stylesheet>
