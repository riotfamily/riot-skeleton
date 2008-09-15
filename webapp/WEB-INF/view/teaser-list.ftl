<@template.extend file="default.ftl">
	<@template.block name="content">
		<ul class="teasers">
			<#list currentPage.childPages as child>
				<li>
					<@pages.use page=child form="page-teaser">
						<@inplace.text tag="h1" key="teaser-title" class="${(child_index == 0)?string('first','')}">${child.title}</@inplace.text>
						<@inplace.richtext key="teaser-text">Teaser text</@inplace.richtext> 
					</@pages.use>
				</li>
			</#list>
		</ul>
	</@template.block>
	<@template.block name="extra" />
</@template.extend>