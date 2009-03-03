<h1>Showing user</h1>

<cfoutput>

	<p><label>Id</label> <br />
		#user.id#</p>

	<p><label>Username</label> <br />
		#user.login#</p>

	<p><label>Email</label> <br />
		#user.email#</p>
		
	<p>
		<cfdump var="#user.hasRole('administrator')#">
	</p>
				

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this user", action="edit", key=user.id)#
</cfoutput>

<cfdump var="#user#"> 
