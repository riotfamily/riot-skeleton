<#if image?exists>
<img src="${request.contextPath}${image}" alt="${alt?if_exists}" <#if class?exists>class="${class}"</#if><#if clear?if_exists> style="clear:both"</#if> />
<#else>
<div class="riot-noimage">
	<a href="javascript://" onclick="riot.editProperties(this)">
	No image set. Click here to upload an image.
	</a>
</div>
</#if>