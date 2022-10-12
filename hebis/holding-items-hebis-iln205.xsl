<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8"/>
  <xsl:key name="original" match="original/item" use="@epn"/>

  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- ILN 205 UB Marburg: holding-items-hebis-iln205.xsl -->

  <xsl:template match="permanentLocationId">
    <xsl:variable name="i" select="key('original',.)"/>
    <!-- 209A$f/209G$a ? -->
    <xsl:variable name="abt" select="$i/datafield[@tag='209A']/subfield[@code='f']"/>
    <xsl:variable name="signatur" select="$i/datafield[@tag='209A']/subfield[@code='a']"/>
    <xsl:variable name="standort" select="$i/datafield[(@tag='209G') and (subfield[@code='x']='01')]/subfield[@code='a']"/>
    <xsl:variable name="electronicholding" select="(substring($i/../datafield[@tag='002@']/subfield[@code='0'],1,1) = 'O') and not(substring($i/datafield[@tag='208@']/subfield[@code='b'],1,1) = 'a')"/>
    <permanentLocationId> <!-- TBD -->
       <xsl:choose>
         <xsl:when test="$electronicholding">ONLINE</xsl:when>
         <xsl:when test="substring($i/datafield[@tag='208@']/subfield[@code='b'],1,1) = 'd'">DUMMY</xsl:when>
         <xsl:when test="$abt='000'">
           <xsl:choose>
             <xsl:when test="$standort='Lehrbuchsammlung'">UGLBS</xsl:when>
             <xsl:when test="$standort='Sondermagazin'">UGOSls</xsl:when>
             <!-- ab hier via Signatur 1. RVK, 2. Magazin 3. TB -->
             <!-- ungeschachteltes choose wenn feinere Bedingung zuerst kommt, analog Bin Table -->
             <xsl:when test="starts-with ($signatur,'011')">4OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'013')">4OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 A')">2OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 B')">2OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 CM')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 CN')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 CO')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 CP')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 CQ')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 CR')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 CS')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 CT')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 CU')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 CV')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 CW')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 CX')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 CZ')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 C')">3OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 D')">EG</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 E')">3OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 F')">3OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 G')">3OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 H')">3OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 I')">3OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 K')">3OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 LB')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 LC')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 L')">3OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 M')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 N')">2OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 P')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 Q')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 R')">3OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 S')">3OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 T')">3OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 U')">3OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 V')">3OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 W')">3OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 X')">3OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 Z')">3OGW</xsl:when>
             <!-- Präsenzbestand RVK -->
             <xsl:when test="starts-with ($signatur,'003 A')">2OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 B')">2OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'001 CM')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 CN')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 CO')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 CP')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 CQ')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 CR')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 CS')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 CT')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 CU')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 CV')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 CW')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 CX')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 CZ')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 C')">3OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 D')">EG</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 E')">3OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 F')">3OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 G')">3OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 H')">3OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 I')">3OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 K')">3OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 LB')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 LC')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 L')">3OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 M')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 N')">2OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 P')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 Q')">1OGO</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 R')">3OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 S')">3OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 T')">3OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 U')">3OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 V')">3OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 W')">3OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 X')">3OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'003 Z')">3OGW</xsl:when>
             <!-- Magazin ohne römische Signaturen -->
             <xsl:when test="starts-with ($signatur,'065 ')">UGOSls</xsl:when>
             <xsl:when test="starts-with ($signatur,'070 ')">UGOM</xsl:when>
             <xsl:when test="starts-with ($signatur,'080 2 ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'080 4 ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'080 8 ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'080 Cd ')">1OGWMZ</xsl:when>
             <xsl:when test="starts-with ($signatur,'080 Dv ')">1OGWMZ</xsl:when>
             <xsl:when test="starts-with ($signatur,'080 Xy ')">1OGWMZ</xsl:when>
             <xsl:when test="starts-with ($signatur,'080 ')">UGOM</xsl:when>
             <xsl:when test="starts-with ($signatur,'085 1 Zs ')">UGOSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'085 1 ')">2OGWSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'085 2 ')">1OGWSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'085 4 ')">1OGWSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'085 8 ')">1OGWSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'085 Kt ')">2OGWSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'085 Xy ')">1OGWMZ</xsl:when>
             <xsl:when test="starts-with ($signatur,'085 ')">UGOM</xsl:when>
             <xsl:when test="starts-with ($signatur,'088 ')">1OGWMZ</xsl:when>
             <xsl:when test="starts-with ($signatur,'095 ')">2OGWSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'2 A')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'2 B')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'2 C ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'2 D')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'2 E ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'2 F ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'2 G ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'2 H')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'2 J ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'2 K')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'2 L')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'2 M ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'2 N ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'2 O ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'2 P')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'2 Q')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'2 R ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'2 S')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'2 T ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'2 U ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'2 V ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'2 Wp ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'2 Ws ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'2 W')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'2 X')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'2 Y ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'2 Zs ')">UGOM</xsl:when>
             <xsl:when test="starts-with ($signatur,'2 Z')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'4 A')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'4 B')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'4 C ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'4 D')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'4 E ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'4 F ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'4 G ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'4 H')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'4 J ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'4 K')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'4 L')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'4 M ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'4 N ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'4 O ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'4 P')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'4 Q')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'4 R ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'4 S')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'4 T ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'4 U ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'4 V ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'4 Wp ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'4 Ws ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'4 W')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'4 X')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'4 Y ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'4 Zs ')">UGOM</xsl:when>
             <xsl:when test="starts-with ($signatur,'4 Z')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'8 0 ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'A')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'B')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'C ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'Disk ')">1OGWMZ</xsl:when>
	     <xsl:when test="starts-with ($signatur,'D')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'E ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'Film ')">1OGWMZ</xsl:when>
             <xsl:when test="starts-with ($signatur,'F ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'G ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'H')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'J ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'K')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'L')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'Mb')">1OGWSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'Ms ')">2OGWSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'M ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'N ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'O ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'P')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'Q')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'R ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'Semapp ')">SEMAPP</xsl:when>
             <xsl:when test="starts-with ($signatur,'S')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'T ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'U ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'V ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'Wp ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'Ws ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'W ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'X ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'Xr ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'Y ')">UGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'Zf ')">1OGWMZ</xsl:when>
             <xsl:when test="starts-with ($signatur,'Zs ')">UGOM</xsl:when>
             <xsl:when test="starts-with ($signatur,'Z ')">AMU</xsl:when>
             <!-- Filme der Fachgruppen -->
             <xsl:when test="starts-with ($signatur,' Film ')">1OGWMZ</xsl:when>
             <!-- Römische Signaturen. Dissertationen jeweils am Ende via Grobraster, dann sind alle Namen dabei -->
             <!-- Reihenfolge I*, V*, X*  -->
             <!-- Achtung: Case sensitive im Gegensatz zur OUS/LBS-Konkordanz -->
             <!-- I -->
             <xsl:when test="starts-with ($signatur,'I A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'I B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'I C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'Ic C ')">2OGWSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'I ')">AMU</xsl:when>
             <!-- II -->
             <xsl:when test="starts-with ($signatur,'II A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'II B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'II C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'II ')">AMU</xsl:when>
             <!-- III -->
             <xsl:when test="starts-with ($signatur,'III A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'III B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'III C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'III ')">AMU</xsl:when>
             <!-- IV -->
             <xsl:when test="starts-with ($signatur,'IV A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'IV aA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'IV aB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'IV aC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'IV B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'IV bA ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'IV C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'IV cA ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'IVa A ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'IV ')">AMU</xsl:when>
             <!-- IX -->
             <xsl:when test="starts-with ($signatur,'IX A ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'IX B ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'IX C ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'IX ')">AMU</xsl:when>
             <!-- V -->
             <xsl:when test="starts-with ($signatur,'V A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'V B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'V C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'V ')">AMU</xsl:when>
             <!-- VI -->
             <xsl:when test="starts-with ($signatur,'VI A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VI aA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VI aB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VI aC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VI B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VI bA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VI bB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VI bC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VI C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VI cA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VI cB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VI cC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VI dA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VI dB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VI dC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VI eA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VI eB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VI eC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VI fA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VI fB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VI fC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VI gA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VI gB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VI gC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VI ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIa A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIa B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIa C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIA ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIb A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIb B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIb C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIB ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIc A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIc B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIc C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIC ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'VId A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VId B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VId C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VId ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIe A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIe B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIe C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIe ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIf A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIf B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIf C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIf ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIg A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIg B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIg C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIg ')">AMU</xsl:when>
             <!-- VII -->
             <xsl:when test="starts-with ($signatur,'VII A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII aA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII aB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII aC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII bA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII bB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII bC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII cA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII cB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII cC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII dA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII daA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII daB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII daC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII dac A ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII dB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII dbA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII dbB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII dbC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII dC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII eA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII eaA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII eaB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII eaC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII eB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII eC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII fA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII fB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII fC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII gA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII gB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII gC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII hA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII hB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII hC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII iA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII iB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII iC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII kA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII kB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII kC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII lA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII la A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII la B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII la C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII laA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII laB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII laC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII lB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII lC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII mA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII maA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII maB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII maC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII mB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII mC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII nA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII nB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII nC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII oA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII oB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII oC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VII ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIa A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIa B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIa C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIA ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIb A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIb B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIb C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIB ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIc A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIc B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIc C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIC ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIId A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIId B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIId C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIId ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIda A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIda B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIda C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIdA ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIdb A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIdb B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIdb C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIdB ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIe A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIe B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIe C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIe ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIea A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIea B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIea C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIeA ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIf A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIf B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIf C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIf ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIg A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIg B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIg C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIg ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIh A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIh B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIh C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIh ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIk A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIk B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIk C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIk ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIl A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIl B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIl C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIl ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIla A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIla B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIla C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIlA ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIm A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIm B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIm C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIm ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIma A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIma B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIma C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIImA ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIn A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIn B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIn C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIn ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIo A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIo B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIo C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIo ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIo ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'Vs A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'Vs ')">1OGW</xsl:when>
             <!-- VIII -->
             <xsl:when test="starts-with ($signatur,'VIII A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIII B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIII C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIII ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIIA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIIa A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'VIIIda C ')">1OGW</xsl:when>
             <!-- X -->
             <xsl:when test="starts-with ($signatur,'X A ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'X B ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'X C ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'X ')">AMU</xsl:when>
             <!-- XI -->
             <xsl:when test="starts-with ($signatur,'XI A ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI aA ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI aB ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI aC ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI B ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI bA ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI bB ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI bC ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI C ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI cA ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI cB ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI cC ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI dA ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI dB ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI dC ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI eA ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI eB ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI eC ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI fA ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI fB ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI fC ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI gA ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI gB ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI gC ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI hA ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI hB ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI hC ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI iA ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI iB ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI iC ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI k ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI kC ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI zA ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI zB ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI zC ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XI ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIa A ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIa B ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIa C ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIA ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIb A ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIb B ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIb C ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIB ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIc A ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIc B ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIc C ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIC ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XId A ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XId B ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XId C ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XId ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIe A ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIe B ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIe C ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIe ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIf A ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIf B ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIf C ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIf ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIg A ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIg B ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIg C ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIg ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIh A ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIh B ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIh C ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIh ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIz A ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIz B ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIz C ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIz ')">AMU</xsl:when
             <!-- XII -->
             <xsl:when test="starts-with ($signatur,'XII A ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XII B ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XII C ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XII ')">AMU</xsl:when>
             <!-- XIII -->
             <xsl:when test="starts-with ($signatur,'XIII aA ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIII aB ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIII aC ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIII B ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIII bA ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIII bB ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIII bC ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIII C ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIII cA ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIII cB ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIII cC ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIII dA ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIII dB ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIII dC ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIII eA ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIII eB ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIII eC ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIII fA ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIII fB ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIII fC ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIII kA ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIII kB ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIII kC ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIIIa A ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIIIa B ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIIIa C ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIIIb A ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIIIb B ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIIIb C ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIIIc A ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIIIc B ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIIIc C ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIIId A ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIIId B ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIIId C ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIIIe A ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIIIe B ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIIIe C ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIIIf A ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIIIf B ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIIIf C ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIIIk A ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIIIk B ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIIIk C ')">AMLB</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIII ')">AMU</xsl:when>
             <!-- XIV -->
             <xsl:when test="starts-with ($signatur,'XIV A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIV aA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIV aB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIV aC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIV B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIV bA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIV bB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIV bC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIV ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIVa A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIVa B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIVa C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIVA ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIVb A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIVb B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIVb C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIVB ')">AMU</xsl:when>
             <!-- XIX -->
             <xsl:when test="starts-with ($signatur,'XIX A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIX aA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIX aB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIX aC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIX B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIX C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIX cA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIX cC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIX dA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIX dB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIX dC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIX eB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIX eC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIX ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIXa A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIXA ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIXb A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIXB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIXc A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIXC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIXd A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIXd ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIXe A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XIXe ')">1OGW</xsl:when>
             <!-- XV -->
             <xsl:when test="starts-with ($signatur,'xv A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'xv B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'xv C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'xv ')">AMU</xsl:when>
             <!-- XVI -->
             <xsl:when test="starts-with ($signatur,'XVI A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVI aA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVI aB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVI aC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVI C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVI dA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVI dB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVI dC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVI eA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVI eB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVI eC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVI fA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVI fB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVI fC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVI gA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVI gB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVI gC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVI mA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVI mB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVI mC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVI ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIa A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIa B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIa C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIA ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIb A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIb B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIb C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIB ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIc A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIc B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIc C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIC ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVId A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVId B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVId C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVId ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIe A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIe B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIe C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIe ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIf A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIf B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIf C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIf ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIg A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIg B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIg C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIg ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIm A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIm B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIm C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIm ')">AMU</xsl:when>
             <!-- XVII  -->
             <xsl:when test="starts-with ($signatur,'XVIIA ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIB ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVII ')">AMU</xsl:when>
             <!-- XVIII -->
             <xsl:when test="starts-with ($signatur,'XVIII A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII aA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII aB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII aC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII bA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII bB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII bC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII cA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII cB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII cC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII dA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII dB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII dC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII eA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII eB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII eC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII fA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII fB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII fC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII gA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII gB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII gC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII hA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII hB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII hC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII iA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII iB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII iC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII kA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII kB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII kC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII lA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII lB ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII lC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII mA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII mC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII nA ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII nC ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIII ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIA ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIa A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIa B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIa C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIa C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIA ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIb A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIb B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIb C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIB ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIc A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIc B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIc C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIC ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIId A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIId B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIId C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIId ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIe A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIe B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIe C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIe ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIf A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIf B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIf C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIf ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIg A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIg B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIg C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIg ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIh A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIh B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIh C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIh ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIi A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIi B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIi C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIi ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIk A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIk B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIk C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIk ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIl A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIl B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIl C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIl ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIm A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIm B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIm C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIm ')">AMU</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIn A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIn B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIn C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XVIIIn ')">AMU</xsl:when>
             <!-- XX -->
             <xsl:when test="starts-with ($signatur,'XX A ')">2OGWSMSLS</xsl:when>
             <xsl:when test="starts-with ($signatur,'XX B ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XX C ')">1OGW</xsl:when>
             <xsl:when test="starts-with ($signatur,'XX ')">AMU</xsl:when>
             <!-- Medienzentrum Hardware -->
             <xsl:when test="starts-with ($signatur,'Set')">MZ</xsl:when>
             <xsl:when test="starts-with ($signatur,'USB')">MZ</xsl:when>
             <xsl:when test="starts-with ($signatur,'Aud')">MZ</xsl:when>
             <xsl:when test="starts-with ($signatur,'AV')">MZ</xsl:when>
             <xsl:when test="starts-with ($signatur,'Beam')">MZ</xsl:when>
             <xsl:when test="starts-with ($signatur,'Head')">MZ</xsl:when>
             <xsl:when test="starts-with ($signatur,'Kam')">MZ</xsl:when>
             <xsl:when test="starts-with ($signatur,'Konf')">MZ</xsl:when>
             <xsl:when test="starts-with ($signatur,'Kopf')">MZ</xsl:when>
             <xsl:when test="starts-with ($signatur,'Lap')">MZ</xsl:when>
             <xsl:when test="starts-with ($signatur,'Laut')">MZ</xsl:when>
             <xsl:when test="starts-with ($signatur,'Lein')">MZ</xsl:when>
             <xsl:when test="starts-with ($signatur,'Mikr’)">MZ</xsl:when>
             <xsl:when test="starts-with ($signatur,'PC')">MZ</xsl:when>
             <xsl:when test="starts-with ($signatur,'Screen')">MZ</xsl:when>
             <xsl:when test="starts-with ($signatur,'Stat')">MZ</xsl:when>
             <!-- Kleinteile -->
             <xsl:when test="starts-with ($signatur,'Behwc')">KLEIN</xsl:when>
             <xsl:when test="starts-with ($signatur,'Korb')">KLEIN</xsl:when>
             <xsl:when test="starts-with ($signatur,'Schliessf')">KLEIN</xsl:when>
             <xsl:when test="starts-with ($signatur,'Schluessel')">KLEIN</xsl:when>
             <xsl:when test="starts-with ($signatur,'Trans')">KLEIN</xsl:when>
             <xsl:otherwise>1OGW</xsl:otherwise>
           </xsl:choose>
         </xsl:when>

         <xsl:when test="$abt='888'">
           <xsl:choose>
            <xsl:when test="starts-with ($standort,'Handapparat ')">HANDAPP</xsl:when>
             <xsl:otherwise>MAG</xsl:otherwise>
           </xsl:choose>
         </xsl:when>
         <xsl:when test="$abt='433'">BK</xsl:when>
         <xsl:when test="$abt='038'">BKK</xsl:when>
         <xsl:when test="$abt='100'">BMI</xsl:when>
         <xsl:when test="$abt='130'">BC</xsl:when>
         <xsl:when test="$abt='151'">BB</xsl:when>
         <xsl:when test="$abt='301'">BRW</xsl:when>
         <xsl:when test="$abt='331'">BW</xsl:when>
         <xsl:when test="$abt='370'">BPsych</xsl:when>
         <xsl:when test="$abt='381'">BT</xsl:when>
         <xsl:when test="$abt='424'">DSA</xsl:when>
         <xsl:when test="$abt='510'">BR</xsl:when>
         <xsl:when test="$abt='573'">ZMB</xsl:when>
         <xsl:otherwise>1OGW</xsl:otherwise>
       </xsl:choose>
      </permanentLocationId>
  </xsl:template>

