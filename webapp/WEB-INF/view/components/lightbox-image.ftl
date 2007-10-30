<#if image?exists>
	<a href="${request.contextPath}${image}" rel="lightbox[${parentId?if_exists}]" title="${title?if_exists}"
		style="background-image:url(${request.contextPath}${thumb})"></a>
<#elseif inplace.editMode>
	<div class="riot-noimage"></div>
</#if>
