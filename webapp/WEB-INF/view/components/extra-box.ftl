<div class="box-frame ${positionClass}">
<div id="box${componentId}" class="box ${className}-box<#if image?exists> image-box</#if>">
	<@riot.text key="title" tag="div" class="title">Title</@riot.text>
	<#if image?exists>
		<img src="${request.contextPath}${image}" />
	</#if>
	<div class="content">
	<@riot.inplace key="content">
	<p>
	Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nulla enim justo, condimentum nec, rhoncus gravida, semper in, orci. 
	</p>
	<p>
	Vivamus quis massa. Morbi at justo et pede convallis.<br />
	</p>
	</@riot.inplace>
	</div>
</div>
</div>
<script language="JavaScript">
OnePxCorner.addTo('box${componentId}','tl,tr,br,bl','#4c4944');
</script>