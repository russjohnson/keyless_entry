<h1>Index</h1>
<p><cfoutput>
	<cfif structKeyExists(cookie,'app.rememberme')>#cookie.app.rememberme#</cfif>
</cfoutput></p>
<p><cfoutput>#linkTo(text="Click here", route="logout")#</cfoutput> to log out.</p>