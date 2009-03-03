<h1>Create new role</h1>

<cfoutput>

	#errorMessagesFor("role")#

	#startFormTag(action="create", class="form")#

		
		<div class="group">
			#hiddenField(objectName='role', property='id')#
		</div>					
		
		<div class="group">
			#textField(objectName='role', property='name', class='text', label='Name', labelClass='title')#
		</div>					
		
		<div class="clear"></div>
		<div class="group navform">
			#submitTag()#
		</div>
	#endFormTag()#
	

#linkTo(text="Return to the listing", action="index")#
</cfoutput>
