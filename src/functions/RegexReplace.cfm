<cffunction name="RegexReplace" returntype="String"  output="false" >
	<cfargument name="Pattern"      type="String"  required_ />
	<cfargument name="Text"         type="String"  required_ />
	<cfargument name="Replacement"  type="Any"     optional hint="String,Array,Function"/>
	<cfargument name="Start"        type="Numeric" optional  />
	<cfargument name="Limit"        type="Numeric" default=0 />
	<cfargument name="GroupNames"   type="any"     default="" hint="Passed into Callback function if provided" />
	<cfargument name="CallbackData" type="Struct"  optional   hint="Extra data which is passed in to callback function." />
	<cfargument name="Flags"        type="String"  optional />
	<cfreturn new Regex(ArgumentCollection=Arguments,FuncName="replace").replace(ArgumentCollection=Arguments) />
</cffunction>