<cfcomponent output="false">

	<cffunction name="init">
		<cfset this.version = "0.9">
		<cfreturn this>
	</cffunction>
	
	<cfinclude template="dataTypeConvert.cfm">
	<cfinclude template="rendering.cfm">
	
	<cffunction name="requestFormat" access="public" returnType="string" hint="Determinates the type of request to execute" output="false">
		
		<cfset var loc = {}>
		
		<!--- Ensure that a format is specifed on every request --->
		<cfparam name="url.format" type="string" default="">
		
		<!--- Is  this request JSON? --->
		<cfif cgi.http_accept IS "text/json" OR url.format EQ "json"> 
			<cfset loc.format = "json">
		
		<!--- Is  this request XML? --->
		<cfelseif cgi.http_accept IS "text/xml" OR url.format EQ "xml"> 
			<cfset loc.format = "xml">
		
		<!--- Is  this request CFML? --->
		<cfelse>
			<cfset loc.format = "cfml">
		</cfif> 
		
		<cfreturn loc.format>
	</cffunction>
	
</cfcomponent>