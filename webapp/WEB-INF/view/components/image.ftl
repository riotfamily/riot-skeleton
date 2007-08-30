<#assign class = class?exists?string("image-" + class?if_exists, "") />
<#assign style = clear?if_exists?string("clear:both", "") />
<#if caption?has_content>
	<div class="labeled-image<#if class?has_content> ${class}</#if>"<#if style?has_content> style="${style}"</#if>>
		<@component.image key="image" alt=alt?if_exists />
		<div class="caption">${caption}</div>
	</div>
<#else>
	<@component.image key="image" alt=alt?if_exists class=class style=style />
</#if>