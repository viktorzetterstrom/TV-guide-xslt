<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


    <!-- Set output to xml -->
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>


    <!-- Variables -->
    <!-- Channel and logo paths -->
    <xsl:variable name="svt1">channels/svt1.svt.se_2018-10-15.xml</xsl:variable>
    <xsl:variable name="svt2">channels/svt2.svt.se_2018-10-15.xml</xsl:variable>
    <xsl:variable name="kunskapskanalen">channels/kunskapskanalen.svt.se_2018-10-15.xml</xsl:variable>
    <xsl:variable name="svt1-logo">logos/svt1.svt.se.png</xsl:variable>
    <xsl:variable name="svt2-logo">logos/svt2.svt.se.png</xsl:variable>
    <xsl:variable name="kunskapskanalen-logo">logos/kunskapskanalen.svt.se.png</xsl:variable>


    <!-- Main template -->
    <xsl:template match="/">
        <tv-guide>

            <!-- General tv-guide info -->
            <tv-guide-title>The vize1500 TV-guide</tv-guide-title>
            <tv-guide-creator>Viktor Zetterström</tv-guide-creator>


            <!-- Channels imported from xml-files in subfolder channels -->
            <!-- SVT 1 -->
            <channel>
                <channel-name>svt1</channel-name>
                <logo><xsl:value-of select="$svt1-logo" /></logo>
                <xsl:apply-templates select="document($svt1)/tv" />
            </channel>

            <!-- SVT2 -->
            <channel>
                <channel-name>svt2</channel-name>
                <logo><xsl:value-of select="$svt1-logo" /></logo>
                <xsl:apply-templates select="document($svt2)/tv" />
            </channel>

            <!-- Kunskapskanalen -->
            <channel>
                <channel-name>kunskapskanalen</channel-name>
                <logo><xsl:value-of select="$svt1-logo" /></logo>
                <xsl:apply-templates select="document($kunskapskanalen)/tv" />
            </channel>


        </tv-guide>
    </xsl:template>

    <!-- Template for channel -->
    <xsl:template match="tv">
        <!-- Get all programmes -->
        <xsl:for-each select="//programme">
            <xsl:apply-templates select="." />
        </xsl:for-each>
    </xsl:template>

    <!-- Template for programmes -->
    <xsl:template match="programme">
        <programme>
            <title><xsl:value-of select="title" /></title>
            <category><xsl:value-of select="category" /></category>
        </programme>
    </xsl:template>

</xsl:stylesheet>