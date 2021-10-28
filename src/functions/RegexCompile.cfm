<cffunction name="RegexCompile" returntype="Regex" output="false">
	<cfargument name="Pattern" type="String" required=true />
	<cfargument name="Flags"   type="String" optional />
	<cfreturn createObject("component","Regex").init(ArgumentCollection=Arguments) />
</cffunction>