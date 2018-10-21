# Final project DT074G - XML
Welcome to the vize1500 TV-guide, created as a final project in DT074G - XML. The program takes different xmltv-files stored in the subfolder channels and combines them into "channels.xml" using the transformation in "channels.xsl". The new file is then transformed to xhtml using xquery and the file "tv-guide-generator.xql", this generates the webpage tv-guide.html where the tv channels are presented. Logos for the channel are stored in the subfolder logos.

## Usage

The following programs are required to generate the project:
```
xsltproc, basex, xmllint
```

First generate "channels.xml" by using the command:
```
xsltproc -o channels.xml channels.xsl channels/svt1.svt.se_2018-10-15.xml 
```

Then generate "tv-guide.html" using:
```
basex -o tv-guide.html tv-guide-generator.xql
```

Validate "channel.xml" with:
```
xmllint --noout --schema channels.xsd channels.xml
```

