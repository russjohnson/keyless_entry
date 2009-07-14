<h1>Keyless Entry</h1>

<p>This plugin will generate common user authentication code for your CFWheels application.</p>

<h2>Current Features</h2>

<ul>
  <li>Generates basic controllers, models and views to get up and running quickly.</li>
  <li>Provides basic user authentication.</li>
  <li>Provides a sign-up form to allow new user creation.</li>
  <li>Adds methods to your Wheels app to set as filters to require login.</li>
  <li>Uses email validation prior to activation via email.</li>
</ul>

<cfif structKeyExists(URL, 'generateCode')>
  
  <h2>Creating Files...</h2>
  
  <cfoutput>
  	<p><tt>#generateAuthCode()#</tt></p>
  </cfoutput>
  
  <h2>Next Step</h2>
  
  <p>
    Login to your database and create the appropriate tables using the code below:
    
    blah blah blah
  </p>
  
<cfelse>
  
  <h2>Generate Code</h2>
  
  <!--- Form --->
  <cfform action="#CGI.script_name & '?' & CGI.query_string#">
    
    <input type="hidden" name="generateCode" value="true">
	
  	<p><cfinput type="submit" name="btnSubmit" value="Generate"></p>
	
  </cfform>
  
</cfif>


<a href="<cfoutput>#cgi.http_referer#</cfoutput>"><<< Go Back</a>