<@template.extend file="pages/wide.ftl">
	<@template.block name="header" />
	<@template.block name="content">
		<h1><@c.message "choose.site">Choose your Site</@c.message></h1>
		<ul class="country-chooser">
			<#list sites as site>
				<li style="background-image:url(${c.urlForHandler('countryFlagController', site)})">
					<a href="${c.url(site.makeAbsolute(""))}/">${site.name!}</a>
				</li>
			</#list>
		</ul>		
	</@template.block>
</@template.extend>