<!-- MR aus ous205_lnic.asc -->
<!-- ay=2=Fernleihe ohne Verlängerung, ay=4=Keine Medien -->
  <xsl:template match="permanentLoanTypeId">
    <xsl:variable name="loantype" select="key('original',.)/datafield[@tag='209A']/subfield[@code='d']"/>
    <permanentLoanTypeId>
      <xsl:choose>
        <xsl:when test=".='u'">0 u Ausleihbar</xsl:when>
        <xsl:when test=".='c'">0 c Ausleihbar</xsl:when>
        <xsl:when test=".='b'">1 b Kurzausleihe</xsl:when>
        <xsl:when test=".='s'">3 s Präsenzbestand</xsl:when>
        <xsl:when test=".='d'">3 d Präsenzbestand</xsl:when>
        <xsl:when test=".='i'">5 i Nur für den Sonderlesesaal</xsl:when>
        <xsl:when test=".='f'">6 f Kurzausleihe 8 Tage</xsl:when>
        <xsl:when test=".='o'">7 o Nur für das Medienzentrum</xsl:when>
        <xsl:when test=".='e'">8 e Verlust/vermisst</xsl:when>
        <xsl:when test=".='z'">8 z Verlust/vermisst</xsl:when>
        <xsl:when test=".='a'">9 a Nicht ausleihbar</xsl:when>
        <xsl:when test=".='g'">9 g Nicht ausleihbar</xsl:when>
        <!-- <xsl:otherwise>0 u Ausleihbar</xsl:otherwise>  wg. Zs ohne $d? -->
        <xsl:otherwise>9 o Ausleihstatus unbekannt</xsl:otherwise> <!-- damit Sonderfaelle auffallen -->
      </xsl:choose>
    </permanentLoanTypeId>
  </xsl:template>


  <xsl:template match="discoverySuppress"> <!-- uses 208@$b (und/oder Kat. 247E/XY ?) -->
    <discoverySuppress>
      <!-- MZ: <xsl:value-of select="(substring(., 1, 1) = 'g') or (substring(., 2, 1) = 'y') or (substring(., 2, 1) = 'z')"/>
           DA: nicht anzeigen: Pos.2: f, p, y, z
           MR: nicht anzeigen Pos 1 a Pos 2 y (aka ay)
       -->
      <xsl:value-of select="(substring(., 2, 1) = 'y')"/>
    </discoverySuppress>
  </xsl:template>

  <!-- Parsing call number for prefix - optional -->

  <xsl:template name="prefix"> <!-- default, nutzt °,@  -->
    <xsl:param name="cn"/>
    <xsl:param name="cnprefixelement"/>
    <xsl:param name="cnelement"/>
    <xsl:variable name="cnprefix">
      <xsl:choose>
        <xsl:when test="contains($cn,'°')">
          <xsl:value-of select="concat(substring-before($cn,'°'),'°')"/>
        </xsl:when>
        <xsl:when test="contains($cn,'@')">
          <xsl:value-of select="substring-before($cn,'@')"/>
        </xsl:when>
      </xsl:choose>
    </xsl:variable>
    <xsl:message>Debug: <xsl:value-of select="$cnelement"/> Prefix "<xsl:value-of select="$cnprefix"/>"</xsl:message>
    <xsl:if test="string-length($cnprefix)>0">
      <xsl:element name="{$cnprefixelement}">
        <xsl:value-of select="normalize-space(translate($cnprefix,'@',''))"/>
      </xsl:element>
    </xsl:if>
    <xsl:element name="{$cnelement}">
      <xsl:value-of select="normalize-space(translate(substring-after($cn,$cnprefix),'@',''))"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="callNumber">
    <xsl:call-template name="prefix">
      <xsl:with-param name="cn" select="."/>
      <xsl:with-param name="cnprefixelement" select="'callNumberPrefix'"/>
      <xsl:with-param name="cnelement" select="'callNumber'"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="itemLevelCallNumber">
    <xsl:call-template name="prefix">
      <xsl:with-param name="cn" select="."/>
      <xsl:with-param name="cnprefixelement" select="'itemLevelCallNumberPrefix'"/>
      <xsl:with-param name="cnelement" select="'itemLevelCallNumber'"/>
    </xsl:call-template>
  </xsl:template>

</xsl:stylesheet>
