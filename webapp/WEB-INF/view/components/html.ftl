<#if html?exists>
${html}
<#else>
<div class="riot-noimage">
	<p>
		<a href="javascript://" onclick="riot.editProperties(this)">
		Click here to enter plain HTML code.
		</a>
	</p>
</div>
</#if>