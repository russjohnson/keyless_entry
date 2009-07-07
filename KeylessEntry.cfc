<cfcomponent output="false">

  <cffunction name="init">
    <cfset this.version = "0.9.2">
    <cfreturn this>
  </cffunction>
  
  <cffunction name="loginRequired">
		<cfif Not structKeyExists(session,"currentUser")>
			<cfset flashInsert(error="You do not have permissions to do that!")>
			<cfset redirectTo(controller="sessions", action="new")>
		</cfif>
	</cffunction>
	
	<cffunction name="loginProhibited">
		<cfif structKeyExists(session,"currentUser")>
			<cfset flashInsert(error="You are logged in, you cant do that!")>
			<cfset redirectTo(route="home")>
		</cfif>
	</cffunction>
	
	<!---
	 TODO Might look to add a function for checking if the user is the current user
	--->

</cfcomponent>