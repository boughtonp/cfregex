<cffunction name="RegexMatches" returntype="any" output="false" >
	<cfargument name="Pattern"    type="String" required=true />
	<cfargument name="Text"       type="String" required=true />
	<cfargument name="ReturnType" type="String" optional hint="exact,partial,start,end,count" />
	<cfargument name="Flags"      type="String" optional />
	<cfreturn new Regex(ArgumentCollection=Arguments,FuncName="matches").matches(ArgumentCollection=Arguments) />
</cffunction>