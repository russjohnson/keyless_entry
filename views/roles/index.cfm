<table class="table">
  <tr>
    
		<th>Id</th>
				
		<th>Name</th>
				
		<th>Actions</th>
  </tr>
  <cfoutput query="roles">
  	<tr>
	    
		<td>
			#id#
		</td>
				
		<td>
			#name#
		</td>
				
		<td>
			#linkTo(text='Show', action='show', key=id)# | 
			#linkTo(text='Edit', action='Edit', key=id)# | 
			#linkTo(text='Delete', action='Delete', key=id, confirm='Are you sure?')#
		</td>            
	  </tr>
  </cfoutput>
</table>
