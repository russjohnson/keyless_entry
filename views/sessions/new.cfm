<h1>Login</h1>

<cfoutput>
	#startFormTag(action="create")#

		<p>#textFieldTag(name="login", label="Username")#</p>

		<p>#passwordFieldTag(name="password", label="Password")#</p>
		
		<p>#checkBoxTag(name="rememberMe", label="Remember Me")#</p>

		<p>#submitTag(value="Login")#</p>
		
		<p>Don't have an account? #linkTo(text="Sign up!", route="signup")#</p>

	#endFormTag()#
</cfoutput>