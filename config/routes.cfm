<!--- setup the admin routes for allowing ADMIN in the URL
<cfset addRoute(name="adultClasses", pattern="admin/adultclasses/[action]", controller="adultClasses", action="index")>
<cfset addRoute(name="adultClassIndex", pattern="admin/adultclasses", controller="adultClasses", action="index")>
 --->

<!--- default route to home page --->
<cfset addRoute(name="home", pattern="", controller="sessions", action="new")>
	
<!--- authentication routes --->
<cfset addRoute(name="login", pattern="/login", controller="sessions", action="new") />
<cfset addRoute(name="logout", pattern="/logout", controller="sessions", action="delete") />
<cfset addRoute(name="signup", pattern="/signup", controller="users", action="new") />	
