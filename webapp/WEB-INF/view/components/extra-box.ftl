<div class="box-frame ${positionClass}">
<div id="box${componentId}" class="box ${className}-box<#if image?exists> image-box</#if>">
	<@riot.text key="title" tag="h3">Title</@riot.text>
	<#if image?exists>
		<img src="${request.contextPath}${image}" />
	</#if>
	<div class="content">
	<@riot.richtext key="content">
	<p>
	Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nulla enim justo, condimentum nec, rhoncus gravida, semper in, orci. 
	</p>
	<p>
	Vivamus quis massa. Morbi at justo et pede convallis.<br />
	</p>
	</@riot.richtext>
	</div>
</div>
</div>
