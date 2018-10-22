xquery version "3.0" encoding "UTF-8";
declare default element namespace "http://www.w3.org/1999/xhtml";
declare namespace v="https://vize1500";
declare option output:encoding "UTF-8";
declare option output:method "xhtml";
declare option output:doctype-public "-//W3C//DTD XHTML 1.0 Strict//EN";
declare option output:doctype-system "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd";
declare option output:omit-xml-declaration "no";


(: This file generates a xhtml-page based on channels.xml, see README.md for info on how
 to generate the page :)

<html>

<!-- Head -->
<head>
   <title>TV-guide</title>
   <link rel="stylesheet" type="text/css" href="style.css" />
</head>


<!-- Body -->
<body>

<div id="main-container">

  <!-- Page header -->
  <div id="header">
    <h1>{doc("channels.xml")//v:tv-guide-title/text()}</h1>

    {(: Date, checks first programme for start time and uses substring to extract date. :)}
    <h2 class="date">
      {substring( (doc("channels.xml")//@start)[1], 1, 4)} -
      {substring( (doc("channels.xml")//@start)[1], 5, 2)} -
      {substring( (doc("channels.xml")//@start)[1], 7, 2)}
    </h2>


    <!-- Button for xsl-fo to pdf -->
    <button id="pdf-button">Click me to generate .pdf</button>


  </div>

  <!-- Channels -->
  <div id="channels">
    {
      (: For each channel :)
      for $channel in doc("channels.xml")//v:channel return
        <div class="channel">

          {(: Insert channel logo :)}
          <img alt="Channel logo" src="{$channel/v:logo-path}"/>

          {(: Create table with date, and programmes on right and times on left. :)}
          <table>
            {
              (: Column with programme name, category and year, and start time :)
              for $programme in $channel//v:programme return
                <tr>
                  <td>
                    <div class="programme">
                    { (: If a movie, add Movie(date) :)
                    if (($programme/v:category)/text() = 'movie') then
                      <span>Movie ({$programme/v:date/text()}) - </span>
                    else ()}
                    {$programme/v:title/text()}
                    </div>

                    <div class="description">
                      {$programme/v:desc/text()}
                    </div>
                  </td>
                  <td class="start-time programme">
                    {(: Use substring to get start time from "start"-attribute :)}
                    {substring($programme/@start, 9, 2)}:{substring($programme/@start, 11, 2)}
                  </td>
                </tr>
            }
          </table>
        </div>
    }
  </div>

  <p id="footer-text">Created by {doc("channels.xml")//v:tv-guide-creator/text()} for the course DT074G at Mittuniversitetet.</p>
</div>

</body>
</html>