<cfcomponent extends="controller">

	<cffunction name="new" hint="Displays the login form">
	</cffunction>
	
	<cffunction name="create">
		<cfif params.login is "" or params.password is "">
			<cfset flashInsert(error="Login failed, please try again")>
			<cfset redirectTo(action="new")>
		<cfelse>
			<cfset password_authentication(params.login, params.password) />
		</cfif>
	</cffunction>
	
	<cffunction name="delete">
		<!--- todo: need to check for the remember me flag here and delete cookie if needed --->
		<cfset structDelete(session, 'currentUser') />
		<cfset flashInsert(message='You have been logged out') />
		<cfset redirectTo(action="new") />
	</cffunction>
	
	<!--- private functions --->
	
	<cffunction name="password_authentication" access="private">
		<cfargument name="login" type="any" required="true" />
		<cfargument name="password" type="any" required="true" />
		
		<!--- right here is where we want to decrypt the password value --->
		
		<!--- todo: need to look into moving the authentication method into the user model --->
		
		<cftry>
			<cfset authUser = model("user").findOneByLogin(arguments.login)>
				
			<cfcatch type="Wheels.RecordNotFound">
				<cfset flashInsert(error="Login failed, please try again")>
				<cfset redirectTo(action="new")>
			</cfcatch>
		</cftry>
		
		<cfif authUser.password is arguments.password>
			<cfset session.currentUser = authUser>
			<cfif structKeyExists(params,"rememberMe")>
				<cfcookie name="app.rememberme" value="true" expires="14" />
			</cfif>
			<cfset redirectTo(controller="snippets", action="index")>
		<cfelse>
			<cfset flashInsert(error="Login failed, please try again")>
			<cfset redirectTo(action="new")>
		</cfif>
	</cffunction>
	
</cfcomponent>