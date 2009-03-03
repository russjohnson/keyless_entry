<cfcomponent extends="Controller">
	
	<cffunction name="init">
		<cfset filters(through="loginRequired", except="new,create")>
	</cffunction>
	
	<cffunction name="index">
		<cfset users = model("user").findAll(order="login") />
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
	
	<cffunction name="edit">
		<!--- Check if the record exists --->
		<cftry>
	    	<cfset user = model("User").findByKey(params.key)>
	    	
		    <cfcatch type="Wheels.RecordNotFound">
		        <cfset flashInsert(message="User #params.key# was not found")>
		        <cfset redirectTo(back=true)>
		    </cfcatch>
		</cftry>
		
		<cfset roles = model("roles").findAll(order="name")>
	</cffunction>
	
	<cffunction name="update">
		<cfset user = model("User").findByKey(params.user.id)>
		
		<!--- Verify that the user updates successfully --->
		<cfif user.update(params.user)>
			<!--- check to see if the user profile is the logged in user and update the session instance --->
			<cfif session.currentUser.id eq user.id>
				<cfset session.currentUser = user>
			</cfif>
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
