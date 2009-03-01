<cfcomponent extends="Controller">
	
	<cffunction name="init">
		<cfset filters(through="loginRequired", except="new,create")>
	</cffunction>
	
	<cffunction name="index">
	</cffunction>
	
	<cffunction name="show">
		<!--- Check if the record exists --->
		<cftry>
	    	<cfset user = model("User").findByKey(params.key)>
	    	
		    <cfcatch type="Wheels.RecordNotFound">
		        <cfset flashInsert(message="User #params.key# was not found")>
		        <cfset redirectTo(back=true)>
		    </cfcatch>
		</cftry>
	</cffunction>
	
	<cffunction name="delete">
		<cfset user = model("User").findByKey(params.key)>
		
		<!--- Verify that the user deletes successfully --->
		<cfif user.delete()>
			<cfset flashInsert(success="The user was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the user.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
