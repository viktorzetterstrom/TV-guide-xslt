# Final project DT074G - XML
Prerequisites:
```
xsltproc, basex
```

First generate channels.xml by using the command:
```
xsltproc -o channels.xml channels.xsl channels/svt1.svt.se_2018-10-15.xml 
```

Then generate tv-guide.html using:
```
basex -o tv-guide.html tv-guide-generator.xql
```