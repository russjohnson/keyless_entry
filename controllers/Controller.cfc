<cfcomponent extends="wheels.Controller">
	
	<cffunction name="restrictAccess">
		<cfif Not isDefined("session.currentUser")>
			<cfset flashInsert(error="You do not have permissions to do that!")>
			<cfset redirectTo(controller="sessions", action="new")>
		</cfif>
	</cffunction>
	
</cfcomponent>
