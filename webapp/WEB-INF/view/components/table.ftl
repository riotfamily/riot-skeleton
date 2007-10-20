<#assign chars = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L',
		'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'] />
		
<table>
	<#if showHeadings>
		<thead>
			<tr>
				<#list 1..cols as col>
					<#assign cell=chars[col-1] />
					<#if col % 2 == 0><#assign thclass="odd" /><#else><#assign thclass="even" /></#if>
					<@inplace.text tag="th" key=cell class=thclass>${cell}</@inplace.text>
				</#list>
			</tr>
		</thead>
	</#if>
	<tbody>
		<#list 1..rows as row>
			<tr class="<#if row % 2 == 0>odd<#else>even</#if>">
				<#list 1..cols as col>
					<#assign cell=chars[col-1] + row />
					<#if col % 2 == 0><#assign tdclass="odd" /><#else><#assign tdclass="even" /></#if>
					<@inplace.text tag="td" key=cell class=tdclass>${cell}</@inplace.text>
				</#list>
			</tr>
		</#list>
	</tbody>
</table>