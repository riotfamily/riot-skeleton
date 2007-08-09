<div class="box-frame ${positionClass}">
<div id="box${componentId}" class="box ${className}-box<#if image?exists> image-box</#if>">
	<@component.text key="title" tag="h3">Title</@component.text>
	<#if image?exists>
		<img src="${request.contextPath}${image}" />
	</#if>
	<div class="box-content">
	<@component.richtext key="content">
	<p>
	Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nulla enim justo, condimentum nec, rhoncus gravida, semper in, orci. 
	</p>
	<p>
	Vivamus quis massa. Morbi at justo et pede convallis.<br />
	</p>
	</@component.richtext>
	</div>
</div>
</div>
