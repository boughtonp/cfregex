<!---
	WHAT IS THIS?

	Railo support custom tags written as CFCs, providing more
	flexibility than traditional CFM-based custom tag, and also
	allowing a CFC to act as both a tag and an object.

	ACF and OBD do not support CFC-based custom tags (yet?), so this
	traditional custom tag will act as a proxy to a CFC of the same
	name, calling appropriate functions to replicate the behaviour
	of a CFC-based tag (not all features can be implemented).

	For details on Railo's core implementation, see:
	http://wiki.getrailo.org/wiki/3-2:CFC_based_Custom_Tags

	For the latest version of this file, see:
	https://gist.github.com/1003819


	LICENSING:

	This file may be licensed under the following licenses:

		GPL v3 or any later version:
			http://www.gnu.org/licenses/gpl-3.0.html

		LGPL v2.1 or any later version:
			http://www.opensource.org/licenses/lgpl-2.1.php

		Apache License v2:
			http://www.apache.org/licenses/LICENSE-2.0

	It is hoped that whichever license used, any improvements to this
	file are published, so that all CFML programmers can benefit.


	NOT SUPPORTED:

		* Parent tags
		    (not possible to implement?)

		* Re-evaluating body
		    (return from onEndTag() is ignored; too much effort)

		* Modification of ThisTag.GeneratedContent
		    (no known way to retrieve value from onEndTag?)


	NOT YET IMPLEMENTED:

		* Static Metadata validation
		    (should be possible, but not needed now).

--->
<cftry>
	<cfswitch expression=#ThisTag.ExecutionMode#>

		<cfcase value="START">
			<cfset ThisTag.CfcName = ListLast(getCurrentTemplatePath(),'/\').replaceAll('\.cfm$','') />
			<cfset ThisTag.Object = createObject('component',ThisTag.CfcName) />

			<cfif StructKeyExists(ThisTag.Object,'init')>
				<!--- No support for parent CFCs --->
				<cfset ThisTag.Object.init( HasEndTag = ThisTag.HasEndTag ) />
			</cfif>

			<!--- TODO: Validate metadata --->

			<cfif StructKeyExists(ThisTag.Object,'onStartTag')>
				<cfset ThisTag.RunEndTag = ThisTag.Object.onStartTag
					( Attributes = Attributes
					, Caller     = Caller
					) />
			<cfelse>
				<cfset ThisTag.RunEndTag = ThisTag.HasEndTag />
			</cfif>

			<cfif (NOT ThisTag.HasEndTag) AND StructKeyExists(ThisTag.Object,'onFinally')>
				<cfset ThisTag.Object.onFinally() />
			</cfif>
		</cfcase>

		<cfcase value="END">
			<cfif ThisTag.RunEndTag AND StructKeyExists(ThisTag.Object,'onEndTag')>
				<cfset ThisTag.Object.onEndTag
					( Attributes       = Attributes
					, Caller           = Caller
					, GeneratedContent = ThisTag.GeneratedContent
					) />
				<!--- TODO: Possible to obtain value from function? --->
				<cfset ThisTag.GeneratedContent = '' />
			</cfif>
			<cfif StructKeyExists(ThisTag.Object,'onFinally')>
				<cfset ThisTag.Object.onFinally() />
			</cfif>
		</cfcase>

	</cfswitch>
<cfcatch>
	<!--- INFO: Don't output content on error. --->
	<cfset ThisTag.GeneratedContent = '' />

	<cfif StructKeyExists(ThisTag,'Object')>

		<cfset ThisTag.ErrorRethrow =
			StructKeyExists(ThisTag.Object,'onError')
			AND ThisTag.Object.onError(cfcatch)
			OR NOT StructKeyExists(ThisTag.Object,'onError')
		/>

		<cfif StructKeyExists(ThisTag.Object,'onFinally')>
			<cfset ThisTag.Object.onFinally() />
		</cfif>

		<cfif ThisTag.ErrorRethrow >
			<cfrethrow />
		</cfif>
	<cfelse>
		<cfrethrow />
	</cfif>
</cfcatch>
</cftry>