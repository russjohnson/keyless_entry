<cfcomponent extends="Controller">
	
	<cffunction name="init">
		<cfset filters(through="loginRequired")>
	</cffunction>
	
	<!--- roles/index --->
	<cffunction name="index">
		<cfset title= "Listing Role" />
		<cfset metaTitle = 'Chelsea Piers Class System - Role Manager' />
		<cfset roles = model("Role").findAll()>
	</cffunction>
	
	<!--- roles/show/key --->
	<cffunction name="show">
		
		<!--- Check if the record exists --->
		<cftry>
	    	<cfset role = model("Role").findByKey(params.key)>
	    	
		    <cfcatch type="Wheels.RecordNotFound">
		        <cfset flashInsert(message="Role #params.key# was not found")>
		        <cfset redirectTo(back=true)>
		    </cfcatch>
		</cftry>
			
	</cffunction>
	
	<!--- roles/new --->
	<cffunction name="new">
		<cfset title = 'Add Role' />
		<cfset metaTitle = 'Chelsea Piers Class System - Add Role' />
		<cfset role = model("Role").new()>
	</cffunction>
	
	<!--- roles/edit/key --->
	<cffunction name="edit">
		<cfset title = 'Edit Role' />
		<cfset metaTitle = 'Chelsea Piers Class System - Edit Role' />
		<!--- Check if the record exists --->
		<cftry>
	    	<cfset role = model("Role").findByKey(params.key)>
	    	
		    <cfcatch type="Wheels.RecordNotFound">
		        <cfset flashInsert(message="Role #params.key# was not found")>
		        <cfset redirectTo(back=true)>
		    </cfcatch>
		</cftry>
		
	</cffunction>
	
	<!--- roles/create --->
	<cffunction name="create">
		<cfset role = model("Role").new(params.role)>
		
		<!--- Verify that the role creates successfully --->
		<cfif role.save()>
			<cfset flashInsert(success="The role was created successfully.")>
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset title = 'Add Role' />
			<cfset metaTitle = 'Chelsea Piers Class System - Add Role' />
			<cfset flashInsert(error="There was an error creating the role.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>
	
	<!--- roles/update --->
	<cffunction name="update">
		<cfset role = model("Role").findByKey(params.role.id)>
		
		<!--- Verify that the role updates successfully --->
		<cfif role.update(params.role)>
			<cfset flashInsert(success="The role was updated successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset title = 'Edit Role' />
			<cfset metaTitle = 'Chelsea Piers Class System - Edit Role' />
			<cfset flashInsert(error="There was an error updating the role.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>
	
	<!--- roles/delete/key --->
	<cffunction name="delete">
		<cfset role = model("Role").findByKey(params.key)>
		
		<!--- Verify that the role deletes successfully --->
		<cfif role.delete()>
			<cfset flashInsert(success="The role was deleted successfully.")>	
            <cfset redirectTo(action="index")>
		<!--- Otherwise --->
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the role.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>
	
</cfcomponent>
