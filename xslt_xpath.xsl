<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Main HTML structure template -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Zadanie5</title>
        <link rel="stylesheet" type="text/css" href="xslt_xpath.css"/>
      </head>
      <body>
        <div class="table-container">
            <div>
                <h2>Zadanie A)</h2>
                <xsl:apply-templates select="dane" mode="zadA"/>
            </div>
            
            <div>
                <h2>Zadanie B)</h2>
                <xsl:apply-templates select="dane" mode="zadB"/> 
            </div>
                    
            <div>
                <h2>Zadanie C)</h2>
                <xsl:apply-templates select="dane" mode="zadC"/> 
            </div>
                    
            <div>
                <h2>Zadanie D)</h2>
                <xsl:apply-templates select="dane" mode="zadD"/> 
            </div>      
        </div>
      </body>
    </html>
  </xsl:template>

  <!-- Sub-task A template -->
  <xsl:template match="dane" mode="zadA">
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

  <!-- B -->

  <xsl:template match="dane" mode="zadB">
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
      <xsl:apply-templates select="osoba">
        <xsl:sort select="wiek" data-type="number"/>
        <xsl:sort select="waga" data-type="number" order="descending"/>
      </xsl:apply-templates>
    </tbody>
  </table>
</xsl:template>

  <!-- C -->
<xsl:template match="dane" mode="zadC">
  <table>
    <thead>
      <tr>
        <th>Blood Type</th>
        <th>Count</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>A</td>
        <td><xsl:value-of select="count(osoba[krew='A'])"/></td>
      </tr>
      <tr>
        <td>B</td>
        <td><xsl:value-of select="count(osoba[krew='B'])"/></td>
      </tr>
      <tr>
        <td>AB</td>
        <td><xsl:value-of select="count(osoba[krew='AB'])"/></td>
      </tr>
      <tr>
        <td>0</td>
        <td><xsl:value-of select="count(osoba[krew='0'])"/></td>
      </tr>
    </tbody>
  </table>
</xsl:template>

<!-- D -->
<!-- Sub-task A template -->
<xsl:template match="dane" mode="zadD">
  <table>
    <thead>
      <tr>
        <th>imie</th>
        <th>data</th>
        <th>wiek</th>
        <th>waga</th>
        <th>wzrost</th>
        <th>krew</th>
        <th>BMI</th>
      </tr>
    </thead>
    <tbody>
      <xsl:apply-templates select="osoba" mode="zadD"/>
    </tbody>
  </table>
</xsl:template>

<xsl:template match="osoba" mode="zadD">
  <tr>
    <td><xsl:value-of select="imie"/></td>
    <td><xsl:value-of select="data"/></td>
    <td><xsl:value-of select="wiek"/></td>
    <td><xsl:value-of select="waga"/></td>
    <td><xsl:value-of select="wzrost"/></td>
    <td><xsl:value-of select="krew"/></td>
    <td>
      <xsl:variable name="wzrostMetry" select="wzrost div 100"/>
      <xsl:value-of select="format-number(waga div ($wzrostMetry * $wzrostMetry), '#.##')"/>
    </td>
  </tr>
</xsl:template>



</xsl:stylesheet>
