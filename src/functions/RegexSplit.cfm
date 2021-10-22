<cffunction name="RegexSplit" returntype="Array" output="false" >
	<cfargument name="Pattern"      type="String"  required_ />
	<cfargument name="Text"         type="String"  required_ />
	<cfargument name="Start"        type="Numeric" optional  />
	<cfargument name="Limit"        type="Numeric" default=0  hint="The maximum number of times a split is made (i.e. limit+1=max array size)"/>
	<cfargument name="GroupNames"   type="any"     default="" hint="Passed into Callback function if provided" />
	<cfargument name="Callback"     type="any"     optional />
	<cfargument name="CallbackData" type="Struct"  optional hint="Extra data which is passed in to callback function." />
	<cfargument name="Flags"        type="String"  optional />
	<cfreturn new Regex(ArgumentCollection=Arguments,FuncName="split").split(ArgumentCollection=Arguments) />
</cffunction>