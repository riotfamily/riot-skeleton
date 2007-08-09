<div id="topnav">
	<#assign activePage = page.currentPage().ancestors[0] />
	<#assign pages = page.pageAndSiblings(activePage) />
	<#if pages?has_content>
		<#list pages as p>
			<#if p == activePage>
				<@page.link page=p class="active" />
			<#else>
				<@page.link page=p />
			</#if>
			<#if p_has_next>|</#if>
		</#list>
	</#if>
</div>