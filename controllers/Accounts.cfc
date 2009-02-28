<cfcomponent extends="controller">

	<cffunction name="init">
		<!--- <cfset beforeFilter(filters="restrictAccess", except="login,authorize")> --->
	</cffunction>

	<cffunction name="restrictAccess">
		<cfif Not isDefined("session.user_id")>
			<cfset redirectTo(action="login")>
		</cfif>
	</cffunction>

	<cffunction name="index">

	</cffunction>

	<cffunction name="login">

	</cffunction>

	<cffunction name="logout">
		<cfset StructDelete(session, "user_id")>
		<cfset session.flash.message = "You have successfully logged out!">
		<cfset redirectTo(action="login")>
	</cffunction>

</cfcomponent>