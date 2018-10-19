xquery version "3.0" encoding "UTF-8";

<html>

<!-- Head -->
<head>
   <title>TV-guide</title>
   <link rel="stylesheet" type="text/css" href="style.css" />
   <meta charset="utf-8" />
</head>


<!-- Body -->
<body>

<div id="main-container">

    <!-- Page header -->
    <div id="header">
        <h1>The vize1500 TV-guide</h1>
        <h2>By: Viktor Zetterström</h2>
        <!-- Button for xsl-fo to pdf -->
        <button id="pdf-button">Click me to generate .pdf</button>

    </div>

    <!-- Channels -->
    <div id="channels">
        {
            for $channel in doc("channels.xml")//channel return
                <div class="channel">
                    <img alt="Channel logo" src="{$channel/logo-path}"/>

                    <h2></h2>
                    <li>
                {
                    for $programme in $channel//programme return
                        <ul>{$programme/title/text()}</ul>
                }
                    </li>
                </div>
        }
    </div>

</div>

</body>
</html>