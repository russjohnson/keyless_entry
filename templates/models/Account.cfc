<cfcomponent extends="Model">
  
  <cffunction name="init">
    <cfset hasMany(name="users")>
    <cfset validatesPresenceOf(property="name" , message="The name of the account is required.")>
  </cffunction>
  
</cfcomponent>