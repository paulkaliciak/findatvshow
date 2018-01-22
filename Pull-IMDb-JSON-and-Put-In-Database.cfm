<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>This is an Update in Git</title>
</head>

<body>
    <h2>Putting IMDb Data into Database</h2>
    <h3>First, get a list from the Excel spreadsheet of shows needing to be queried and put in our database:</h3>
    <cfspreadsheet query="TheData" headerrow="1" action="read" src="D:\HostingSpaces\findatvs\findatvshow.ca\wwwroot\datafiles\ListofTVShowsforDatabase.xls">
    <cfloop query="TheData" startrow="2" endrow="#TheData.RecordCount#">
        <CFIF #TheData.EnteredinDB# IS "No">
            <cfhttp url="http://www.omdbapi.com/?i=#ImdbID#&plot=full&apikey=42052a7d" result="Answer">
            </cfhttp>
            <CFSET queryresults = deserializeJSON(Answer.FileContent)>
            <cfoutput>#queryresults.Title#</cfoutput><br>        
            <cfoutput>#queryresults.Year#</cfoutput><br>
            <cfoutput>#queryresults.Rated#</cfoutput><br>
            <cfoutput>#queryresults.Released#</cfoutput><br>
            <cfoutput>#queryresults.Runtime#</cfoutput><br>
            <cfoutput>#queryresults.Genre#</cfoutput><br>
            <cfoutput>#queryresults.Director#</cfoutput><br>
            <cfoutput>#queryresults.Writer#</cfoutput><br>
            <cfoutput>#queryresults.Actors#</cfoutput><br>
            <cfoutput>#queryresults.Plot#</cfoutput><br>
            <cfoutput>#queryresults.Language#</cfoutput><br>
            <cfoutput>#queryresults.Country#</cfoutput><br>
            <cfoutput>#queryresults.Awards#</cfoutput><br>
            <cfoutput>#queryresults.Poster#</cfoutput><br>
            <CFSET RatingsArray = ArrayNew(2)>
            <CFSET RatingsArray = queryresults.Ratings>
            <!--- next 2 CFIF are because ratings aren't always there --->    
            <CFIF arrayLen(RatingsArray) IS NOT 0>
                <cfoutput>#RatingsArray[1].Source#</cfoutput><br>
            </CFIF>
            <CFIF arrayLen(RatingsArray) IS NOT 0>
                <cfoutput>#RatingsArray[1].Value#</cfoutput><br>
            </cfif>
            <cfoutput>#queryresults.Metascore#</cfoutput><br>
            <cfoutput>#queryresults.imdbRating#</cfoutput><br>
            <cfoutput>#queryresults.imdbVotes#</cfoutput><br>
            <cfoutput>#queryresults.imdbID#</cfoutput><br>
            <cfoutput>#queryresults.Type#</cfoutput><br>
            <cfoutput>#queryresults.totalSeasons#</cfoutput><br>
            <cfoutput>#queryresults.Response#</cfoutput><br>
        </CFIF>
        <p>
        <p>
    </cfloop>
</body>
</html>
