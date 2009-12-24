#include "package.h"

/* The comment below is obviously not true if you're reading package.bat.pp right now. */
REM This file is automatically generated from package.bat.pp.
REM Do not edit.

REM This must be run from the $(SolutionDir)!

/* Convenient for debugging */
@echo on

del "<xsl:call-template name="packagedir"/>\<xsl:call-template name="binaryzipfile"/>"

cd <xsl:call-template name="releasedir"/>
"..\..\<xsl:call-template name="sevenzip"/>" a -tzip -mx9 "..\..\<xsl:call-template name="packagedir"/>\<xsl:call-template name="binaryzipfile"/>"<xsl:for-each select="binaryfiles/file"> "<xsl:value-of select="."/>"</xsl:for-each>
if errorlevel 1 goto :oops
cd ..\..
rmdir /S /Q temp

del "<xsl:call-template name="packagedir"/>\<xsl:call-template name="sourcezipfile"/>"
"<xsl:call-template name="sevenzip"/>" a -tzip -mx9 "<xsl:call-template name="packagedir"/>\<xsl:call-template name="sourcezipfile"/>"<xsl:for-each select="sourcefiles/file"> "<xsl:value-of select="."/>"</xsl:for-each>
if errorlevel 1 goto :oops

goto :done

:oops
echo Some kind of error occurred when creating distribution ZIPs

:done
