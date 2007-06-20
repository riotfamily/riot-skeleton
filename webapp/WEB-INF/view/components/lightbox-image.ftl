<#if image?exists>
	<a href="${request.contextPath}${image}" rel="lightbox[${parentId?if_exists}]" title="${title?if_exists}"
		style="background-image:url(${request.contextPath}${thumb})"></a>
<#elseif component.isEditMode()>
	<a href="javascript://" onclick="riot.editProperties(this)" class="riot-noimage">
		<div>No image set. Click here to upload an image.</div>
	</a>
</#if>
