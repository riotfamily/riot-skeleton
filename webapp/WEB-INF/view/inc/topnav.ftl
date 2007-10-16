<@component.componentSet>
<div id="topnav">
	<#assign activePage = page.ancestors()[0] />
	<#list page.pageAndSiblings(activePage) as p>
		<#if p == activePage>
			<@page.link page=p class="active" />
		<#else>
			<@page.link page=p />
		</#if>
		<#if p_has_next>|</#if>
	</#list>
</div>
</@component.componentSet>