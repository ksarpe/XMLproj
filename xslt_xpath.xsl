<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Main HTML structure template -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Data Table</title>
        <link rel="stylesheet" type="text/css" href="xslt_xpath.css"/>
      </head>
      <body>
        <h1>Data Table</h1>

        <!-- Call templates for each sub-task here -->
        <h2>Sub-task A</h2>
        <xsl:apply-templates select="dane" mode="taskA"/>

      </body>
    </html>
  </xsl:template>

  <!-- Sub-task A template -->
  <xsl:template match="dane" mode="taskA">
    <table>
      <thead>
        <tr>
          <th>imie</th>
          <th>data</th>
          <th>wiek</th>
          <th>waga</th>
          <th>wzrost</th>
          <th>krew</th>
        </tr>
      </thead>
      <tbody>
        <xsl:apply-templates select="osoba"/>
      </tbody>
    </table>
  </xsl:template>

  <xsl:template match="osoba">
    <tr>
      <td><xsl:value-of select="imie"/></td>
      <td><xsl:value-of select="data"/></td>
      <td><xsl:value-of select="wiek"/></td>
      <td><xsl:value-of select="waga"/></td>
      <td><xsl:value-of select="wzrost"/></td>
      <td><xsl:value-of select="krew"/></td>
    </tr>
  </xsl:template>

  <!-- Add templates for sub-tasks B, C, and D here -->

</xsl:stylesheet>
