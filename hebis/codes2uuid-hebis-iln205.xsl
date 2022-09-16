<?xml version="1.0" encoding="UTF-8"?> 

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- ILN 205 UB Marburg -->
  <!-- Map locations (codes2uuid-hebis-iln205.xsl)
       the IDs are the location names in FOLIO, generated from 209A $f and other pica fields -->

  <xsl:template match="permanentLocationId"> <!-- ILN -->
    <permanentLocationId>
      <xsl:choose>
        <xsl:when test=".='4 OG West'">5a45e7ca-5eec-4347-9977-d8f30674d568</xsl:when>
        <xsl:when test=".='3 OG West'">34fc20de-91c2-4e08-8b2b-3a255c5ac406</xsl:when>
        <xsl:when test=".='3 OG Ost'">114d9be6-192a-4edf-aa79-995efb75d288</xsl:when>
        <xsl:when test=".='2 OG West'">696f825a-2b8f-4b90-9ddc-fc663fa33ff4</xsl:when>
        <xsl:when test=".='2 OG West - Sondermagazin nur für den Sonderlesesaal'">bd941e14-55e3-4cf6-9dbb-d4a7d0bbacf2</xsl:when>
        <xsl:when test=".='2 OG West - Sondermagazin Ausleihbestand'">86302fc5-2fa3-42c4-92eb-5224a55a0f2a</xsl:when>
        <xsl:when test=".='2 OG Ost'">f7bf853b-c1b8-4afc-a4d3-fa6ba188d419</xsl:when>
        <xsl:when test=".='1 OG Ost'">551c0331-296d-4b22-8828-037da1b62110</xsl:when>
        <xsl:when test=".='1 OG West - Sonderlesesaal'">b38d339e-e42d-49e6-87e6-64ed097a2aa1</xsl:when>
        <xsl:when test=".='1 OG West - Medienzentrum'">0aca5290-1fec-4f21-a21e-4230a307c1b1</xsl:when>
        <!-- TBD! Correct Default; 2 OG West - Sondermagazin nur für den Sonderlesesaal  -->
        <xsl:otherwise>bd941e14-55e3-4cf6-9dbb-d4a7d0bbacf2</xsl:otherwise>
      </xsl:choose>
    </permanentLocationId>
  </xsl:template>

  <!-- Map loan types -->

  <xsl:template match="permanentLoanTypeId"> <!-- ILN --> <!-- TBD -->
    <permanentLoanTypeId>
      <xsl:choose>
        <xsl:when test=".='0 u ausleihbar'">5b02897b-0993-4a6d-857e-992e1e08b28a</xsl:when>
        <xsl:when test=".='1 b Kurzausleihe'">23c01bbe-e0a9-424c-9a3f-8559a5c11ca5</xsl:when>
        <xsl:when test=".='2 c Lehrbuchsammlung'">9cdd75ad-d6ee-4fbe-a899-d71ec6ec775d</xsl:when>
        <xsl:when test=".='3 s Präsenzbestand Lesesaal'">d4053309-db60-4ddb-8814-bf33fe6498f6</xsl:when>
        <xsl:when test=".='4 d Präsenzbestand Wochenendausleihe'">699fee80-0a93-4e22-87da-40653b0ed5ad</xsl:when>
        <xsl:when test=".='5 i nur für den Lesesaal'">bde06480-3294-47e6-ac56-61234053691d</xsl:when>
        <!-- TBD! Correct Default; 0 u normal ausleihbar -->
        <xsl:otherwise>5b02897b-0993-4a6d-857e-992e1e08b28a</xsl:otherwise>
      </xsl:choose>
    </permanentLoanTypeId>
  </xsl:template>

  <!-- Map statistical code ids -->
  <xsl:template match="statisticalCodeIds"> <!-- ILN -->
    <statisticalCodeIds>
      <arr>
        <xsl:for-each select="arr/i">
          <i>
            <xsl:choose>
              <xsl:when test=".='1001'">TBD</xsl:when>
              <!-- add as needed -->
              
            </xsl:choose>
          </i>
        </xsl:for-each>
      </arr>
    </statisticalCodeIds>
  </xsl:template>

</xsl:stylesheet>
