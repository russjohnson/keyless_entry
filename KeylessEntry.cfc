<cfcomponent output="false">

  <cffunction name="init">
    <cfset this.version = "0.9.2">
    <cfreturn this>
  </cffunction>
  
  <cffunction name="loginRequired">
		<!---
			TODO : there should be a check here for the rememberme cookie
		--->
		<cfif Not structKeyExists(session,"currentUser")>
			<cfset flashInsert(error="You do not have permissions to do that!")>
			<cfset redirectTo(controller="sessions", action="new")>
		</cfif>
	</cffunction>
	
	<cffunction name="loginProhibited">
		<cfif structKeyExists(session,"currentUser")>
			<cfset flashInsert(error="You are logged in, you cant do that!")>
			<cfset redirectTo(controller="users", action="show")>
		</cfif>
	</cffunction>
    
  <cffunction name="passwordAuthentication">
		<cfargument name="login" type="any" required="true" />
		<cfargument name="password" type="any" required="true" />
		
		<cfset authUser = model("user").findOneByUsername(arguments.login)>
			
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
			<cfset flashInsert(error="Login failed, please try again.")>
			<cfset redirectTo(action="new")>
		</cfif>
	</cffunction>
	
	<cffunction name="failedLogin">
		<!---
			TODO : would like to add a method call here to update a failed login table...
		--->
		<cfset flashInsert(error="Login failed, please try again - i failed you")>
		<cfset redirectTo(action="new")>
	</cffunction>

</cfcomponent>