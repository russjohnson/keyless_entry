<cfcomponent extends="wheels.Controller">
	
	<cffunction name="restrictAccess">
		<cfif Not isDefined("session.currentUser")>
			<cfset redirectTo(controller="sessions", action="new")>
		</cfif>
	</cffunction>
	
</cfcomponent>
