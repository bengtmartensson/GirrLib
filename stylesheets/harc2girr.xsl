<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet
    xmlns:girr="http://www.harctoolbox.org/schemas/girr.xsd"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.harctoolbox.org/schemas/girr.xsd http://www.harctoolbox.org/schemas/girr.xsd"
    version="1.0">
    <xsl:output method="xml"/>
    <!--xsl:preserve-space elements="remotes"/-->
    <xsl:template match="device">
        <xsl:processing-instruction name="xml-stylesheet">type="text/xsl" href="simplehtml.xsl"</xsl:processing-instruction>
        <xsl:text>
        </xsl:text>
        <remotes xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 title="Translated by harc2girr"
                 girrVersion="1.0"
                 xmlns:girr="http://www.harctoolbox.org/schemas/girr.xsd"
                 xsi:noNamespaceSchemaLocation="http://www.harctoolbox.org/schemas/girr.xsd">
            <!--xsl:text>
            </xsl:text-->
            <!--adminData>
                <creationData creatingUser="bengt" creationDate="2015-09-11_19:45:08" source="IrScrutinizer parametrized table" tool="IrScrutinizer" tool2="DecodeIR" tool2Version="2.45" toolVersion="1.1.3"/>
            </adminData-->
            <!--xsl:text>
            </xsl:text-->
            <xsl:apply-templates select="remote"/>
            <remote>
                <xsl:attribute name="deviceClass">
                    <xsl:value-of select="@type"/>
                </xsl:attribute>
                <xsl:attribute name="manufacturer">
                    <xsl:value-of select="@vendor"/>
                </xsl:attribute>
                <xsl:attribute name="model">
                    <xsl:value-of select="@model"/>
                </xsl:attribute>
                <xsl:attribute name="name">
                    <xsl:value-of select="@name"/>
                </xsl:attribute>
                <!-- remoteName="unknown_remote"-->
                <xsl:apply-templates select="commandset"/>
            </remote>
        </remotes>
    </xsl:template>

    <xsl:template match="commandset[command|commandgroup]">
        <xsl:text>
        </xsl:text>
        <commandSet>
            <xsl:attribute name="name">
                <xsl:value-of select="@protocol"/>
                <xsl:text>_</xsl:text>
                <xsl:value-of select="@deviceno"/>
                <xsl:text>_</xsl:text>
                <xsl:value-of select="@subdevice"/>
            </xsl:attribute>
            <xsl:text>
            </xsl:text>
            <parameters>
                <xsl:attribute name="protocol">
                    <xsl:value-of select="@protocol"/>
                </xsl:attribute>
                <parameter>
                    <xsl:attribute name="name">D</xsl:attribute>
                    <xsl:attribute name="value">
                        <xsl:value-of select="@deviceno"/>
                    </xsl:attribute>
                </parameter>
                <xsl:apply-templates select="@subdevice"/>
            </parameters>
            <xsl:apply-templates select="command|commandgroup/command"/>
            <xsl:text>
            </xsl:text>
        </commandSet>
    </xsl:template>

    <xsl:template match="commandset[@type!='ir']"/>
    
    <xsl:template match="command">
        <xsl:text>
        </xsl:text>
        <command>
            <xsl:attribute name="name">
                <xsl:value-of select="@cmdref"/>
            </xsl:attribute>
            <xsl:attribute name="F">
                <xsl:value-of select="@cmdno"/>
            </xsl:attribute>
            <xsl:apply-templates select="@remark"/>
        </command>
    </xsl:template>

    <xsl:template match="@remark">
        <xsl:attribute name="comment">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>

    <xsl:template match="@subdevice">
        <parameter name="S">
            <xsl:attribute name="value">
                <xsl:value-of select="."/>
            </xsl:attribute>
        </parameter>
    </xsl:template>

</xsl:stylesheet>
