<#if image?exists>
	<a href="${c.resolve(image.uri)}" class="gallery-image" rel="shadowbox<#if parent??>[${parent.id}]</#if>" 
		<@c.attribute "title" title />
		<@c.attribute "class" inplace.moduloClass(4) />
		style="background-image:url(${c.resolve(image.thumb.uri)})"></a>
<#elseif inplace.editMode>
	<a href="#"<@c.attribute "class" "riot-noimage " + inplace.moduloClass(4) />></a>
</#if>
