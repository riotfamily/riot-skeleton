<#assign class = "image-" + class?default("block") + " " + inplace.moduloClass(3) />
<#if caption?has_content>
	<div class="labeled-image ${class}"<#if image??> style="width:${image.width}px"</#if>>
		<@inplace.image key="image" alt=alt! maxWidth="auto" />
		<div class="caption">${caption}</div>
	</div>
<#else>
	<@inplace.image key="image" alt=alt! class=class defaultWidth="500" maxWidth="auto" />
</#if>