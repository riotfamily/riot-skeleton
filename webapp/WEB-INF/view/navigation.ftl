<@menu path=currentPage.ancestors />
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
				<li>
					<#if p == expandedPage>
						<@page.text page=p key="title" tag="div">${p.pathComponent}</@page.text>
                        <@menu path=path level=level+1 />
					<#else>
						<@page.text page=p key="title" tag="a" href=page.url(p)>${p.pathComponent}</@page.text>
					</#if>
				</li>
			</#list>
		</ul>
	</#if>
</#macro>
