<cffunction name="RegexQuote" returntype="String" output="false" >
	<cfargument name="Pattern" type="String" required=true />
	<cfargument name="Flags"   type="String" optional />
	<cfreturn new Regex(ArgumentCollection=Arguments,FuncName="quote").quote(ArgumentCollection=Arguments) />
</cffunction>