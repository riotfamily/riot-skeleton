<@menu path=page.ancestors />
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
						<@text page=p key="title" tag="div" class="riot-component">${p.pathComponent}</@text>
                        <@menu path=path level=level+1 />
					<#else>
						<@text page=p key="title" tag="a" href=p.path class="riot-component">${p.pathComponent}</@text>
					</#if>
				</li>
			</#list>
		</ul>
	</#if>
</#macro>

<#macro text page, key, tag="" attributes ...>
	<#local props = page.versionContainer.latestVersion.properties />
	<#local attrs = {"riot:containerId": page.versionContainer.id} + attributes />
	<#if page.versionContainer.previewVersion?exists>
		<#local attrs = attrs + {"riot:dirty": "true"} />	
	</#if>
	<@edit.editable key=key scope=props editor="text" attributes=attrs><#nested /></@edit.editable>
</#macro>
