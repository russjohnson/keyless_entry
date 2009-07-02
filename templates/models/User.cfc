<cfcomponent extends="Model">

	<cffunction name="init">
	  <cfset validatesPresenceOf(property="username", message="Username is required")>
		<cfset validatesPresenceOf(property="email" , message="Email is required.")>
		<cfset validatesPresenceOf(property="password", message="Password is required")>
		<cfset validatesPresenceOf(property="firstName" , message="First name is required")>
		<cfset validatesPresenceOf(property="lastName" , message="Last name is required")>
		<cfset validatesUniquenessOf(property="username", message="That username that is already in our system.", when="onCreate")>
		<cfset validatesUniquenessOf(property="email", message="That email already exists.")>
		<cfset validatesConfirmationOf(property="password",message="The passwords you entered did not match.") />
	  
		<!--- this callback is for encypting the password after validation and before saving the user --->
		<cfset beforeCreate("setPassword") />
	</cffunction>
	
	
	<!--- KEYLESS ENTRY METHODS --->
	
	<cffunction name="setPassword">
		<cfif structKeyExists(this,"password")>
	    	<cfset this.password = hash(this.password, "SHA-512") /> 			
		</cfif>
	</cffunction>
	
	<cffunction name="isPassword">
	    <cfargument name="password" type="string" required="yes">
	    <cfreturn (compare(hash(arguments.password, "SHA-512"), this.password) EQ 0) />
	</cffunction>
	
	<cffunction name="hasRole">
		<cfargument name="role" type="any" required="true" />
		
		<cfif listFind(this.assignedRoles, arguments.role)>
			<cfreturn true>
		<cfelse>
			<cfreturn false>
		</cfif>
	</cffunction>
	
</cfcomponent>
