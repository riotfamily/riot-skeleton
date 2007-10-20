<div id="topnav">
	<#assign activePage = currentPage.ancestors[0] />
	<#list activePage.siblings as page>
		<#if page == activePage>
			<@pages.link page=page class="active" />
		<#else>
			<@pages.link page=page />
		</#if>
		<#if page_has_next>|</#if>
	</#list>
</div>
