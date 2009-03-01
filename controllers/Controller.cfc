<cfcomponent extends="wheels.Controller">
	
	<cffunction name="loginRequired">
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
	
</cfcomponent>
