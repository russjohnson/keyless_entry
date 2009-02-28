<cfcomponent extends="Model">

	<!--- All initialization related tasks are done in the "init" function which is run the first time the model is requested. --->
	<cffunction name="init">
		<cfset validatesPresenceOf(property="login", message="Username is required")>
		<cfset validatesPresenceOf(property="password", message="Password is required")>
		<cfset validatesConfirmationOf(property="password",message="The passwords you entered did not match.") />
		<cfset validatesUniquenessOf(property="login", message="You have entered a username that is already in our system.", when="onCreate")>
		<!--- this callback is for encypting the password after validation and before saving the user 
		<cfset beforeSave("setPassword") /> --->
	</cffunction>
	
	<cffunction name="setPassword">
		<!---><cfif structKeyExists(this,"password")>
	    	<cfset this.password = hash(this.password, "SHA-512") /> 			
		</cfif>--->
		<cfset i = 1/>
	</cffunction>
	
	<cffunction name="isPassword">
	    <cfargument name="password" type="string" required="yes">
	    <cfreturn (compare(hash(arguments.password, "SHA-512"), this.password) EQ 0) />
	</cffunction>
	
	<!--- fixme: this method does not work here for some reason but belongs here
	<cffunction name="authenticate" hint="This function authenticates the user after the password has been decrypted" >
		<cfargument name="login" type="any" required="true" />
		<cfargument name="password" type="any" required="true" />
		
		<cfset logged_in_user = this.findOneByLoginAndPassword("#arguments.password#", "#arguments.login#")>
		<cfreturn logged_in_user>
	</cffunction>--->
	
</cfcomponent>
