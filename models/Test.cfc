<cfcomponent extends="Model">
	
	<cffunction name="init">
		<cfscript>
		
			#validatesPresenceOf(property="first_name" message="First Name is required.")#
			#validatesPresenceOf(property="password" message="Password is required")#
			#validatesConfirmationOf(property="password" message="Your passwords didnt match!")#
		</cfscript>
	</cffunction>
	
</cfcomponent>