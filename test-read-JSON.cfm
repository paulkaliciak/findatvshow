<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Untitled Document</title>
</head>

<body>
    <h2>Putting IMDb Data into Database</h2>
    <h3>First, get a list from the Excel spreadsheet of shows needing to be queried and put in our database:</h3>
    
    <cfhttp url="http://www.omdbapi.com/?i=tt4158110&plot=full&apikey=42052a7d" result="Answer">
    </cfhttp>
    <CFSET queryresults = deserializeJSON(Answer.FileContent)>
    
    <!--- this is just for fun, to see what the actual headings are in the JSON --->
    <CFSET ResultsArray = structKeyArray(queryresults)>
    <cfloop from="1" to="#ArrayLen(ResultsArray)#" index="i">
        <cfoutput>
             #ResultsArray[i]#<br>
        </cfoutput>
    </cfloop>
        <p></p>
    <!--- END JUST FOR FUN --->

    <!---THIS IS THE REAL CODE--->
    <CFLOOP>
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
        <cfoutput>#RatingsArray[1].Source#</cfoutput><br>
        <cfoutput>#RatingsArray[1].Value#</cfoutput><br>
            
        <cfoutput>#queryresults.Metascore#</cfoutput><br>
        <cfoutput>#queryresults.imdbRating#</cfoutput><br>
        <cfoutput>#queryresults.imdbVotes#</cfoutput><br>
        <cfoutput>#queryresults.imdbID#</cfoutput><br>
        <cfoutput>#queryresults.Type#</cfoutput><br>
        <cfoutput>#queryresults.totalSeasons#</cfoutput><br>
        <cfoutput>#queryresults.Response#</cfoutput><br>
    </CFLOOP> 


</body>
</html>
