<h1>Showing role</h1>

<cfoutput>

					<p><label>Id</label> <br />
						#role.id#</p>
				
					<p><label>Name</label> <br />
						#role.name#</p>
				

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this role", action="edit", key=role.id)#
</cfoutput>
