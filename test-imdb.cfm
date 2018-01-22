<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Untitled Document</title>
</head>

<body>
    <h2>Test of pulling data from List Of Shows table</h2>
    <cfquery datasource="TVShows" name="GetList">SELECT * FROM ListofTVShows</cfquery>
    <cfoutput query="GetList">#ShowName#<br>Imdb: #IMDbID#<br></cfoutput>
    
</body>
</html>
