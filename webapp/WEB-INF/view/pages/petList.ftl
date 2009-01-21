<@template.extend file="default.ftl">
	<@template.block name="content">
		<#assign Pet = statics["org.riotfamily.example.petstore.model.Pet"] />
		<ul>
			<#list Pet.loadAll() as pet>
				<li>${pet.name}</li>
			</#list>
		</ul>
	</@template.block>
</@template.extend>

