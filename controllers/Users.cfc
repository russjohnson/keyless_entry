<cfcomponent extends="Controller">
	
	<cffunction name="init">
		<cfset filters(through="restrictAccess")>
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
	
	<cffunction name="new">
		<cfset user = model("User").new()>
	</cffunction>
	
	<cffunction name="edit">
		<!--- Check if the record exists --->
		<cftry>
	    	<cfset user = model("User").findByKey(params.key)>
	    	
		    <cfcatch type="Wheels.RecordNotFound">
		        <cfset flashInsert(message="User #params.key# was not found")>
		        <cfset redirectTo(back=true)>
		    </cfcatch>
		</cftry>
		
	</cffunction>
	
	<cffunction name="create">
		<cfset user = model("User").new(params.user)>
			
		<!--- Verify that the user creates successfully --->
		<cfif user.save()>
			<cfset flashInsert(success="The user was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error creating the user.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<cffunction name="update">
		<cfset user = model("User").findByKey(params.user.id)>
		
		<!--- Verify that the user updates successfully --->
		<cfif user.update(params.user)>
			<cfset flashInsert(success="The user was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<cfelse>
			<cfset flashInsert(error="There was an error updating the user.")>
			<cfset renderPage(action="edit")>
		</cfif>
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
