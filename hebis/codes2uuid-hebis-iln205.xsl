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
	<xsl:when test=".='4OGW'">5a45e7ca-5eec-4347-9977-d8f30674d568</xsl:when>
	<xsl:when test=".='3OGW'">34fc20de-91c2-4e08-8b2b-3a255c5ac406</xsl:when>
	<xsl:when test=".='3OGO'">114d9be6-192a-4edf-aa79-995efb75d288</xsl:when>
	<xsl:when test=".='2OGW'">696f825a-2b8f-4b90-9ddc-fc663fa33ff4</xsl:when>
	<xsl:when test=".='2OGWSMSLS'">bd941e14-55e3-4cf6-9dbb-d4a7d0bbacf2</xsl:when>
	<xsl:when test=".='2OGWSM'">86302fc5-2fa3-42c4-92eb-5224a55a0f2a</xsl:when>
	<xsl:when test=".='2OGO'">f7bf853b-c1b8-4afc-a4d3-fa6ba188d419</xsl:when>
	<xsl:when test=".='1OGO'">551c0331-296d-4b22-8828-037da1b62110</xsl:when>
	<xsl:when test=".='1OGWSLS'">b38d339e-e42d-49e6-87e6-64ed097a2aa1</xsl:when>
	<xsl:when test=".='1OGWMZ'">0aca5290-1fec-4f21-a21e-4230a307c1b1</xsl:when>
	<xsl:when test=".='EG'">20fdbce6-e856-4845-8c90-bdb416385cf6</xsl:when>
	<xsl:when test=".='EGSEM'">f5f308df-b488-4518-b2f5-b382dbd0f113</xsl:when>
	<xsl:when test=".='1OGW'">65468b8c-4d1a-428f-b9b3-f05fe4d6dffe</xsl:when>
	<xsl:when test=".='UGLBS'">0e6c46cc-aa07-455d-8fba-4e5e72f9bf31</xsl:when>
	<xsl:when test=".='UGOM'">ec2cd560-add7-4d0f-a0fb-ffb338766747</xsl:when>
	<xsl:when test=".='UGZM'">9ce30021-f432-406f-9e94-71718ee5bee1</xsl:when>
	<xsl:when test=".='UGW'">a839d6ad-2ef6-477a-ac71-8c60a7a70375</xsl:when>
	<xsl:when test=".='UGWSLS'">50e435cb-5e5c-411f-a836-6835da308337</xsl:when>
	<xsl:when test=".='UGO'">89e756e5-776e-42e3-80af-217e7f72c842</xsl:when>
	<xsl:when test=".='UGOSLS'">002f40c9-b93c-42e8-9e1f-2d531b17fcc4</xsl:when>
	<xsl:when test=".='UGOKRAUSS'">d5d3b985-8107-4434-93e6-8a2db58882ad</xsl:when>
	<xsl:when test=".='UGOKRAUSSSLS'">131e617f-c1eb-4c23-afe8-f16f1a92bb2a</xsl:when>
	<xsl:when test=".='AMU'">4a7319b4-0b9e-46ab-829c-fbfce5c70ef3</xsl:when>
	<xsl:when test=".='AMUSLS'">5ed3d02e-92ad-468f-8a6f-d7efbbd877cc</xsl:when>
	<xsl:when test=".='AMLB'">dd9d3e36-a4c6-4a1e-a9e7-760e77e56087</xsl:when>
	<xsl:when test=".='AMLBSLS'">00659187-90d6-4752-b6dc-4adf76a91f1a</xsl:when>
	<xsl:when test=".='HANDAPP'">5361189b-80d5-4791-b6a8-9b94e57c26de</xsl:when>
	<xsl:when test=".='MZ'">ebc06185-49bd-4e46-8273-64e18df3dea0</xsl:when>
	<xsl:when test=".='KLEIN'">807f27db-155d-4b76-9fe0-19866f479456</xsl:when>
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
