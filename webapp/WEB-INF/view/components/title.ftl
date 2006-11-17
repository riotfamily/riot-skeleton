<#if anchor?has_content><a name="${anchor}"></a></#if>
<#if showHeadline && showSubline><div class="title"></#if>
	<#if showHeadline><@riot.text key="headline" tag="h1">Headline 1</@riot.text></#if>
	<#if showSubline><@riot.text key="subline" tag="h2">Headline 2</@riot.text></#if>
<#if showHeadline && showSubline></div></#if>
