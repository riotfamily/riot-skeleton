<@menu />

<#macro menu path=currentPage.ancestors, level=0>
	<#local items=[] />
	<#if (level < path?size)>
		<#local expandedPage = path[level] />
		<#local items=expandedPage.siblings />
	<#elseif level == path?size>
		<#local expandedPage = path[level-1] />
		<#local items=expandedPage.childPages />
	</#if>
	<#if items?has_content>
		<ul>
			<#list items as page>
				<li>
					<@pages.link page=page />
					<#if page == expandedPage>
                        <@menu path=path level=level+1 />
					</#if>
				</li>
			</#list>
		</ul>
	</#if>
</#macro>
