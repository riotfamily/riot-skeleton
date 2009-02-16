<#---
 - @param path A sequence of pages, starting with the top-most ancestor of the
 -		currently selected page. The last item in the sequence is the selected
 -		page itself.
 - @param level An integer value that specifies which level of the page 
 - 		hierarchy should be rendered. The number is used as index to the given 
 - 		path sequence.   
 -->
<#macro menu path=currentPage.ancestors, level=0>
	<#local items=[] />
	<#if (level < path?size)>
		<#--
		  - The level does not exceed the length of the given path. This means
		  - we have to render the siblings of the expanded page at the specifed
		  - level. 
		  -->
		<#local expandedPage = path[level] />
		<#local items=expandedPage.siblings />
	<#elseif level == path?size>
		<#-- 
		  - The level is greater than the path length. This means we have to 
		  - render the children of the selected page:
		  -->
		<#local expandedPage = path[level-1] />
		<#local items=expandedPage.childPages />
	</#if>
	<#if items?has_content>
		<ul>
			<#list items as page>
				<li>
					<@pages.link page=page />
					<#if page == expandedPage>
						<#-- The page is expanded - render the next level -->
                        <@menu path=path level=level+1 />
					</#if>
				</li>
			</#list>
		</ul>
	</#if>
</#macro>

<#-- Render the menu -->
<@menu />