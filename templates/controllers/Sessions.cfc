<cfcomponent extends="controller">

	<cffunction name="new" hint="Displays the login form">
	</cffunction>
	
	<cffunction name="create">
		<cfif params.login is "" or params.password is "">
			<cfset flashInsert(error="Login failed, please try again")>
			<cfset redirectTo(action="new")>
		<cfelse>
			<cfset passwordAuthentication(params.login, params.password) />
		</cfif>
	</cffunction>
	
	<cffunction name="delete">
		<!--- todo: need to check for the remember me flag here and delete cookie if needed --->
		<cfset structDelete(session, 'currentUser') />
		<cfset flashInsert(message='You have been logged out') />
		<cfset redirectTo(action="new") />
	</cffunction>
	
</cfcomponent>