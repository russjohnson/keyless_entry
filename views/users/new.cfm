<cfoutput>

	#errorMessagesFor("user")#

	#startFormTag(action="create")#

		<div>
			#textField(objectName='user', property='login', label='Username <em>*</em>')#
		</div>	
		
		<div>
			#passwordField(objectName='user', property='password', label='Password <em>*</em>')#
		</div>	

		<div>
			#passwordField(objectName='user', property='passwordConfirmation', label='Confirm_Password <em>*</em>')#
		</div>
		
		<div>
			#submitTag(value="Sign Up")#
		</div>
	#endFormTag()#
	
</cfoutput>
