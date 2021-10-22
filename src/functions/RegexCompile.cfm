<cffunction name="RegexCompile" returntype="Regex" output="false">
	<cfargument name="Pattern" type="String" required_ />
	<cfargument name="Flags"   type="String" optional />
	<cfreturn createObject("component","Regex").init(ArgumentCollection=Arguments) />
</cffunction>