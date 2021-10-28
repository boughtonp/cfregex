<cffunction name="RegexEscape" returntype="String" output="false" >
	<cfargument name="Pattern"    type="String" required=true />
	<cfargument name="ReturnType" type="String" default=REGEX hint="regex|class" />
	<cfargument name="Flags"      type="String" optional />
	<cfreturn new Regex(ArgumentCollection=Arguments,FuncName="escape").escape(ArgumentCollection=Arguments) />
</cffunction>