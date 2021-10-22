<cffunction name="RegexFind" returntype="Array" output="false" >
	<cfargument name="Pattern"    type="String"  required_ />
	<cfargument name="Text"       type="String"  required_ />
	<cfargument name="Start"      type="Numeric" default=1 />
	<cfargument name="Limit"      type="Numeric" default=0 />
	<cfargument name="ReturnType" type="String"  default="pos" />
	<cfargument name="Flags"      type="String"  optional />
	<cfreturn new Regex(ArgumentCollection=Arguments,FuncName="find").find(ArgumentCollection=Arguments) />
</cffunction>