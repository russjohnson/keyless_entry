<cfoutput>

	#errorMessagesFor("user")#

	#startFormTag(action="update", class="form")#
		
		<div class="group">
			#hiddenField(objectName='user', property='id')#
		</div>	
		
		#includePartial("_form")#			

		<div class="clear"></div>
		<div class="group navform">
			#submitTag()#
		</div>
		
	#endFormTag()#
	

#linkTo(text="Return to the listing", action="index")#
</cfoutput>
