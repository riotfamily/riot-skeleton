<@template.extend file="default.ftl">
	<@template.block name="content">
		<#assign pets = Pet.loadAll() />
		<#if pets?has_content>
			<ul>
				<#list pets as pet>
					<li>${pet.name}</li>
				</#list>
			</ul>
		<#else>
			No pets found.
		</#if>
	</@template.block>
</@template.extend>

