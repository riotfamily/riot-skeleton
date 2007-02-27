<#if caption?has_content>
	<div class="labeled-image<#if class?exists> image-${class}</#if>" style="width:${imageWidth}px<#if clear?if_exists>;clear:both</#if>">
		<@renderImage />
		<div class="caption">${caption}</div>
	</div>
<#else>
	<@renderImage true />
</#if>

<#macro renderImage renderStyleAttrs=false>
	<#if image?exists>
	<a href="${request.contextPath}${image}" rel="lightbox${parentId?if_exists}" style="background-image:url(${request.contextPath}${thumb});<#if renderStyleAttrs && clear?if_exists>clear:both</#if>" <#if renderStyleAttrs && class?exists> class="image-${class}"</#if>></a>
	<#else>
	<a href="javascript://" onclick="riot.editProperties(this)">
			No image set. Click here to upload an image.
	</a>
	</#if>
</#macro>
