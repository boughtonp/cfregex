<cffunction name="RegexMatch" returntype="Array" output="false" >
	<cfargument name="Pattern"      type="String"   required=true />
	<cfargument name="Text"         type="String"   required=true />
	<cfargument name="Start"        type="Numeric"  optional  />
	<cfargument name="Limit"        type="Numeric"  default=0 />
	<cfargument name="ReturnType"   type="String"   default="match" hint="match|groups|namedgroups|full" />
	<cfargument name="GroupNames"   type="any"      default="" hint="Required if returnType=NamedGroup." />
	<cfargument name="Callback"     type="any"      optional   hint="Function called to determine if a match is included in results." />
	<cfargument name="CallbackData" type="Struct"   optional   hint="Extra data which is passed in to callback function." />
	<cfargument name="Flags"        type="String"   optional />
	<cfreturn new Regex(ArgumentCollection=Arguments,FuncName="match").match(ArgumentCollection=Arguments) />
</cffunction>