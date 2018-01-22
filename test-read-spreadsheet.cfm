<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Untitled Document</title>
</head>

<body>
    <h2>Test of retrieving data from Excel spreadsheet</h2>
    <cfspreadsheet query="TheData" headerrow="1" action="read" src="D:\HostingSpaces\findatvs\findatvshow.ca\wwwroot\datafiles\ListofTVShowsforDatabase.xls">
    <table width="100%" border="1">
        <cfloop query="TheData">
            <tr>
                <cfoutput><td>#Showname#</td><td>#ImdbID#</td><td>#USNetwork#</td><td>#CanadianNetwork#</td><td>#HowAccess#</td><td>#CanadianURL#</td></cfoutput>
            </tr>
        </cfloop>
        
        </table>
</body>
</html>
