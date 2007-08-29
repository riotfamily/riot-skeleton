<@component.componentSet>
	<@menu path=page.currentPage().ancestors />
</@component.componentSet>

<#macro menu path, level=0>
	<#local pages=[] />
	<#if level lt path?size>
		<#local expandedPage = path[level] />
		<#local pages=page.pageAndSiblings(expandedPage) />
	<#elseif level == path?size>
		<#local expandedPage = path[level-1] />
		<#local pages=page.visiblePages(expandedPage.childPages) />
	</#if>
	<#if pages?has_content>
		<ul>
			<#list pages as p>
				<li>
					<@page.link page=p />
					<#if p == expandedPage>
                        <@menu path=path level=level+1 />
					</#if>
				</li>
			</#list>
		</ul>
	</#if>
</#macro>
