<@menu path=page.currentPage().ancestors />

<#macro menu path, level=0>
	<#local pages=[] />
	<#if level lt path?size>
		<#local expandedPage = path[level] />
		<#local pages=expandedPage.siblings />
	<#elseif level == path?size>
		<#local expandedPage = path[level-1] />
		<#local pages=expandedPage.childPages />
	</#if>
	<#if pages?has_content>
		<ul>
			<#list pages as p>
				<#if page.visible(p)>
					<li>
						<@page.link page=p />
						<#if p == expandedPage>
	                        <@menu path=path level=level+1 />
						</#if>
					</li>
				</#if>
			</#list>
		</ul>
	</#if>
</#macro>
