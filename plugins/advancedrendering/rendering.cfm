<cffunction name="renderJSON" access="public" returnType="void" hint="Renders the request as JSON" output="false">
	<cfargument name="query" type="query" required="true" hint="Query to convert to JSON">
	<cfargument name="serializeQueryByColumns" type="boolean" required="false" default="false" hint="Creates an object that corresponds to WDDX query format">
	
	<cfset var loc = {}>
	
	<cfset loc.result = SerializeJSON(arguments.query, arguments.serializeQueryByColumns)>
			
	<cfsetting showdebugoutput="false" /> 
	<cfcontent type="text/json"/> 
	<cfset renderText(loc.result) />
	
</cffunction>

<cffunction name="renderXML" access="public" returnType="void" hint="Renders the request as XML" output="false">
	<cfargument name="query" type="query" required="true" hint="Query to convert to XML">
	
	<cfset var loc = {}>
	
	<cfset loc.result = queryToXML(arguments.query) /> 
	<cfcontent type="text/xml"/> 
	<cfset renderText(loc.result) /> 

</cffunction>