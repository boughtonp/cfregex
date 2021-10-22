<cfif NOT isDefined('RegexCompile')>
	<cfinclude template="RegexCompile.cfm"/>
	<cfinclude template="RegexEscape.cfm"/>
	<cfinclude template="RegexFind.cfm"/>
	<cfinclude template="RegexMatch.cfm"/>
	<cfinclude template="RegexMatches.cfm"/>
	<cfinclude template="RegexQuote.cfm"/>
	<cfinclude template="RegexReplace.cfm"/>
	<cfinclude template="RegexSplit.cfm"/>
</cfif>