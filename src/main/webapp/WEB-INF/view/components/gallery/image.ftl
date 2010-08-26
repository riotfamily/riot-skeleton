<#--
@icon picture
@name Image
-->
Path: ${this.getPath()}
<#if image??>
	<a href="${c.resolve(image.uri)}" rel="shadowbox" 
		style="background-image:url(${c.resolve(media.thumb(image).uri)})"></a>
<#elseif inplace.editMode>
	<a href="#" style="width:40px;height:40px;display:block;float:left" class="riot-noimage " + inplace.moduloClass(4)></a>
</#if>
 