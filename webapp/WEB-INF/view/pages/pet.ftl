<@template.extend file="default.ftl">
	<@template.block name="content">
		<h1 class="first">${currentPage.object.name}</h1>
		<img src="${c.resolve(currentPage.object.image.uri)}" width="${currentPage.object.image.width}" />
		<@inplace.componentList key="content"
			initial=["paragraph"] 
			valid=["paragraph","image","gallery/gallery"] />
	</@template.block>
</@template.extend>

