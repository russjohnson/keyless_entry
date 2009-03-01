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
	
	<!--- private functions --->
	
	<cffunction name="passwordAuthentication" access="private">
		<cfargument name="login" type="any" required="true" />
		<cfargument name="password" type="any" required="true" />
		
		<!--- todo: need to look into moving the authentication method into the user model --->
		
		<cfset authUser = model("user").findOneByLogin(arguments.login)>
			
		<cfif isboolean(authUser) and Not authUser>
			<cfset failedLogin()>
		</cfif>
		
		<cfif authUser.isPassword(arguments.password)>
			<cfset session.currentUser = authUser>
			<cfif structKeyExists(params,"rememberMe")>
				<cfcookie name="app.rememberme" value="true" expires="14" />
			</cfif>
			<cfset redirectTo(controller="accounts", action="index")>
		<cfelse>
			<cfset flashInsert(error="Login failed, please try again")>
			<cfset redirectTo(action="new")>
		</cfif>
	</cffunction>
	
	<cffunction name="successfulLogin" access="private">
		
	</cffunction>
	
	<cffunction name="failedLogin" access="private">
		<!---
			TODO : would like to add a method call here to update a failed login table...
		--->
		<cfset flashInsert(error="Login failed, please try again")>
		<cfset redirectTo(action="new")>
	</cffunction>
	
</cfcomponent>