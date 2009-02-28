<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />	
</head>
<body>
	<cfoutput>
		
		<div>
			#linkTo(text="New User", controller="users", action="new")# | 
			#linkTo(text="Logout", route="logout")# | 
			#linkTo(text="login", route="login")#
		</div>
		
		<cfif flashKeyExists('success')>
			<br/>
			<div class="flash-messages success">
				<p>#flash('success')#</p>
			</div>
			<cfelseif flashKeyExists('error')>
			<br/>
			<div class="flash-messages error">
				<p>#flash('error')#</p>
			</div>
			<cfelseif flashKeyExists('message')>
			<br/>
			<div class="flash-messages message">
				<p>#flash('message')#</p>
			</div>
		</cfif>
    
		#contentForLayout()#
		
	</cfoutput>
	
	<p>
		<cfdump var="#session#" />
	</p>

</body>
</html>