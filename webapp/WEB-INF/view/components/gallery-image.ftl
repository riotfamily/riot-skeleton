<#if image?exists>
	<a href="${request.contextPath}${image.uri}" rel="shadowbox<#if parent??>[${parent.id}]</#if>" 
		<@common.attribute "title" title />
		<@common.attribute "class" inplace.moduloClass(4) />
		style="background-image:url(${request.contextPath}${image.thumb.uri})"></a>
<#elseif inplace.editMode>
	<a href="#"<@common.attribute "class" "riot-noimage " + inplace.moduloClass(4) />></a>
</#if>
