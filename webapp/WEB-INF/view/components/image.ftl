<#assign class = "image-" + class?default("block") />
<#assign style = clear?if_exists?string("clear:both", "") />
<#assign defaultWidth = (class == "image-block")?string("100%", "100") />
<#if caption?has_content>
	<div class="labeled-image<#if class?has_content> ${class}</#if>"<#if style?has_content> style="${style}"</#if>>
		<@inplace.image key="image" alt=alt?if_exists maxWidth="auto" />
		<div class="caption">${caption}</div>
	</div>
<#else>
	<@inplace.image key="image" alt=alt?if_exists class=class style=style defaultWidth=defaultWidth maxWidth="auto" />
</#if>